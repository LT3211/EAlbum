package com.lt.Controller;

import com.lt.dao.UserDao;
import com.lt.pojo.User;
import com.lt.util.MailUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ForgetServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession httpSession=req.getSession();

        req.setCharacterEncoding("utf-8");
        //System.out.println(req.getParameter("mail")+"ww"+req.getParameter("nickName"));

        User user=UserDao.queryUserByMailAndName(req.getParameter("mail"),req.getParameter("nickName"));

        if (user!=null){
            httpSession.setAttribute("msg","密码已发送，注意查收！");
            MailUtil.sendMail(user.getMail(),user.getPassword());
            resp.sendRedirect("result.jsp");
        }else {
            httpSession.setAttribute("msg","昵称与邮箱不符，验证失败！");
            resp.sendRedirect("result.jsp");
        }

    }
}
