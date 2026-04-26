package com.team.score_system.service.impl;

import com.team.score_system.entity.User;
import com.team.score_system.repository.UserRepository;
import com.team.score_system.service.UserService;
import com.team.score_system.utils.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户服务实现类
 * 作用：实现登录业务逻辑
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public String login(String username, String password) {
        // 1. 根据用户名查用户
        User user = userRepository.findByUsername(username).orElse(null);

        // 2. 校验用户是否存在
        if (user == null) {
            throw new RuntimeException("用户不存在");
        }

        // 3. 校验密码是否正确
        if (!user.getPassword().equals(password)) {
            throw new RuntimeException("密码错误");
        }

        // 4. 生成并返回token
        return JwtUtil.generateToken(user.getId(), user.getRole());
    }
}