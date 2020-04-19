/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.dto.request;

import lombok.Getter;
import lombok.Setter;
import org.cqupt.home.common.base.PageForm;
import org.cqupt.home.common.consts.DateConsts;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @date 2020/04/19
 * @since 1.0
 */
@Getter
@Setter
public class BookingReqDTO  extends PageForm {
    @DateTimeFormat(pattern = DateConsts.defaultTime)
    private Date intoStart;
    @DateTimeFormat(pattern = DateConsts.defaultTime)
    private Date intoEnd;
    @DateTimeFormat(pattern = DateConsts.defaultTime)
    private Date leaveStart;
    @DateTimeFormat(pattern = DateConsts.defaultTime)
    private Date leaveEnd;
    private Integer used;
    private Integer homeId;
    private String  roomName;
    private Integer id;
}
