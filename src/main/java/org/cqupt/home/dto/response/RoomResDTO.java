/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.dto.response;

import lombok.Getter;
import lombok.Setter;
import org.cqupt.home.model.Room;

/**
 * @date 2020/04/19
 * @since 1.0
 */
@Getter
@Setter
public class RoomResDTO  extends Room {
    private String usedStr;
    private UsersResDTO usersResDTO;
    private HomeStayResDTO homeStayResDTO;
}
