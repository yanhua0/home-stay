package org.cqupt.home.common.handler;

import lombok.extern.slf4j.Slf4j;
import org.cqupt.home.common.enums.HsErrorCode;
import org.cqupt.home.common.exception.HomeStayException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {
    @ExceptionHandler({HomeStayException.class})
    public ResponseEntity<Object> homeStayException(HomeStayException home){
        log.error("系统出错：",home);
        return new ResponseEntity<>(buildResult(home), HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler({MethodArgumentNotValidException.class})
    @SuppressWarnings("Duplicates")
    public ResponseEntity<Object> methodException(MethodArgumentNotValidException e){
        List<FieldError> fieldErrors=e.getBindingResult().getFieldErrors();
        FieldError fieldError=fieldErrors.get(0);
        HomeStayException homeStayException=new HomeStayException(HsErrorCode.FILED_ERROR,fieldError.getDefaultMessage());
        log.error("参数校验错误：{}",e.getBindingResult().getFieldErrors().get(0).getDefaultMessage());
        return new ResponseEntity<>(buildResult(homeStayException), HttpStatus.INTERNAL_SERVER_ERROR);
    }
    @ExceptionHandler({BindException.class})
    @SuppressWarnings("Duplicates")
    public ResponseEntity<Object> bind(BindException e){
        List<FieldError> fieldErrors=e.getBindingResult().getFieldErrors();
        FieldError fieldError=fieldErrors.get(0);
        HomeStayException homeStayException=new HomeStayException(HsErrorCode.FILED_ERROR,fieldError.getDefaultMessage());
        log.error("参数校验错误：{}",e.getBindingResult().getFieldErrors().get(0).getDefaultMessage());
        return new ResponseEntity<>(buildResult(homeStayException), HttpStatus.INTERNAL_SERVER_ERROR);
    }
    @ExceptionHandler({Exception.class})
    public ResponseEntity<Object> homeStayException(Exception e){
        log.error("内部错误：",e);
        return new ResponseEntity<>(buildResult(HsErrorCode.SYSTEM_ERROR), HttpStatus.INTERNAL_SERVER_ERROR);
    }
    private Map<String,String> buildResult(HsErrorCode hsErrorCode){
        Map<String,String> map=new TreeMap<>();
        map.put("error_code",hsErrorCode.getErrorCode());
        map.put("message",hsErrorCode.getMessage());
        return map;
    }
    private Map<String,String> buildResult(HomeStayException home){
        Map<String,String> map=new TreeMap<>();
        map.put("error_code",home.getErrorCode());
        map.put("message",home.getMessage());
        return map;
    }
}
