/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.controller;

import org.cqupt.home.dto.request.BookingUpdateReqDTO;
import org.cqupt.home.model.Booking;
import org.cqupt.home.service.BookingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Controller
@RequestMapping("/api/home/booking")
public class BookingController {
    @Resource
    private BookingService bookingService;

    @PostMapping
    public String add(Booking booking) {
        bookingService.save(booking);
        return "redirect:/api/home/room/page";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        bookingService.deleteById(id);
        return "redirect:/api/home/room/page";
    }
    @GetMapping("/delete/ids")
    @ResponseBody
    public void delete(String ids) {
        bookingService.deleteByIds(ids);
    }
    @PostMapping("/update")
    @ResponseBody
    public void update(BookingUpdateReqDTO bookingUpdateReqDTO) {
        bookingService.update(bookingUpdateReqDTO);
    }

    @GetMapping("/{id}")
    public String detail(@PathVariable Integer id, Model model) {
        model.addAttribute("booking", bookingService.findById(id));
        return "booking/add";
    }

    @GetMapping("/update/{id}")
    public String updatePage(@PathVariable Integer id, Model model) {
        model.addAttribute("booking", bookingService.findByUpdateId(id));
        return "booking/update";
    }
}
