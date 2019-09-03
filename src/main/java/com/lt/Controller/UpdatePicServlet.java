package com.lt.Controller;

import com.lt.dao.PicdirDao;
import com.lt.pojo.Picdir;
import com.lt.pojo.User;
import com.lt.util.UUIdUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UpdatePicServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession httpSession=request.getSession();

        String dirId= (String) httpSession.getAttribute("dirId");
        User user= (User) httpSession.getAttribute("user");

        Picdir picdir=PicdirDao.queryById(dirId);

        String filePath=null;

        //判断是普通表单,还是文件上传表单
        if (!ServletFileUpload.isMultipartContent(request)){
            throw new RuntimeException("不是文件上传表单！");
        }

        //创建上传所需要的两个对象
        DiskFileItemFactory factory=new DiskFileItemFactory(); //磁盘文件对象
        ServletFileUpload sfu=new ServletFileUpload(factory);  //文件上传对象

        //设置解析文件中的文件名的编码格式
        sfu.setHeaderEncoding("utf-8");

        //创建list容器来保存表单中的所有数据信息
        List<FileItem> items=new ArrayList<FileItem>();

        //将表单中的所有数据信息放入到list中
        try {
            items=sfu.parseRequest(request);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }

        String path=picdir.getPicAddress();
        //新建一个相册文件夹
        File file=new File(path);

        if (!file.exists()){
            file.mkdirs();
        }


        Map map=new HashMap();

        //遍历list容器,处理每个数据项中的信息
        for (FileItem item:items){
            //判断是否是普通项
            if (item.isFormField()){
                //处理普通数据项信息
                handleFormField(item,map);
            }else{
                // 处理 文件数据项 信息
                filePath=handleFileField(item,path);
            }
        }


        picdir.setPicName((String) map.get("picName"));
        picdir.setPicDesc((String) map.get("picDesc"));
        if (filePath!=null){
            picdir.setPicCover(filePath);
        }



        //dao层进行数据库操作
        boolean flag= PicdirDao.updatePicdir(picdir);
        if (flag){

            httpSession.setAttribute("dirList", PicdirDao.queryByUserId(user.getId()));
        }

        response.sendRedirect("show.jsp?dirId="+dirId);

    }

    //处理图片
    private String handleFileField(FileItem item,String path) {
        // 获取 文件数据项中的 文件名
        String fileName = item.getName();

        // 判断 此文件的文件名是否合法
        if (fileName==null || "".equals(fileName)) {
            return null;
        }

        // 控制只能上传图片
        if (!item.getContentType().startsWith("image")) {
            return null;
        }

        // 将文件信息 输出到控制台
        System.out.println("fileName:" + fileName);         // 文件名
        System.out.println("fileSize:" + item.getSize());   // 文件大小

        // 使用了虚拟路径，直接上传到物理磁盘上就好了，这里的虚拟路径地址是/upload
        //创建封面图片文件夹
        //每个账号创建存放相册的文件夹 路径为:D:\FileUpload\
        File file=new File(path+"\\picCover");
        // 创建  目录
        if (!file.exists()) {
            file.mkdirs();
        }

        String pathName= UUIdUtil.getMyUuid()+"_"+fileName;


        // 将文件保存到服务器上（UUID是通用唯一标识码，不用担心会有重复的名字出现）
        try {
            item.write(new File(file.toString(), pathName));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return (path+"\\picCover\\"+pathName).replace("D:","");
    }

    //处理普通表单的值
    private void handleFormField(FileItem item,Map<String,String> map){
        // 获取 普通数据项中的 name值
        String fieldName = item.getFieldName();

        // 获取 普通数据项中的 value值
        String value = "";
        try {
            value = item.getString("utf-8");  // 以 utf-8的编码格式来解析 value值
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        //键值对放入map中
        map.put(fieldName,value);

        // 输出到控制台
        System.out.println("fieldName:" + fieldName + "--value:" + value);
    }

}
