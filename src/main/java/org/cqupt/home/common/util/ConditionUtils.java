package org.cqupt.home.common.util;

import tk.mybatis.mapper.entity.Condition;

public class ConditionUtils {

    public static Condition eq(String column,Object obj,Class clazz){
        Condition condition=new Condition(clazz);
        condition.createCriteria().andEqualTo(column,obj);
        return condition;
    }
}
