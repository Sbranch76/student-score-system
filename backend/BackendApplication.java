package com.shanzhu.sc;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Slf4j// 1. 提供日志功能
@SpringBootApplication// 2. 标识这是Spring Boot启动类（核心）
@EnableTransactionManagement// 3. 开启事务管理（保证数据一致性）
@MapperScan("com.shanzhu.sc.mapper")// 4. 扫描所有Mapper接口
public class BackendApplication {

  public static void main(String[] args) {
    //SpringBoot 执行启动
    SpringApplication.run(BackendApplication.class, args);

    log.info("=====================项目后端启动成功============================");
  }

}