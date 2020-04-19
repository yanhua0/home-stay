/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.controller;

import org.cqupt.home.dto.request.HomeStayPageDTO;
import org.cqupt.home.dto.request.HomeStayReqDTO;
import org.cqupt.home.model.HomeStay;
import org.cqupt.home.service.HomeStayService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

@Controller
@RequestMapping("/api/home/home/stay")
public class HomeStayController {
    @Resource
    private HomeStayService homeStayService;

    @PostMapping
    @ResponseBody
    public void add(@Valid HomeStayReqDTO homeStay) {
         homeStayService.save(homeStay);
    }

    @GetMapping("/{id}")
    public HomeStay detail(@PathVariable Integer id) {
        return homeStayService.findById(id);
    }
    @GetMapping("/page")
    public String findByPage(HomeStayPageDTO homeStayPageDTO, Model model){
        model.addAttribute("page",homeStayService.findByPage(homeStayPageDTO));
        model.addAttribute("house",homeStayPageDTO);
        return "home/homeStay";
    }
}
