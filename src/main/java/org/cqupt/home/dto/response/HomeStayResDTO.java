/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.dto.response;

import lombok.Getter;
import lombok.Setter;
import org.cqupt.home.model.HomeStay;

@Getter
@Setter
public class HomeStayResDTO extends HomeStay {
     private String userCode;
}
