package com.lt.Controller;

import com.lt.dao.UserDao;
import com.lt.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession httpSession=req.getSession();

        //设置字符编码
        req.setCharacterEncoding("utf-8");
        User user=UserDao.queryUser(req.getParameter("mail"),req.getParameter("password"));

        //如果用户存在则跳转
        if (user!=null){
            httpSession.setAttribute("user",user);
            resp.sendRedirect("ealbum.jsp");
        }else {
            //如果用户不存在
            httpSession.setAttribute("msg","账号或密码错误！");
            resp.sendRedirect("result.jsp");
        }
    }
}
