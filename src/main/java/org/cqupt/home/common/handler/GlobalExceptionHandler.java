package org.cqupt.home.common.handler;

import lombok.extern.slf4j.Slf4j;
import org.cqupt.home.common.enums.HsErrorCode;
import org.cqupt.home.common.exception.HomeStayException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.Map;
import java.util.TreeMap;

@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {
    @ExceptionHandler({HomeStayException.class})
    public ResponseEntity<Object> homeStayException(HomeStayException home){
        log.error("系统出错：",home);
        return new ResponseEntity<>(home, HttpStatus.INTERNAL_SERVER_ERROR);
    }
    @ExceptionHandler({Exception.class})
    public ResponseEntity<Object> homeStayException(Exception e){
        log.error("内部错误：",e);
        return new ResponseEntity<>(buildResult(HsErrorCode.SYSTEM_ERROR), HttpStatus.INTERNAL_SERVER_ERROR);
    }
    private Map<String,String> buildResult(HsErrorCode hsErrorCode){
        Map<String,String> map=new TreeMap<>();
        map.put("error_code",hsErrorCode.getErrorCode());
        map.put("error_message",hsErrorCode.getErrorMessage());
        return map;
    }
}
