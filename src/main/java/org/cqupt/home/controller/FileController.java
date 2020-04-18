package org.cqupt.home.controller;

import org.cqupt.home.common.util.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {
    @PostMapping("/save")
    public void save(MultipartFile file){
        FileUtils.saveFile(file,"house");
    }
    @GetMapping("/del")
    public  void delete(String p){
        FileUtils.deleteFile(p);
    }
}
