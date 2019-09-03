package com.lt.util;


import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

/**
 * 发送邮件
 */
public class MailUtil {

    public static void main(String[] args) {
        sendMail("1377981923@qq.com","123545");
    }

    public static void sendMail(String emailTo,String password){
        SimpleEmail email = new SimpleEmail();
        // 设置使用发电子邮件的邮件服务器，这里以qq邮箱为例（其它例如：【smtp.163.com】，【smtp.sohu.com】）
        email.setHostName("smtp.163.com");
        try {
            // 收件人邮箱
            email.addTo(emailTo);
            // 邮箱服务器身份验证
            email.setAuthentication("17857324868@163.com", "Lt123456");
            // 发件人邮箱
            email.setFrom("17857324868@163.com");
            // 邮件主题
            email.setSubject("EAlbum验证码");
            // 邮件内容
            email.setMsg("【EAlbum】你的密码是:"+password+"。请妥善保管，及时修改密码！!!");
            //设置SSL
            email.setSSLOnConnect(true);
            //设置端口
            email.setSmtpPort(465);
            // 发送邮件
            email.send();
        } catch (EmailException ex) {
            ex.printStackTrace();
        }
    }

}
