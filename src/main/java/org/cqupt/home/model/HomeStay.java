package org.cqupt.home.model;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.NotEmpty;

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
    @NotEmpty(message = "房屋名称不能为空")
    private String houseName;

    @Column(name = "create_time")
    private Date createTime;
    private String address;



    @Column(name = "house_owner_id")
    private Integer houseOwnerId;

    private String description;

    private String picture;

    private String city;

}