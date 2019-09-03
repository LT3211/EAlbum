package com.lt.util;

import java.util.UUID;

public class UUIdUtil {

    public static String getMyUuid(){
        String string= String.valueOf(UUID.randomUUID()).replaceAll("-","");

        return string;

    }

    public static void main(String[] args) {
        System.out.println(getMyUuid());
    }
}
