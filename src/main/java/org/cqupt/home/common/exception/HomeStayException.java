package org.cqupt.home.common.exception;

import lombok.Getter;
import org.cqupt.home.common.enums.HsErrorCode;
@Getter
public class HomeStayException extends RuntimeException{
    private String errorCode;

    public HomeStayException(HsErrorCode hsErrorCode) {
        super(hsErrorCode.getMessage());
        this.errorCode=hsErrorCode.getErrorCode();

    }
    public HomeStayException(HsErrorCode hsErrorCode,Object...param) {
        super(String.format(hsErrorCode.getMessage(),param));
        this.errorCode=hsErrorCode.getErrorCode();
    }
}
