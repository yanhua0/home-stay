package org.cqupt.home.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.util.Date;

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
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return room_name
     */
    public String getRoomName() {
        return roomName;
    }

    /**
     * @param roomName
     */
    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    /**
     * @return price
     */
    public Double getPrice() {
        return price;
    }

    /**
     * @param price
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * @return home_id
     */
    public Integer getHomeId() {
        return homeId;
    }

    /**
     * @param homeId
     */
    public void setHomeId(Integer homeId) {
        this.homeId = homeId;
    }

    /**
     * @return create_time
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * @return used
     */
    public Integer getUsed() {
        return used;
    }

    /**
     * @param used
     */
    public void setUsed(Integer used) {
        this.used = used;
    }
}