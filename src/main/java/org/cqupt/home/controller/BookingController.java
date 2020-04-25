/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.controller;

import org.cqupt.home.dto.request.BookingReqDTO;
import org.cqupt.home.dto.request.BookingUpdateReqDTO;
import org.cqupt.home.dto.response.UsersResDTO;
import org.cqupt.home.mapper.RoomMapper;
import org.cqupt.home.service.BookingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/api/home/booking")
public class BookingController {
    @Resource
    private BookingService bookingService;
    @Resource
    private RoomMapper roomMapper;

    /**
     * 预订记录添加
     * @param bookingReqDTO
     * @return
     */
    @PostMapping
    public String add(BookingReqDTO bookingReqDTO, HttpSession httpSession) {
        UsersResDTO usersResDTO= (UsersResDTO) httpSession.getAttribute("users");
        bookingReqDTO.setUsersResDTO(usersResDTO);
        bookingService.save(bookingReqDTO);
        return "redirect:/api/home/home/stay/page";
    }

    @GetMapping("/delete/ids")
    @ResponseBody
    public void delete(String ids) {
        bookingService.deleteByIds(ids);
    }

    /**
     * 修改房间和民宿信息
     * @param bookingUpdateReqDTO
     */
    @PostMapping("/update")
    @ResponseBody
    public void update(BookingUpdateReqDTO bookingUpdateReqDTO) {
        bookingService.update(bookingUpdateReqDTO);
    }

    /**
     * 添加预订记录
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/{id}")
    public String detail(@PathVariable Integer id, Model model) {
        model.addAttribute("booking", bookingService.findById(id));
        model.addAttribute("room",roomMapper.selectByPrimaryKey(id));
        return "booking/add";
    }

    /**
     * 房间修改页面
     * @param id
     * @param model
     * @return
     */

    @GetMapping("/update/{id}")
    public String updatePage(@PathVariable Integer id, Model model) {
        model.addAttribute("booking", bookingService.findByUpdateId(id));
        return "room/update";
    }
}
