package com.team.score_system.entity;

import lombok.Data;
import jakarta.persistence.*;

/**
 * 用户实体类
 * 作用：对应数据库中的 user 表，每个字段对应表中一列
 * JPA 会根据这个类自动创建/更新数据库表结构
 */
@Data          // Lombok注解：自动生成getter/setter/toString等方法
@Entity        // 告诉JPA：这个类是一张数据库表
@Table(name = "user")  // 指定表名为 user（不写的话默认类名小写 "user"）
public class User {
    @Id     // 指定这是主键
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // 主键自增长（MySQL的AUTO_INCREMENT）
    private Integer id;       // 用户ID，主键
    @Column(unique = true, nullable = false)  // 唯一约束 + 不能为空
    private String username;  // 用户名（登录用）
    @Column(nullable = false)  // 不能为空
    private String password;   // 密码（登录用）
    private String role;       // 角色：admin（管理员）/ teacher（教师）/ student（学生）
    private String name;       // 真实姓名
}