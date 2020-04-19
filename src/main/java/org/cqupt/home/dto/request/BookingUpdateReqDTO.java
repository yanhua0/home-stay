package org.cqupt.home.dto.request;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class BookingUpdateReqDTO {
    private MultipartFile file;
    private String houseName;
    private Integer roomId;
    private String roomName;
    private String price;
    private String city;
    private String userCode;
}
