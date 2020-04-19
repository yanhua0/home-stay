/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.service;

import com.github.pagehelper.PageInfo;
import org.cqupt.home.dto.request.BookingReqDTO;
import org.cqupt.home.dto.request.BookingUpdateReqDTO;
import org.cqupt.home.dto.response.BookingResDTO;
import org.cqupt.home.model.Booking;



public interface BookingService  {

/**
     * 新增
     * @param reqDTO
     * @return
     */
    void save(Booking reqDTO);


    /**
    * 通过主键删除
    * @param id
    * @return
    */
    void deleteById(Integer id);
    void deleteByIds(String ids);
    /**
    * 更新
    * @return
    */
    void update(BookingUpdateReqDTO bookingUpdateReqDTO);

    /**
    * 通过ID查找
    * @param id
    * @return
    */
    Booking findById(Integer id);
    BookingResDTO findByUpdateId(Integer id);
    PageInfo<BookingResDTO> findByPage(BookingReqDTO bookingReqDTO);


}
