package org.cqupt.home.dto.response;

import lombok.Data;

import java.util.Date;

@Data
public class UsersResDTO {
    private Integer id;
    private String userCode;
    private String password;
    private String name;
    private Date createTime;
    private Integer roleId;
    private String roleName;
    private String email;
    private String phone;
}
