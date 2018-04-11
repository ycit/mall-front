package com.ycit.util;

import java.util.UUID;

/**
 * uuid 工具类
 *
 * @author xlch
 * @Date 2018-04-09 9:47
 */
public class UUIDGenerator {

    public static String getUUID() {
        UUID random = UUID.randomUUID();
        return random.toString().replaceAll("-", "");
    }

}
