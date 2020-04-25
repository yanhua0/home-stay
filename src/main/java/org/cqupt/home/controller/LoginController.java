package org.cqupt.home.controller;

import org.cqupt.home.common.util.BeanCopyUtils;
import org.cqupt.home.dto.response.UsersResDTO;
import org.cqupt.home.model.Users;
import org.cqupt.home.service.UsersService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/api/home")
public class LoginController {
    @Resource
    private UsersService usersService;

    @RequestMapping("/login")
    public String loginHtml() {
        return "login";
    }

    @RequestMapping("/logout")
    public String loginHtml(HttpSession session) {
        session.removeAttribute("users");
        return "login";
    }

    @RequestMapping("/subLogin")
    public String subLogin(Users users, Model model, HttpSession session, HttpServletResponse response) {
        int key = usersService.login(users, session, response);
        if (key == 0) {
            model.addAttribute("error", "用户名或密码错误");
            return "login";
        }
        return "redirect:index";
    }

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    @GetMapping("/reset")
    public String reset() {
        return "reset";
    }

    /**
     * 判断密码是否正确
     *
     * @param password
     * @param session
     * @return
     */
    @PostMapping("/checkPwd")
    @ResponseBody
    public boolean checkPwd(@RequestParam("password") String password, HttpSession session) {
        UsersResDTO user = (UsersResDTO) session.getAttribute("users");
        Users u = BeanCopyUtils.copyBean(user, Users.class);
        return usersService.checkPassword(password, u);
    }

    /**
     * 修改密码
     *
     * @param pwd1
     * @param pwd2
     * @param session
     * @return
     */
    @PostMapping("/changePassword")
    public String changePwd(@RequestParam("pwd1") String pwd1, @RequestParam("pwd2") String pwd2, HttpSession session) {
        UsersResDTO user = (UsersResDTO) session.getAttribute("users");
        Users u = BeanCopyUtils.copyBean(user, Users.class);
        usersService.updateUser(u, pwd1, pwd2);
        return "redirect:/api/home/home/stay/page";
    }
}
