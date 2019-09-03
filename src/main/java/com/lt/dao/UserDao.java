package com.lt.dao;

import com.lt.pojo.User;
import com.lt.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    //添加一个用户
    public static boolean insertUser(User user){

        boolean flag=false;

        Connection connection= DBUtil.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="insert into user (id,mail,nickName,password,headIcon,description,total,filePath) values (?,?,?,?,?,?,?,?)";

        try {
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,user.getId());
            preparedStatement.setString(2,user.getMail());
            preparedStatement.setString(3,user.getNickName());
            preparedStatement.setString(4,user.getPassword());
            preparedStatement.setString(5,user.getHeadIcon());
            preparedStatement.setString(6,user.getDescription());
            preparedStatement.setInt(7,0);
            preparedStatement.setString(8,user.getFilePath());

            preparedStatement.execute();
            flag=true;

            DBUtil.close(preparedStatement,connection);

        } catch (SQLException e) {
            e.printStackTrace();
            flag=false;
        }


        return flag;
    }

    //根据邮箱和密码查询用户
    public static User queryUser(String mail,String password){

        User user=null;

        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;

        String sql="select * from user where username=? and password=?";

        try {
            connection= DBUtil.getConnection();
            preparedStatement=connection.prepareStatement("select * from user where mail=? and password=?");

            preparedStatement.setString(1,mail);
            preparedStatement.setString(2,password);

            resultSet=preparedStatement.executeQuery();

            if (resultSet.next()){
                user=new User();
                user.setId(resultSet.getString("id"));
                user.setMail(resultSet.getString("mail"));
                user.setNickName(resultSet.getString("nickName"));
                user.setHeadIcon(resultSet.getString("headIcon"));
                user.setPassword(resultSet.getString("password"));
                user.setDescription(resultSet.getString("description"));
                user.setTotal(resultSet.getInt("total"));
                user.setFilePath(resultSet.getString("filePath"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(resultSet,preparedStatement,connection);
        }

        return user;
    }

    //根据邮箱和昵称查询用户
    public static User queryUserByMailAndName(String mail,String nickName){

        User user=null;

        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;

        String sql="select * from user where username=? and password=?";

        try {
            connection= DBUtil.getConnection();
            preparedStatement=connection.prepareStatement("select * from user where mail=? and nickName=?");

            preparedStatement.setString(1,mail);
            preparedStatement.setString(2,nickName);

            resultSet=preparedStatement.executeQuery();

            if (resultSet.next()){
                user=new User();
                user.setId(resultSet.getString("id"));
                user.setMail(resultSet.getString("mail"));
                user.setNickName(resultSet.getString("nickName"));
                user.setHeadIcon(resultSet.getString("headIcon"));
                user.setPassword(resultSet.getString("password"));
                user.setDescription(resultSet.getString("description"));
                user.setTotal(resultSet.getInt("total"));
                user.setFilePath(resultSet.getString("filePath"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(resultSet,preparedStatement,connection);
        }

        return user;
    }

    //根据id查询用户
    public static User queryUserById(String id){

        User user=null;

        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;

        String sql="select * from user where id=?";

        try {
            connection= DBUtil.getConnection();
            preparedStatement=connection.prepareStatement(sql);

            preparedStatement.setString(1,id);


            resultSet=preparedStatement.executeQuery();

            if (resultSet.next()){
                user=new User();
                user.setId(resultSet.getString("id"));
                user.setMail(resultSet.getString("mail"));
                user.setNickName(resultSet.getString("nickName"));
                user.setHeadIcon(resultSet.getString("headIcon"));
                user.setPassword(resultSet.getString("password"));
                user.setDescription(resultSet.getString("description"));
                user.setTotal(resultSet.getInt("total"));
                user.setFilePath(resultSet.getString("filePath"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(resultSet,preparedStatement,connection);
        }

        return user;
    }

    //根据id修改用户信息
    public static boolean updateUser(User user){
        boolean flag=false;

        Connection connection= DBUtil.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="update user set nickName=? ,description=?,password=?,headIcon=? where id=?";

        try {
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,user.getNickName());
            preparedStatement.setString(2,user.getDescription());
            preparedStatement.setString(3,user.getPassword());
            preparedStatement.setString(4,user.getHeadIcon());
            preparedStatement.setString(5,user.getId());

            preparedStatement.execute();
            flag=true;

            DBUtil.close(preparedStatement,connection);

        } catch (SQLException e) {
            e.printStackTrace();
            flag=false;
        }


        return flag;
    }

    //更新相册总数
    public static boolean updateUserTotal(String id){
        boolean flag=false;

        Connection connection= DBUtil.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="update user set total=total+1 where id=?";

        try {
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,id);

            preparedStatement.execute();
            flag=true;

            DBUtil.close(preparedStatement,connection);

        } catch (SQLException e) {
            e.printStackTrace();
            flag=false;
        }


        return flag;
    }

    //更新相册总数
    public static boolean deleteUserTotal(String id){
        boolean flag=false;

        Connection connection= DBUtil.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="update user set total=total-1 where id=?";

        try {
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,id);

            preparedStatement.execute();
            flag=true;

            DBUtil.close(preparedStatement,connection);

        } catch (SQLException e) {
            e.printStackTrace();
            flag=false;
        }


        return flag;
    }

    //根据id查询文件夹地址
    public static String queryFilePathById(String id){

        String path=null;

        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;

        String sql="select filePath from user where id=?";

        try {
            connection= DBUtil.getConnection();
            preparedStatement=connection.prepareStatement(sql);

            preparedStatement.setString(1,id);

            resultSet=preparedStatement.executeQuery();

            if (resultSet.next()){
              path=resultSet.getString("filePath");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(resultSet,preparedStatement,connection);
        }

        return path;
    }
}
