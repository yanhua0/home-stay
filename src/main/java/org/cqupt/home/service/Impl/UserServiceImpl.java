package org.cqupt.home.service.Impl;


import org.cqupt.home.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Override
    public void login() {
        System.out.println("登录--------------");

    }
}
