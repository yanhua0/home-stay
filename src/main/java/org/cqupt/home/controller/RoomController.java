/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.controller;

import com.github.pagehelper.PageInfo;
import org.cqupt.home.dto.request.BookingReqDTO;
import org.cqupt.home.dto.request.RoomReqDTO;
import org.cqupt.home.dto.response.BookingResDTO;
import org.cqupt.home.dto.response.RoomResDTO;
import org.cqupt.home.dto.response.UsersResDTO;
import org.cqupt.home.model.Room;
import org.cqupt.home.service.BookingService;
import org.cqupt.home.service.HomeStayService;
import org.cqupt.home.service.RoomService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/api/home/room")
public class RoomController {
    @Resource
    private RoomService roomService;
    @Resource
    private BookingService bookingService;
    @Resource
    private HomeStayService homeStayService;
    @PostMapping
    @ResponseBody
    public void add(@RequestBody RoomReqDTO room) {
        roomService.save(room);
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        roomService.deleteById(id);
        return "redirect:/api/home/room/page/room";
    }

    /**
     * 退房
     * @return
     */
    @PostMapping("/update")
    @ResponseBody
    public void update(@RequestBody Room room) {
        room.setId(room.getId());
        room.setUsed(1);
        room.setOrderUsersId(-1);
        roomService.update(room);
    }

    @GetMapping("/page/room")
    public String findByPageRoom(BookingReqDTO bookingReqDTO, HttpSession session,Model model) {
        UsersResDTO users= (UsersResDTO) session.getAttribute("users");
        if(users.getRoleId()!=1){
            bookingReqDTO.setHouseOwnerId(users.getId());
        }
        PageInfo<BookingResDTO> p=bookingService.findByPage(bookingReqDTO);
        model.addAttribute("page", p);
        model.addAttribute("dto", bookingReqDTO);
        return "booking/room";
    }

    /**
     * 删除房间
     * @param ids
     */
    @GetMapping("/delete/ids")
    @ResponseBody
    public void delete(String ids) {
        roomService.deleteIds(ids);
    }

    /**
     * 展示房间信息
     * @param bookingReqDTO
     * @param httpSession
     * @param model
     * @return
     */
    @GetMapping("/room")
    public String room(BookingReqDTO bookingReqDTO,HttpSession httpSession,Model model){
        UsersResDTO users= (UsersResDTO) httpSession.getAttribute("users");
        bookingReqDTO.setUsersResDTO(users);
        model.addAttribute("page",roomService.findByReq(bookingReqDTO));
        model.addAttribute("dto", bookingReqDTO);
        model.addAttribute("rooms",roomService.findByHomeId(users));
        model.addAttribute("homes",homeStayService.findByUserId(users));
        return "room/room";
    }
    /**
     * 修改信息
     * @param id
     * @return
     */
    @GetMapping("/update/info/{id}")
    public String updateInfo(@PathVariable  Integer id,Model model) {
        RoomResDTO roomResDTO=roomService.findById(id);
        model.addAttribute("roomResDTO",roomResDTO);
        return "room/update";
    }
}
