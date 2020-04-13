package org.cqupt.home.web;


import org.cqupt.home.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TestController {
    @Autowired
    private UserService userService;
    @RequestMapping("/index")
    public String dd(){
        userService.login();
        return "index";
    }
}
