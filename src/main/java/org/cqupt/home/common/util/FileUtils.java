package org.cqupt.home.common.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Objects;
import java.util.UUID;

@Slf4j
public class FileUtils {
    /**
     * @param file
     * @param realPath
     * @return
     */
    public static String saveFile(MultipartFile file, String realPath) {
        if(Objects.isNull(file)){
            return "";
        }
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        //编译文件路径
        String path = request.getSession().getServletContext().getRealPath("file/" + realPath);
        //本地磁盘的路径
        String pathRoot = request.getSession().getServletContext().getRealPath("../../src/main/webapp/file/" + realPath);
        Path p = Paths.get(path);
        Path root = Paths.get(pathRoot);
        String fileName = file.getOriginalFilename();
        String rand = UUID.randomUUID().toString().replaceAll("-", "");
        String newName = rand + fileName;
        try {
            Files.createDirectories(p);
            Files.createDirectories(root);
            p = p.resolve(newName);
            root=root.resolve(newName);
            Files.copy(file.getInputStream(), p);
            Files.copy(file.getInputStream(), root);
        } catch (IOException e) {
            log.error("IO异常:", e);
        }
        return "/file/" + realPath +"/"+ newName;
    }

    public static void deleteFile(String pathName) {
        try {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String path = request.getSession().getServletContext().getRealPath("../../src/main/webapp/" + pathName);
            String pathRoot = request.getSession().getServletContext().getRealPath(pathName);
            File file = new File(path);
            File file2 = new File(pathRoot);
            if (file.exists()) {
                file.delete();
                file2.delete();
            }
        } catch (Exception e) {
            log.error("删除失败：", e);
        }
    }

}
