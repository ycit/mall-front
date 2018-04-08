var template = '<ul class="pagination hide"><li><a href="javascript:void(0)">«</a></li><li><a href="javascript:void(0)">»</a></li></ul>';//页码显示
var cache = {};

var request = function ($dom, page, fun) {
    var settings = cache[$dom.data('uuid')];//获取数据
    settings.showConfig && settings.showConfig.$notData && settings.showConfig.$notData.removeClass('active');//有数据则将id为notData的标签隐藏
    if (settings.showConfig.$allBtn) {//如果设置了该属性
        settings.showConfig.$allBtn.html('<i class="fa fa-square-o"></i> 全选');//添加全选按钮
        settings.showConfig.$allBtn.data('checked', true);//附加数据
    }
    var data = getArgs($dom, page);
    utils.myAjax[settings.method](settings.url, data, function (response) {
        handle(response, $dom, page);
        fun && fun(response);
    }, function (XMLHttpRequest, textStatus, errorThrown) {
        if (XMLHttpRequest.status == 200) {
            if (page > 0) {
                request($dom, page - 1, fun);
                return;
            }
            $dom.find('.pagination').addClass('hide');
            settings.showConfig && $(settings.showConfig.target).empty();
            settings.showConfig && settings.showConfig.callback && settings.showConfig.callback();
            settings.callback && settings.callback();
            settings.showConfig && settings.showConfig.$notData && settings.showConfig.$notData.addClass('active');
        } else {
            settings.error(XMLHttpRequest, textStatus, errorThrown);
        }
    });
};

var getArgs = function ($dom, page) {
    var settings = cache[$dom.data('uuid')];
    var condition = settings._condition;
    var result = condition.length ? condition + '&' : '';
    result += 'size=' + settings.size + '&page=' + page;
    return result;
};

var handle = function (response, $dom, page) {
    var settings = cache[$dom.data('uuid')];
    settings.page = page;
    response.totalPages > 1 ? $dom.find('.pagination').removeClass('hide') : $dom.find('.pagination').addClass('hide');
    var start = response.number - Number(settings.half), end = response.number + Number(settings.half) + (settings.even ? 0 : 1);
    if (response.totalPages > settings.numericButtons) {
        if (start <= 0) {
            start = 1;
            end = settings.numericButtons;
        }
        if (end > response.totalPages) {
            end = response.totalPages;
            start = end - (settings.numericButtons - 1);
        }
    } else {
        start = 1;
        end = response.totalPages;
    }
    var li = $('li', $dom);
    li.length > 2 && li.slice(1, li.length - 1).remove();
    li = li.first();
    $('li:first', $dom).toggleClass('disabled', response.first);
    $('li:last', $dom).toggleClass('disabled', response.last);
    for (var i = end; i >= start; i--) {
        var node = $('<li><a href="javascript:void(0)">' + i + '</a></li>');
        li.after(node);
        response.number == i - 1 && node.addClass('active');
        $('a', node).on('click', numberEvent);
    }
    settings.showConfig && show(settings.showConfig, response);
    settings.callback(response);
};

var show = function (config, response) {
    var target = typeof config.target==="string"?$(config.target):config.target;
    target.empty();
    var template=typeof config.template==="string"?$(config.template):config.template;
    var html = template ? template.text() : config.html;
    $.each(response.content, function (i, item) {
        item._number = i + 1;
        item._index = item._number + response.size * response.number;
        config.before && config.before(item, response);
        var node = $(utils.template.nano(html, item));
        target.append(node);
        $('[data-click]', node).on('click', function (e) {
            return config.method[$(this).data('click')].apply(this, [item, e]);
        });
        config.after && config.after(node, item, response);
    });
    config.callback && config.callback(response, target);
    config.$allBtn && target.find(':checkbox[name=checkbox]').click(function () {
        if (target.find(':checkbox[name=checkbox]').length == target.find(':checkbox[name=checkbox]:checked').length) {
            config.$allBtn.html('<i class="fa fa-check-square-o"></i> 取消');
            config.$allBtn.data('checked', false);
        } else {
            config.$allBtn.html('<i class="fa fa-square-o"></i> 全选');
            config.$allBtn.data('checked', true);
        }
    });
};

var prevEvent = function () {
    var $dom = $(this).closest('ul').parent();
    if (!$('li:first', $dom).hasClass('disabled')) {
        var settings = cache[$dom.data('uuid')];
        request($dom, Number(settings.page) - 1);
    }
};

var nextEvent = function () {
    var $dom = $(this).closest('ul').parent();
    if (!$('li:last', $dom).hasClass('disabled')) {
        var settings = cache[$dom.data('uuid')];
        request($dom, Number(settings.page) + 1);
    }
};

var numberEvent = function () {
    var $dom = $(this).closest('ul').parent();
    request($dom, Number($(this).text()) - 1);
};

var methods = {
    initializer: function (options) {
        return this.each(function () {
            var $this = $(this);
            $this.data('uuid') || $this.attr('data-uuid', utils.uuid.uuid());
            var settings = cache[$this.data('uuid')];
            if (typeof settings === "undefined") {
                settings = $.extend({}, $.fn.pagination.defaults, options || {});
                settings.half = Math.ceil(settings.numericButtons / 2) - 1;
                settings.even = (settings.numericButtons % 2) == 1;
                cache[$this.data('uuid')] = settings;
                $this.html(template);
                $('li:first a', $this).on('click', prevEvent);
                $('li:last a', $this).on('click', nextEvent);
                if (settings.showConfig) {
                    if (settings.showConfig.allBtn) {
                        settings.showConfig.$allBtn = $(settings.showConfig.allBtn).click(function () {
                            var checked = $(this).data('checked');
                            checked == null && (checked = true);
                            var length = $(settings.showConfig.target).find(':checkbox[name=checkbox]').each(function () {
                                this.checked = checked;
                            }).length;
                            if (length) {
                                checked ? $(this).html('<i class="fa fa-check-square-o"></i> 取消') : $(this).html('<i class="fa fa-square-o"></i> 全选');
                                $(this).data('checked', !checked);
                            }
                        });
                    }
                    if (settings.showConfig.notData) {
                        settings.showConfig.$notData = typeof settings.showConfig.notData==="string"?$(settings.showConfig.notData):settings.showConfig.notData;
                    }
                }
            }
            //else {
            //    request($this, 0);
            //}
        });
    },
    destroy: function () {
        return this.each(function () {
            var $this = $(this);
            cache[$this.data('uuid')] = null;
        });
    },
    query: function () {
        var fun = arguments[1];
        return this.each(function () {
            var $this = $(this);
            var settings = cache[$this.data('uuid')];
            if (settings == null) {
                $.error('pagination is not initializer...');
            } else {
                settings._condition = settings.form ? $(settings.form).serialize().replace(/\+/g," ") : '';
                request($this, 0, fun);
            }
        });
    },
    refresh: function () {
        return this.each(function () {
            var $this = $(this);
            var settings = cache[$this.data('uuid')];
            if (settings == null) {
                $.error('pagination is not initializer...');
            } else {
                request($this, settings.page);
            }
        });
    },
    set: function () {
        var options = arguments[1];
        return this.each(function () {
            var $this = $(this);
            var settings = cache[$this.data('uuid')];
            $.extend(true, settings, options);
        });
    }
};

$.fn.extend({
    pagination: function () {
        var method = arguments[0];
        if (methods[method]) {
            method = methods[method];
        } else if (typeof method === "object" || !method) {
            method = methods.initializer;
        } else {
            $.error("Method" + method + "does not exist on jQuery.pagination");
            return this;
        }
        return method.apply(this, arguments);
    }
});

$.fn.pagination.defaults = {
    size: 15,
    page: 0,
    numericButtons: 10,
    showConfig: null,
    form: null,
    method: 'get',
    callback: function (response) {
    },
    error: function (response) {
        console.error(response);
    }
};
