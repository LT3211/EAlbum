package com.lt.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {


    public static String timeToString(){
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateNowStr=simpleDateFormat.format(new Date());
        return dateNowStr;
    }
}
