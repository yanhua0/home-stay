package org.cqupt.home.dto.request;

import lombok.Data;
import org.cqupt.home.common.base.PageForm;
@Data
public class HomeStayPageDTO extends PageForm {
    private String address;
    private String houseName;
    private Integer ownerId;
}
