/*
 * www.unisinsight.com Inc.
 * Copyright (c) 2018 All Rights Reserved
 */
package org.cqupt.home.dto.request;

import lombok.Getter;
import lombok.Setter;
import org.cqupt.home.model.HomeStay;
import org.springframework.web.multipart.MultipartFile;

/**
 * @date 2020/04/18
 * @since 1.0
 */
@Getter
@Setter
public class HomeStayReqDTO extends HomeStay {
    private MultipartFile file;
}
