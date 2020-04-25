/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.StringUtils;
import org.cqupt.home.common.enums.HsErrorCode;
import org.cqupt.home.common.exception.HomeStayException;
import org.cqupt.home.common.util.BeanCopyUtils;
import org.cqupt.home.common.util.ConditionUtils;
import org.cqupt.home.dto.request.BookingReqDTO;
import org.cqupt.home.dto.request.RoomReqDTO;
import org.cqupt.home.dto.response.RoomResDTO;
import org.cqupt.home.dto.response.UsersResDTO;
import org.cqupt.home.mapper.RoomMapper;
import org.cqupt.home.mapper.UsersMapper;
import org.cqupt.home.model.Room;
import org.cqupt.home.model.Users;
import org.cqupt.home.service.RoomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Objects;


@Service
public class RoomServiceImpl implements RoomService {
    @Resource
    private RoomMapper roomMapper;

    @Resource
    private UsersMapper usersMapper;

    @Override
    public void save(RoomReqDTO reqDTO) {
        checkName(reqDTO);
        Room room = BeanCopyUtils.copyBean(reqDTO, Room.class);
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

    @Override
    public List<Room> findByHomeId(UsersResDTO users) {
        if (users.getRoleId() == 1) {
            return roomMapper.findByReqDTO(null);
        }
        return roomMapper.findByReqDTO(users.getId());
    }

    @Override
    public PageInfo<RoomResDTO> findByReq(BookingReqDTO bookingReqDTO) {
        PageHelper.startPage(bookingReqDTO.getPage(), bookingReqDTO.getPageSize());
        if (bookingReqDTO.getUsersResDTO().getRoleId() != 1&&bookingReqDTO.getKey()==0) {
            bookingReqDTO.setHouseOwnerId(bookingReqDTO.getUsersResDTO().getId());

        }
        List<RoomResDTO> roomResDTOList = roomMapper.findByPageDTO(bookingReqDTO);
        for (RoomResDTO roomResDTO : roomResDTOList) {
            Integer usersId=roomResDTO.getOrderUsersId();
            Users users=usersMapper.selectByPrimaryKey(usersId);
            if(Objects.nonNull(users)){
                roomResDTO.setUsersResDTO(BeanCopyUtils.copyBean(users,UsersResDTO.class));
            }

        }
        return new PageInfo<>(roomResDTOList);
    }

    @Override
    public void deleteIds(String ids) {
        roomMapper.deleteByIds(ids);
    }

    @Override
    public RoomResDTO findById(Integer id) {
        BookingReqDTO bookingReqDTO = new BookingReqDTO();
        bookingReqDTO.setRoomId(id);
        return roomMapper.findByPageDTO(bookingReqDTO).get(0);
    }

    private void checkName(Room reqDTO) {
        if (StringUtils.isEmpty(reqDTO.getRoomName())) {
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
