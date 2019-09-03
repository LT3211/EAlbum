package com.lt.util;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 获得数据库连接
 */
public class DBUtil {
    private static ComboPooledDataSource dataSource = new ComboPooledDataSource();

    //通过数据库连接池获得Connection对象
    public static Connection getConnection() {
        Connection connection=null;
        try {
             connection= dataSource.getConnection();
            System.out.println("连接数据库 mysql 成功！");
        } catch (Exception e) {
            System.out.println("连接数据库失败！");
        }
        return connection;
    }

    public static void close(PreparedStatement ps, Connection conn) {

        try {
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(ResultSet rs, PreparedStatement ps, Connection conn) {
        try {
            rs.close();
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        try {
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
