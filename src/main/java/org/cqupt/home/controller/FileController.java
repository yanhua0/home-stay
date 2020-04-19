package org.cqupt.home.controller;

import org.cqupt.home.common.enums.HsErrorCode;
import org.cqupt.home.common.exception.HomeStayException;
import org.cqupt.home.common.util.FileUtils;
import org.cqupt.home.model.Booking;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Controller
public class FileController {
    @PostMapping("/save")
    public void save(MultipartFile file){
        FileUtils.saveFile(file,"house");
    }
    @GetMapping("/del")
    public  void delete(String p){
        FileUtils.deleteFile(p);throw new HomeStayException(HsErrorCode.HOUSE_NAME_REPEAT);
    }
    @GetMapping("/del2")
    @ResponseBody
    public Booking ss(){
       Booking booking=new Booking();
       booking.setIntoTime(new Date());
       return booking;
    }
}
