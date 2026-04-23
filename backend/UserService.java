/**
 * 用户服务接口
 * 作用：定义用户模块的业务功能
 */
package com.team.score_system.service;

import com.team.score_system.entity.User;

public interface UserService {
    String login(String username, String password);
}

