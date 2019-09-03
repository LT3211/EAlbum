package com.lt.dao;

import com.lt.pojo.Picdir;
import com.lt.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PicdirDao {
    //添加一个相册
    public static boolean insertPicdir(Picdir picdir){

        boolean flag=false;

        Connection connection= DBUtil.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="insert into picdir (id,picName,time,picDesc,picAddress,userId,picCover) values (?,?,?,?,?,?,?)";

        try {
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,picdir.getId());
            preparedStatement.setString(2,picdir.getPicName());
            preparedStatement.setString(3,picdir.getTime());
            preparedStatement.setString(4,picdir.getPicDesc());
            preparedStatement.setString(5,picdir.getPicAddress());
            preparedStatement.setString(6,picdir.getUserId());
            preparedStatement.setString(7,picdir.getPicCover());


            preparedStatement.execute();
            flag=true;

            DBUtil.close(preparedStatement,connection);

        } catch (SQLException e) {
            e.printStackTrace();
            flag=false;
        }


        return flag;
    }

    //根据用户id查询相册
    public static List<Picdir> queryByUserId(String userId){


        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;

        String sql="select * from picdir where userId=? order by time";

        List<Picdir> list=new ArrayList<>();

        try {
            connection= DBUtil.getConnection();
            preparedStatement=connection.prepareStatement(sql);

            preparedStatement.setString(1,userId);

            resultSet=preparedStatement.executeQuery();

           while (resultSet.next()){
               Picdir picdir=new Picdir();
                picdir.setId(resultSet.getString("id"));
                picdir.setPicName(resultSet.getString("picName"));
                picdir.setTime(resultSet.getString("time"));
                picdir.setPicDesc(resultSet.getString("picDesc"));
                picdir.setPicAddress(resultSet.getString("picAddress"));
                picdir.setUserId(userId);
                picdir.setPicCover(resultSet.getString("picCover"));
                list.add(picdir);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(resultSet,preparedStatement,connection);
        }

        return list;
    }

    //全局查询
    public static List<Picdir> queryByNameAndDesc(String str){


        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;

        String sql="select * from picdir where picDesc like ? or picName like ?";

        List<Picdir> list=new ArrayList<>();

        try {
            connection= DBUtil.getConnection();
            preparedStatement=connection.prepareStatement(sql);

            preparedStatement.setString(1,"%"+str+"%");
            preparedStatement.setString(2,"%"+str+"%");

            resultSet=preparedStatement.executeQuery();

            while (resultSet.next()){
                Picdir picdir=new Picdir();
                picdir.setId(resultSet.getString("id"));
                picdir.setPicName(resultSet.getString("picName"));
                picdir.setTime(resultSet.getString("time"));
                picdir.setPicDesc(resultSet.getString("picDesc"));
                picdir.setPicAddress(resultSet.getString("picAddress"));
                picdir.setUserId(resultSet.getString("userId"));
                picdir.setPicCover(resultSet.getString("picCover"));
                list.add(picdir);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(resultSet,preparedStatement,connection);
        }

        return list;
    }

    //根据id查询相册
    public static Picdir queryById(String id){


        Picdir picdir=null;
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;

        String sql="select * from picdir where Id=? ";


        try {
            connection= DBUtil.getConnection();
            preparedStatement=connection.prepareStatement(sql);

            preparedStatement.setString(1,id);

            resultSet=preparedStatement.executeQuery();

            if (resultSet.next()){
                picdir=new Picdir();
                picdir.setId(id);
                picdir.setPicName(resultSet.getString("picName"));
                picdir.setTime(resultSet.getString("time"));
                picdir.setPicDesc(resultSet.getString("picDesc"));
                picdir.setPicAddress(resultSet.getString("picAddress"));
                picdir.setUserId(resultSet.getString("userId"));
                picdir.setPicCover(resultSet.getString("picCover"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(resultSet,preparedStatement,connection);
        }

        return picdir;
    }

    //根据id修改相册信息
    public static boolean updatePicdir(Picdir picdir){
        boolean flag=false;

        Connection connection= DBUtil.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="update picdir set picName=? ,picDesc=?,picCover=? where id=?";

        try {
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,picdir.getPicName());
            preparedStatement.setString(2,picdir.getPicDesc());
            preparedStatement.setString(3,picdir.getPicCover());
            preparedStatement.setString(4,picdir.getId());

            preparedStatement.execute();
            flag=true;

            DBUtil.close(preparedStatement,connection);

        } catch (SQLException e) {
            e.printStackTrace();
            flag=false;
        }


        return flag;
    }

    //删除一条相册信息
    public static boolean deletePicdir(String dirId){
        boolean flag=false;

        Connection connection= DBUtil.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="delete from picdir where id=?";

        try {
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,dirId);

            preparedStatement.execute();
            flag=true;

            DBUtil.close(preparedStatement,connection);

        } catch (SQLException e) {
            e.printStackTrace();
            flag=false;
        }


        return flag;
    }


}
