package org.cqupt.home.common.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
@Slf4j
public class BeanCopyUtils {
    public static <T> T copyBean(Object obj, Class<T> t) {
        Object o = null;
        try {
            o = t.newInstance();
            BeanUtils.copyProperties(obj, o);
        } catch (Exception e) {
           log.error("转化异常：",e);
        }
        return (T) o;
    }

}
