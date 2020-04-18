/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.cqupt.home.common.enums.HsErrorCode;
import org.cqupt.home.common.exception.HomeStayException;
import org.cqupt.home.common.util.ConditionUtils;
import org.cqupt.home.dto.UsersReqDTO;
import org.cqupt.home.dto.UsersResDTO;
import org.cqupt.home.mapper.UsersMapper;
import org.cqupt.home.mapper.UsersRoleMapper;
import org.cqupt.home.model.Users;
import org.cqupt.home.model.UsersRole;
import org.cqupt.home.service.UsersService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.stream.Collectors;


/**
 * @date 2020/04/16
 * @since 1.0
 */
@Service
public class UsersServiceImpl implements UsersService {
    @Resource
    private UsersMapper usersMapper;

    @Resource
    private UsersRoleMapper usersRoleMapper;
    @Override
    public void save(Users reqDTO) {
        if (checkRepeat(reqDTO.getUserCode())) {
            reqDTO.setCreateTime(new Date());
            usersMapper.insertSelective(reqDTO);
        }
    }


    @Override
    public void deleteById(Integer id) {
        usersMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Users updateDTO) {
        updateDTO.setUserCode(null);
        usersMapper.updateByPrimaryKeySelective(updateDTO);
    }

    @Override
    public Users findById(Integer id) {
        return usersMapper.selectByPrimaryKey(id);
    }

    @Override
    public int login(Users users, HttpSession session, HttpServletResponse response) {
        Condition condition=new Condition(Users.class);
        Example.Criteria criteria=condition.createCriteria();
        criteria.andEqualTo("userCode",users.getUserCode());
        criteria.andEqualTo("password",users.getPassword());
        List<Users> u=usersMapper.selectByCondition(condition);
        if(!CollectionUtils.isEmpty(u)){
            UsersResDTO usersResDTO=new UsersResDTO();
            BeanUtils.copyProperties(u.get(0),usersResDTO);
            UsersRole usersRole=usersRoleMapper.selectByPrimaryKey(usersResDTO.getRoleId());
            usersResDTO.setRoleName(usersRole.getRoleName());
            session.setMaxInactiveInterval(3600);
            session.setAttribute("users", usersResDTO);
            //放入cookies关闭浏览器用户没有退出
            Cookie cookieSId = new Cookie("JSESSIONID", session.getId());
            cookieSId.setMaxAge(3600);
            cookieSId.setPath("/");
            response.addCookie(cookieSId);
            return 1;
        }
        return 0;
    }

    @Override
    public PageInfo<UsersResDTO> findByPage(UsersReqDTO usersReqDTO) {
        Condition condition=new Condition(Users.class);
        Example.Criteria criteria=condition.createCriteria();
        if(!StringUtils.isEmpty(usersReqDTO.getName())){
            criteria.andEqualTo("name",usersReqDTO.getName());
        }
        if(Objects.nonNull(usersReqDTO.getRoleId())){
            criteria.andEqualTo("roleId",usersReqDTO.getRoleId());
        }
        PageHelper.startPage(usersReqDTO.getPage(),usersReqDTO.getPageSize());
        List<Users> usersList=usersMapper.selectByCondition(condition);
        PageInfo<Users> p=new PageInfo<>(usersList);
        List<UsersResDTO> usersResDTOList=new ArrayList<>();
        for (Users users : usersList) {
            UsersResDTO usersResDTO=new UsersResDTO();
            BeanUtils.copyProperties(users,usersResDTO);
            List<UsersRole> usersRole=usersRoleMapper.selectAll();
            Map<Integer,String> userRoleMap=usersRole.stream().collect(Collectors.toMap(UsersRole::getId, UsersRole::getRoleName));
            usersResDTO.setRoleName(userRoleMap.get(users.getRoleId()));
            usersResDTOList.add(usersResDTO);
        }
        PageInfo<UsersResDTO> p2=new PageInfo<>();
        BeanUtils.copyProperties(p,p2);
        p2.setList(usersResDTOList);
        return p2;
    }
    @Override
    public boolean checkPassword(String password, Users user) {
        if (user.getPassword().equals(password)) {
            return true;
        }
        return false;
    }

    /**
     * 修改用户密码
     *
     * @param user
     * @param pwd1
     * @param pwd2
     * @return
     */
    @Override
    public Users updateUser(Users user, String pwd1, String pwd2) {
        boolean flag = checkPassword(pwd1, user);
        Users u = findById(user.getId());
        if (flag) {
            u.setPassword(pwd2);
            usersMapper.updateByPrimaryKey(u);
        } else {
            return null;
        }
        return user;
    }
    private boolean checkRepeat(String userCode) {
        List<Users> users = usersMapper.selectByCondition(ConditionUtils.eq("userCode", userCode, Users.class));
        if (!CollectionUtils.isEmpty(users)) {
            throw new HomeStayException(HsErrorCode.USER_CODE_REPEAT, userCode);
        }
        return true;
    }
}
