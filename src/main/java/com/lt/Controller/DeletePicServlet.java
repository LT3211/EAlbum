package com.lt.Controller;

import com.lt.dao.PhotoDao;
import com.lt.dao.PicdirDao;
import com.lt.dao.UserDao;
import com.lt.pojo.Picdir;
import com.lt.util.DeleteUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeletePicServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dirId=req.getParameter("dirId");
        Picdir picdir= PicdirDao.queryById(dirId);

        DeleteUtil.delDir(picdir.getPicAddress());

        PicdirDao.deletePicdir(dirId);
        PhotoDao.deletePhoto(dirId);

        UserDao.deleteUserTotal(picdir.getUserId());

        req.getSession().setAttribute("user",UserDao.queryUserById(picdir.getUserId()));

        resp.sendRedirect("ealbum.jsp");
    }

}
