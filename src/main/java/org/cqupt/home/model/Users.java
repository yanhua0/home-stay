package org.cqupt.home.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Id;
import java.util.Date;
@Getter
@Setter
public class Users {
    @Id
    private Integer id;

    @Column(name = "user_code")
    private String userCode;

    private String password;


    private String name;

    @Column(name = "create_time")
    private Date createTime;
    @Column(name = "role_id")
    private Integer roleId;
    private String email;
    private String phone;


}