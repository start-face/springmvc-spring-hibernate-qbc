package com.ssh.tools;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * 上传图片工具类
 *
 * @author FaceFeel
 * @Created 2017/2/21
 */

public class UploadUtil {

    /**
     * 处理上传单文件方法
     *
     * @param file     文件
     * @param pic_path 文件保存路径
     * @return 返回文件的相对tomcat中配置的虚拟路径
     * @throws Exception ""
     */
    public static String upload(MultipartFile file, String pic_path) throws Exception {

        File filePath = new File(pic_path);
        if (!filePath.exists()) {
            boolean result = filePath.mkdir();
            if (!result) {
                return "";
            }
        }

        //原始名称
        String originalFilename = file.getOriginalFilename();
        //上传图片
        if (originalFilename != null && originalFilename.length() > 0) {
            //新的图片名称
            String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
            //新图片
            File newFile = new File(pic_path + newFileName);
            //将内存中的数据写入磁盘
            file.transferTo(newFile);
//            return pic_path + newFileName;
            return "/uploadfile/" + newFileName;
        }
        return "";
    }

    /**
     * 处理多文件上传方法
     *
     * @param files    多文件
     * @param pic_path 文件保存路径
     * @return 返回文件的相对tomcat中配置的虚拟路径
     * @throws Exception ""
     */
    public static String uploadMultiFile(MultipartFile[] files, String pic_path) throws Exception {

        File filePath = new File(pic_path);
        if (!filePath.exists()) {
            boolean result = filePath.mkdir();
            if (!result) {
                return "";
            }
        }

        List<String> list = new ArrayList<>();

        for (MultipartFile file : files) {
            //原始名称
            String originalFilename = file.getOriginalFilename();
            //上传图片
            if (originalFilename != null && originalFilename.length() > 0) {
                //新的图片名称
                String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
                //新图片
                File newFile = new File(pic_path + newFileName);
                //将内存中的数据写入磁盘
                file.transferTo(newFile);
//                list.add(pic_path + newFileName);
                list.add("/uploadfile/" + newFileName);
            }
        }
        return ToolJson.anyToJson(list);
    }

    /**
     * 处理多文件上传方法
     *
     * @param files    多文件
     * @param pic_path 文件保存路径
     * @return 返回文件的相对tomcat中配置的虚拟路径
     * @throws Exception ""
     */
    public static String uploadMultiFile(HttpServletRequest request,MultipartFile[] files, String pic_path) throws Exception {

        File filePath = new File(pic_path);
        if (!filePath.exists()) {
            boolean result = filePath.mkdir();
            if (!result) {
                return "";
            }
        }

        List<String> list = new ArrayList<>();
        int count = files.length;

        for (MultipartFile file : files) {
            //原始名称
            String originalFilename = file.getOriginalFilename();
            //上传图片
            if (originalFilename != null && originalFilename.length() > 0) {
                //新的图片名称
                String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
                //新图片
                File newFile = new File(pic_path + newFileName);
                //将内存中的数据写入磁盘
                file.transferTo(newFile);
                list.add("/uploadfile/" + newFileName);
            }
            //目前会存在并发的问题
            request.getSession().setAttribute("loading",100/count);
            count--;
        }
        count = 1;
        return ToolJson.anyToJson(list);
    }
}
