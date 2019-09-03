package com.lt.dao;

import com.lt.pojo.Photo;
import com.lt.pojo.Picdir;
import com.lt.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PhotoDao {

    //添加一张图片
    public static boolean insertPhoto(Photo photo){

        boolean flag=false;

        Connection connection= DBUtil.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="insert into photo (id,dirId,time,photoAddr,photoName,photoSize) values (?,?,?,?,?,?)";

        try {
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,photo.getId());
            preparedStatement.setString(2,photo.getDirId());
            preparedStatement.setString(3,photo.getTime());
            preparedStatement.setString(4,photo.getPhotoAddr());
            preparedStatement.setString(5,photo.getPhotoName());
            preparedStatement.setDouble(6,photo.getPhotoSize());


            preparedStatement.execute();
            flag=true;

            DBUtil.close(preparedStatement,connection);

        } catch (SQLException e) {
            e.printStackTrace();
            flag=false;
        }


        return flag;
    }

    //根据相册id查询所有图片
    public static List<Photo> queryPhotoByDirId(String dirId){


        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;

        String sql="select * from photo where dirId=? order by time";

        List<Photo> list=new ArrayList<>();

        try {
            connection= DBUtil.getConnection();
            preparedStatement=connection.prepareStatement(sql);

            preparedStatement.setString(1,dirId);

            resultSet=preparedStatement.executeQuery();

            while (resultSet.next()){
                Photo photo=new Photo();
                photo.setId(resultSet.getString("id"));
                photo.setDirId(dirId);
                photo.setTime(resultSet.getString("time"));
                photo.setPhotoAddr(resultSet.getString("photoAddr"));
                photo.setPhotoName(resultSet.getString("photoName"));
                photo.setPhotoSize(resultSet.getDouble("photoSize"));
                list.add(photo);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(resultSet,preparedStatement,connection);
        }

        return list;

    }

    //删除一条相册信息
    public static boolean deletePhoto(String dirId){
        boolean flag=false;

        Connection connection= DBUtil.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="delete from photo where dirId=?";

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
