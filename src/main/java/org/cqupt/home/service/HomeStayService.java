/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.service;

import com.github.pagehelper.PageInfo;
import org.cqupt.home.dto.request.HomeStayPageDTO;
import org.cqupt.home.dto.request.HomeStayReqDTO;
import org.cqupt.home.model.HomeStay;



public interface HomeStayService  {

/**
     * 新增
     * @param reqDTO
     * @return
     */
    void save(HomeStayReqDTO reqDTO);


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
    void update(HomeStayReqDTO updateDTO);

    /**
    * 通过ID查找
    * @param id
    * @return
    */
    HomeStay findById(Integer id);

    PageInfo<HomeStay> findByPage(HomeStayPageDTO homeStayPageDTO);
    Integer checkName(HomeStayReqDTO reqDTO);

}
