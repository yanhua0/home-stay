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
import java.util.UUID;

@Slf4j
public class FileUtils {
    /**
     * @param file
     * @param realPath
     * @return
     */
    public static String saveFile(MultipartFile file, String realPath) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String path = request.getSession().getServletContext().getRealPath("../../src/main/webapp/file/" + realPath);
        Path p = Paths.get(path);
        String fileName = file.getOriginalFilename();
        String rand = UUID.randomUUID().toString().replaceAll("-", "");
        String newName = rand + fileName;
        try {
            Files.createDirectories(p);
            p = p.resolve(newName);
            Files.copy(file.getInputStream(), p);
        } catch (IOException e) {
            log.error("IO异常:", e);
        }
        return "/file/" + realPath + newName;
    }

    public static void deleteFile(String pathName) {
        try {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String path = request.getSession().getServletContext().getRealPath("../../src/main/webapp/" + pathName);
            File file = new File(path);
            if (file.exists()) {
                file.delete();
            }
        } catch (Exception e) {
            log.error("删除失败：", e);
        }
    }

}
