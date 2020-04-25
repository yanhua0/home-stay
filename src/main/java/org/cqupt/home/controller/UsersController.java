/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.controller;

import com.github.pagehelper.PageInfo;
import org.cqupt.home.dto.request.UsersReqDTO;
import org.cqupt.home.dto.response.UsersResDTO;
import org.cqupt.home.model.Users;
import org.cqupt.home.service.UsersService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @date 2020/04/16
 * @since 1.0
 */
@Controller
@RequestMapping("/api/home/users")
public class UsersController {
    @Resource
    private UsersService usersService;

    @PostMapping("/add")
    @ResponseBody
    public void add(@RequestBody Users users) {
        usersService.save(users);
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        usersService.deleteById(id);
        return "redirect:info";
    }

    @PostMapping("/update")
    public String update(Users users) {
        usersService.update(users);
        return "redirect:"+users.getId();
    }

    @GetMapping("/{id}")
    public String detail(@PathVariable Integer id,Model model) {
        model.addAttribute("user",usersService.findById(id));
        return "admin/editUser";
    }

    @GetMapping("/info")
    public String findByPage(UsersReqDTO usersReqDTO, Model model) {
        PageInfo<UsersResDTO> pageInfo=usersService.findByPage(usersReqDTO);
        model.addAttribute("page",pageInfo);
        model.addAttribute("u",usersReqDTO);
        return "admin/user";
    }

}
