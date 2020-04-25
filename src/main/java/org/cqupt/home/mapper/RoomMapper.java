package org.cqupt.home.mapper;

import org.apache.ibatis.annotations.Param;
import org.cqupt.home.common.mapper.Mapper;
import org.cqupt.home.dto.request.BookingReqDTO;
import org.cqupt.home.dto.response.RoomResDTO;
import org.cqupt.home.model.Room;

import java.util.List;

public interface RoomMapper extends Mapper<Room> {
    List<Room> findByReqDTO(@Param("userId") Integer userId);

    List<RoomResDTO> findByPageDTO(BookingReqDTO bookingReqDTO);
}