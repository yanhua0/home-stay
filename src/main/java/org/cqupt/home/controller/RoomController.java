/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.controller;

import org.cqupt.home.dto.request.BookingReqDTO;
import org.cqupt.home.dto.request.RoomReqDTO;
import org.cqupt.home.model.Room;
import org.cqupt.home.service.BookingService;
import org.cqupt.home.service.RoomService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Controller
@RequestMapping("/api/home/room")
public class RoomController {
    @Resource
    private RoomService roomService;
    @Resource
    private BookingService bookingService;

    @PostMapping
    @ResponseBody
    public void add(@RequestBody RoomReqDTO room) {
        roomService.save(room);
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        roomService.deleteById(id);
        return "redirect:/api/home/room/page";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Integer id) {
        Room room=new Room();
        room.setId(id);
        room.setUsed(1);
        roomService.update(room);
        return "redirect:/api/home/room/page";
    }

    @GetMapping("/page")
    public String findByPage(BookingReqDTO bookingReqDTO, Model model) {
        model.addAttribute("page", bookingService.findByPage(bookingReqDTO));
        model.addAttribute("dto", bookingReqDTO);
        return "booking/booking";
    }
}
