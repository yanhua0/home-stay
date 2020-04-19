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
import org.cqupt.home.mapper.UsersMapper;
import org.cqupt.home.model.HomeStay;
import org.cqupt.home.model.Users;
import org.cqupt.home.service.HomeStayService;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Objects;


@Service
public class HomeStayServiceImpl implements HomeStayService {
    @Resource
    private HomeStayMapper homeStayMapper;
    @Resource
    private UsersMapper usersMapper;


    @Override
    public void save(HomeStayReqDTO reqDTO) {
        Integer userId=checkName(reqDTO);
        String picture = FileUtils.saveFile(reqDTO.getFile(), "house");
        reqDTO.setPicture(picture);
        reqDTO.setCreateTime(new Date());
        reqDTO.setHouseOwnerId(userId);
        HomeStay homeStay=BeanCopyUtils.copyBean(reqDTO, HomeStay.class);
        homeStayMapper.insertSelective(homeStay);
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
        Integer userId=checkName(updateDTO);
        HomeStay homeStay = findById(updateDTO.getId());
        if (Objects.nonNull(homeStay)) {
            FileUtils.deleteFile(homeStay.getPicture());
        }
        String picture = FileUtils.saveFile(updateDTO.getFile(), "house");
        if(!StringUtils.isEmpty(picture)){
            updateDTO.setPicture(picture);
        }
        updateDTO.setHouseOwnerId(userId);
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
        if (!StringUtils.isEmpty(homeStayPageDTO.getHouseName())) {
            criteria.andLike("houseName", homeStayPageDTO.getHouseName());
        }
        if (!StringUtils.isEmpty(homeStayPageDTO.getAddress())) {
            criteria.andLike("address", homeStayPageDTO.getAddress());
        }
        if (Objects.nonNull(homeStayPageDTO.getHouseOwnerId())) {
            criteria.andEqualTo("houseOwnerId", homeStayPageDTO.getHouseOwnerId());
        }
        if (!StringUtils.isEmpty(homeStayPageDTO.getCity())) {
            criteria.andEqualTo("city", homeStayPageDTO.getCity());
        }
        PageHelper.startPage(homeStayPageDTO.getPage(),homeStayPageDTO.getPageSize());
        List<HomeStay> homeStays=homeStayMapper.selectByCondition(condition);
        return new PageInfo<>(homeStays);
    }

    public Integer checkName(HomeStayReqDTO reqDTO) {
        List<HomeStay> homeStays = homeStayMapper.selectByCondition(ConditionUtils.eq("houseName", reqDTO.getHouseName(), HomeStay.class));
        for (HomeStay homeStay : homeStays) {
            if (!homeStay.getId().equals(reqDTO.getId())) {
                throw new HomeStayException(HsErrorCode.HOUSE_NAME_REPEAT, reqDTO.getHouseName());
            }
        }
        List<Users> users=usersMapper.selectByCondition(ConditionUtils.eq("userCode",reqDTO.getUserCode(),Users.class));
        if(CollectionUtils.isEmpty(users)){
            throw new HomeStayException(HsErrorCode.USER_CODE_NULL, reqDTO.getUserCode());
        }
        return users.get(0).getId();
    }

}
