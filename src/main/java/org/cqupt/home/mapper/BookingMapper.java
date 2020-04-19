package org.cqupt.home.mapper;

import org.cqupt.home.common.mapper.Mapper;
import org.cqupt.home.dto.request.BookingReqDTO;
import org.cqupt.home.dto.response.BookingResDTO;
import org.cqupt.home.model.Booking;

import java.util.List;

public interface BookingMapper extends Mapper<Booking> {
    List<BookingResDTO> findByPage(BookingReqDTO bookingReqDTO);
}