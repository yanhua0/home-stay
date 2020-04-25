package org.cqupt.home.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.util.Date;

public class Booking {
    @Id
    private Integer id;

    @Column(name = "room_id")
    private Integer roomId;

    @Column(name = "users_id")
    private Integer usersId;

    @Column(name = "into_time")
    private Date intoTime;

    @Column(name = "leave_time")
    private Date leaveTime;

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
     * @return room_id
     */
    public Integer getRoomId() {
        return roomId;
    }

    /**
     * @param roomId
     */
    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    /**
     * @return users_id
     */
    public Integer getUsersId() {
        return usersId;
    }

    /**
     * @param usersId
     */
    public void setUsersId(Integer usersId) {
        this.usersId = usersId;
    }

    /**
     * @return into_time
     */
    public Date getIntoTime() {
        return intoTime;
    }

    /**
     * @param intoTime
     */
    public void setIntoTime(Date intoTime) {
        this.intoTime = intoTime;
    }

    /**
     * @return leave_time
     */
    public Date getLeaveTime() {
        return leaveTime;
    }

    /**
     * @param leaveTime
     */
    public void setLeaveTime(Date leaveTime) {
        this.leaveTime = leaveTime;
    }
}