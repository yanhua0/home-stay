/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.service;

import com.github.pagehelper.PageInfo;
import org.cqupt.home.dto.request.UsersReqDTO;
import org.cqupt.home.dto.response.UsersResDTO;
import org.cqupt.home.model.Users;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * @date 2020/04/16
 * @since 1.0
 */
public interface UsersService {

    /**
     * 新增
     *
     * @param reqDTO
     * @return
     */
    void save(Users reqDTO);


    /**
     * 通过主键删除
     *
     * @param id
     * @return
     */
    void deleteById(Integer id);

    /**
     * 更新
     *
     * @param updateDTO
     * @return
     */
    void update(Users updateDTO);

    /**
     * 通过ID查找
     *
     * @param id
     * @return
     */
    Users findById(Integer id);

    int login(Users users, HttpSession session, HttpServletResponse httpServletResponse);

    boolean checkPassword(String password, Users user);

    Users updateUser(Users user, String pwd1, String pwd2);

    PageInfo<UsersResDTO> findByPage(UsersReqDTO usersReqDTO);



}
