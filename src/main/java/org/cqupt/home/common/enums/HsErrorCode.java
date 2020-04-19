package org.cqupt.home.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum  HsErrorCode {
    SYSTEM_ERROR("0001","内部错误"),
    FILED_ERROR("0002","%s"),
    USER_CODE_REPEAT("1000","用户编码%s已经存在"),
    USER_CODE_NULL("1001","用户账号%s不存在"),
    HOUSE_NAME_REPEAT("2000","民宿名称%s已经存在"),
    ROOM_NAME_REPEAT("3000","房间名称%s已经存在");
    private String errorCode;
    private String message;

}
