package com.team.score_system.utils;

import lombok.Data;

/**
 * 统一返回结果类
 * 成功：{"code":200, "message":"success", "data": xxx}
 * 失败：{"code":500, "message":"错误信息", "data": null}
 */
@Data
public class Result {
    private Integer code;
    private String message;
    private Object data;

    public static Result success(Object data) {
        Result r = new Result();
        r.setCode(200);
        r.setMessage("success");
        r.setData(data);
        return r;
    }

    public static Result error(String message) {
        Result r = new Result();
        r.setCode(500);
        r.setMessage(message);
        return r;
    }
}