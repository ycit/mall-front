package com.ycit;

/**
 * 自定义异常
 *
 * @author xlch
 * @Date 2018-04-10 16:28
 */
public class YcitException extends RuntimeException {

    public YcitException() {
    }

    public YcitException(String message) {
        super(message);
    }

    public YcitException(String message, Throwable cause) {
        super(message, cause);
    }

    public YcitException(Throwable cause) {
        super(cause);
    }

    public YcitException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
