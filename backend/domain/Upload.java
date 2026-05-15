package com.shanzhu.sc.domain;

import lombok.Data;


@Data
public class Upload {

    /**
     * id
     */
    private Integer id;

    /**
     * 用户 id
     */
    private String userId;

    /**
     * 用户等级
     */
    private Integer level;

    /**
     * 储存地址
     */
    private String url;

}
