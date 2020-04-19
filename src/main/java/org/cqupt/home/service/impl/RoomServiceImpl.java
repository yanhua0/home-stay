/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.service.impl;


import org.apache.commons.lang.StringUtils;
import org.cqupt.home.common.enums.HsErrorCode;
import org.cqupt.home.common.exception.HomeStayException;
import org.cqupt.home.common.util.BeanCopyUtils;
import org.cqupt.home.common.util.ConditionUtils;
import org.cqupt.home.dto.request.RoomReqDTO;
import org.cqupt.home.mapper.RoomMapper;
import org.cqupt.home.model.Room;
import org.cqupt.home.service.RoomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@Service
public class RoomServiceImpl  implements RoomService {
    @Resource
    private RoomMapper roomMapper;


    @Override
    public void save(RoomReqDTO reqDTO) {
       checkName(reqDTO);
       Room room= BeanCopyUtils.copyBean(reqDTO,Room.class);
       room.setCreateTime(new Date());
       room.setUsed(1);
       roomMapper.insertSelective(room);
    }


    @Override
    public void deleteById(Integer id) {
        roomMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Room updateDTO) {
        roomMapper.updateByPrimaryKeySelective(updateDTO);
    }

    private void checkName(Room reqDTO) {
        if(StringUtils.isEmpty(reqDTO.getRoomName())){
            return;
        }
        List<Room> rooms = roomMapper.selectByCondition(ConditionUtils.eq("roomName", reqDTO.getRoomName(), Room.class));
        for (Room r : rooms) {
            if (!r.getId().equals(reqDTO.getId())) {
                throw new HomeStayException(HsErrorCode.HOUSE_NAME_REPEAT, reqDTO.getRoomName());
            }
        }
    }

}
