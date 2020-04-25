/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.cqupt.home.common.enums.HsErrorCode;
import org.cqupt.home.common.exception.HomeStayException;
import org.cqupt.home.common.util.BeanCopyUtils;
import org.cqupt.home.dto.request.BookingReqDTO;
import org.cqupt.home.dto.request.BookingUpdateReqDTO;
import org.cqupt.home.dto.request.HomeStayReqDTO;
import org.cqupt.home.dto.response.BookingResDTO;
import org.cqupt.home.mapper.BookingMapper;
import org.cqupt.home.mapper.RoomMapper;
import org.cqupt.home.mapper.UsersMapper;
import org.cqupt.home.model.Booking;
import org.cqupt.home.model.HomeStay;
import org.cqupt.home.model.Room;
import org.cqupt.home.model.Users;
import org.cqupt.home.service.BookingService;
import org.cqupt.home.service.HomeStayService;
import org.cqupt.home.service.RoomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;


@Service
@Slf4j
public class BookingServiceImpl implements BookingService {
    @Resource
    private BookingMapper bookingMapper;
    @Resource
    private RoomService roomService;
    @Resource
    private HomeStayService homeStayService;
    @Resource
    private RoomMapper roomMapper;
    @Resource
    private UsersMapper usersMapper;

    @Override
    public void save(BookingReqDTO reqDTO) {
        try {
            Booking booking= BeanCopyUtils.copyBean(reqDTO,Booking.class);
            SimpleDateFormat sip=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            booking.setIntoTime(sip.parse(reqDTO.getIntoTime()));
            booking.setLeaveTime(sip.parse(reqDTO.getLeaveTime()));
            bookingMapper.insertSelective(booking);
            Room room = new Room();
            room.setId(reqDTO.getRoomId());
            room.setUsed(2);
            room.setId(reqDTO.getRoomId());
            room.setOrderUsersId(reqDTO.getUsersResDTO().getId());
            roomService.update(room);
        } catch (ParseException e) {
            log.error("日期转换错误：",e);
        }

    }


    @Override
    public void deleteById(Integer id) {
        bookingMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void deleteByIds(String ids) {
        bookingMapper.deleteByIds(ids);
    }

    @Override
    public void update(BookingUpdateReqDTO bookingUpdateReqDTO) {
        Room room = roomMapper.selectByPrimaryKey(bookingUpdateReqDTO.getRoomId());
        HomeStay homeStay = homeStayService.findById(room.getHomeId());
        HomeStayReqDTO homeStayReqDTO = new HomeStayReqDTO();
        homeStayReqDTO.setUserCode(bookingUpdateReqDTO.getUserCode());
        homeStayReqDTO.setFile(bookingUpdateReqDTO.getFile());
        homeStayReqDTO.setCity(bookingUpdateReqDTO.getCity());
        homeStayReqDTO.setHouseName(bookingUpdateReqDTO.getHouseName());
        homeStayReqDTO.setId(homeStay.getId());
        homeStayService.update(homeStayReqDTO);
        Double d = null;
        try {
            d = Double.valueOf(bookingUpdateReqDTO.getPrice());
        } catch (NumberFormatException e) {
            throw new HomeStayException(HsErrorCode.FILED_ERROR, "价格参数错误");
        }
        room.setPrice(d);
        room.setRoomName(bookingUpdateReqDTO.getRoomName());
        roomMapper.updateByPrimaryKeySelective(room);
    }


    @Override
    public Booking findById(Integer id) {
        return bookingMapper.selectByPrimaryKey(id);
    }
    @Override
    public BookingResDTO findByUpdateId(Integer id) {
        BookingReqDTO bookingReqDTO=new BookingReqDTO();
        bookingReqDTO.setId(id);
        BookingResDTO bookingResDTO=bookingMapper.findByPage(bookingReqDTO).get(0);
        Users u= usersMapper.selectByPrimaryKey(bookingResDTO.getRoomResDTO().getHomeStayResDTO().getHouseOwnerId());
        bookingResDTO.getRoomResDTO().getHomeStayResDTO().setUserCode(u.getUserCode());
        return bookingResDTO;
    }
    @Override
    public PageInfo<BookingResDTO> findByPage(BookingReqDTO bookingReqDTO) {
        PageHelper.startPage(bookingReqDTO.getPage(), bookingReqDTO.getPageSize());
        return new PageInfo<>(bookingMapper.findByPage(bookingReqDTO));
    }

}
