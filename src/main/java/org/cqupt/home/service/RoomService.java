/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.service;

import com.github.pagehelper.PageInfo;
import org.cqupt.home.dto.request.BookingReqDTO;
import org.cqupt.home.dto.request.RoomReqDTO;
import org.cqupt.home.dto.response.RoomResDTO;
import org.cqupt.home.dto.response.UsersResDTO;
import org.cqupt.home.model.Room;

import java.util.List;


public interface RoomService  {

/**
     * 新增
     * @param reqDTO
     * @return
     */
    void save(RoomReqDTO reqDTO);


    /**
    * 通过主键删除
    * @param id
    * @return
    */
    void deleteById(Integer id);

    /**
    * 更新
    * @param updateDTO
    * @return
    */
    void update(Room updateDTO);
List<Room> findByHomeId(UsersResDTO users);
PageInfo<RoomResDTO> findByReq(BookingReqDTO bookingReqDTO);
void deleteIds(String ids);
    RoomResDTO findById(Integer id);

}
