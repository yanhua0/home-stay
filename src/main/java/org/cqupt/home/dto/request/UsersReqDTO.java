package org.cqupt.home.dto.request;

import lombok.Getter;
import lombok.Setter;
import org.cqupt.home.common.base.PageForm;
@Getter
@Setter
public class UsersReqDTO extends PageForm {
    private String name;
    private Integer roleId;
}
