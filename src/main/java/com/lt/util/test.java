package com.lt.util;

import com.lt.dao.PicdirDao;
import com.lt.pojo.Picdir;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class test {

    public static void main(String[] args) {

        List<Picdir> list=PicdirDao.queryByNameAndDesc("美");
        System.out.println(list);

    }

}
