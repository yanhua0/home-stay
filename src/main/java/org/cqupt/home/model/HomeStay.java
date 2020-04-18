package org.cqupt.home.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "home_stay")
@Getter
@Setter
public class HomeStay {
    @Id
    private Integer id;

    @Column(name = "house_name")
    private String houseName;

    @Column(name = "create_time")
    private Date createTime;

    private String address;

    private Double price;

    @Column(name = "house_owner_id")
    private Integer houseOwnerId;

    private String describe;

    private String picture;

}