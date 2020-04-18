/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.cqupt.home.common.enums.HsErrorCode;
import org.cqupt.home.common.exception.HomeStayException;
import org.cqupt.home.common.util.BeanCopyUtils;
import org.cqupt.home.common.util.ConditionUtils;
import org.cqupt.home.common.util.FileUtils;
import org.cqupt.home.dto.request.HomeStayPageDTO;
import org.cqupt.home.dto.request.HomeStayReqDTO;
import org.cqupt.home.mapper.HomeStayMapper;
import org.cqupt.home.model.HomeStay;
import org.cqupt.home.service.HomeStayService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;


@Service
public class HomeStayServiceImpl implements HomeStayService {
    @Resource
    private HomeStayMapper homeStayMapper;


    @Override
    public void save(HomeStayReqDTO reqDTO) {
        checkName(reqDTO);
        String picture = FileUtils.saveFile(reqDTO.getFile(), "house");
        reqDTO.setPicture(picture);
        homeStayMapper.insertSelective(BeanCopyUtils.copyBean(reqDTO, HomeStay.class));
    }


    @Override
    public void deleteById(Integer id) {
        HomeStay homeStay = homeStayMapper.selectByPrimaryKey(id);
        if (Objects.nonNull(homeStay)) {
            FileUtils.deleteFile(homeStay.getPicture());
            homeStayMapper.deleteByPrimaryKey(id);
        }
    }

    @Override
    public void update(HomeStayReqDTO updateDTO) {
        checkName(updateDTO);
        HomeStay homeStay = findById(updateDTO.getId());
        if (Objects.nonNull(homeStay)) {
            FileUtils.deleteFile(homeStay.getPicture());
        }
        String picture = FileUtils.saveFile(updateDTO.getFile(), "house");
        updateDTO.setPicture(picture);
        homeStayMapper.updateByPrimaryKeySelective(updateDTO);
    }

    @Override
    public HomeStay findById(Integer id) {
        return homeStayMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageInfo<HomeStay> findByPage(HomeStayPageDTO homeStayPageDTO) {
        Condition condition = new Condition(HomeStay.class);
        Example.Criteria criteria = condition.createCriteria();
        if (!StringUtils.isEmpty(homeStayPageDTO.getAddress())) {
            criteria.andEqualTo("houseName", homeStayPageDTO.getHouseName());
        }
        if (!StringUtils.isEmpty(homeStayPageDTO.getHouseName())) {
            criteria.andEqualTo("address", homeStayPageDTO.getAddress());
        }
        if (Objects.nonNull(homeStayPageDTO.getOwnerId())) {
            criteria.andEqualTo("ownerId", homeStayPageDTO.getOwnerId());
        }
        PageHelper.startPage(homeStayPageDTO.getPage(),homeStayPageDTO.getPageSize());
        List<HomeStay> homeStays=homeStayMapper.selectByCondition(condition);
        return new PageInfo<>(homeStays);
    }

    private void checkName(HomeStay reqDTO) {
        List<HomeStay> homeStays = homeStayMapper.selectByCondition(ConditionUtils.eq("houseName", reqDTO.getHouseName(), HomeStay.class));
        for (HomeStay homeStay : homeStays) {
            if (!homeStay.getId().equals(reqDTO.getId())) {
                throw new HomeStayException(HsErrorCode.HOUSE_NAME_REPEAT, reqDTO.getHouseName());
            }
        }
    }

}
