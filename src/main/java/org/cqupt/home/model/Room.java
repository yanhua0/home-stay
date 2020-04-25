package org.cqupt.home.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Id;
import java.util.Date;
@Data
public class Room {
    @Id
    private Integer id;

    @Column(name = "room_name")
    private String roomName;

    private Double price;

    @Column(name = "home_id")
    private Integer homeId;

    @Column(name = "create_time")
    private Date createTime;

    private Integer used;
    /**
     * 预订人
     */
    private Integer orderUsersId;

}