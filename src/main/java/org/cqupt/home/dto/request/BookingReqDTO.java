/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.dto.request;

import lombok.Getter;
import lombok.Setter;
import org.cqupt.home.common.base.PageForm;
import org.cqupt.home.dto.response.UsersResDTO;

/**
 * @date 2020/04/19
 * @since 1.0
 */
@Getter
@Setter
public class BookingReqDTO  extends PageForm {
    private String intoTime;

    private String leaveTime;
    private String intoStart;

    private String intoEnd;

    private String leaveStart;

    private String leaveEnd;
    private Integer used;
    private Integer homeId;
    private String  roomName;
    private Integer  roomId;
    private Integer id;
    private Integer usersId;
    private Integer houseOwnerId;
    private UsersResDTO usersResDTO;
    private Integer key=0;
}
