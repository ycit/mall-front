package com.ycit.util;

import com.ycit.YcitException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;

/**
 * 图片处理
 *
 * @author xlch
 * @Date 2018-04-10 16:25
 */
public class ImgUtil {

    private static final Logger LOGGER = LoggerFactory.getLogger(ImgUtil.class);

    public static void createDir(String dir) {
        File file = new File(dir);
        if (!file.exists()) {
            if (!file.mkdirs()) {
                throw new YcitException("创建目录出错");
            }
        } else {
            LOGGER.debug("{}地址目录已存在", dir);
        }
    }

}
