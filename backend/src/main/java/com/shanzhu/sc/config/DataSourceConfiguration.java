package com.shanzhu.sc.config;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.ExceptionSorter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.sql.SQLException;
import java.util.Properties;

@Configuration
public class DataSourceConfiguration {
  // 从 application.yml 读取数据库配置
  @Value("${jdbc.driver}")
  private String jdbcDriver;// 驱动类名
  @Value("${jdbc.url}")
  private String jdbcUrl;// 数据库地址
  @Value("${jdbc.username}")
  private String jdbcUsername;// 用户名
  @Value("${jdbc.password}")
  private String jdbcPassword;// 密码

  @Bean(name="dataSource")
  public DruidDataSource createDataSource() throws Exception {
    DruidDataSource dataSource = new DruidDataSource();// 创建Druid连接池对象
    dataSource.setDriverClassName(jdbcDriver);
    dataSource.setUrl(jdbcUrl);
    dataSource.setUsername(jdbcUsername);
    dataSource.setPassword(jdbcPassword);

    // 关闭连接后不自动commit
    dataSource.setDefaultAutoCommit(false);
    // 设置连接异常处理
    dataSource.setBreakAfterAcquireFailure(true);
    // 将SQLException抛出重要配置
    dataSource.setFailFast(true);
    dataSource.setConnectionErrorRetryAttempts(0);// 连接错误不重试
    // 配置自定义的异常处理器
    dataSource.setExceptionSorter(new CustomExceptionSorter());

    // 关闭Druid连接池内部的异常处理
//    dataSource.setFilters("stat");
    return dataSource;
  }

}

class CustomExceptionSorter implements ExceptionSorter {

  @Override
  public boolean isExceptionFatal(SQLException e) {
    // 将所有异常视为致命异常，即抛出到上层
    // 打印异常堆栈信息
    e.printStackTrace();
    return true;
  }

  @Override
  public void configFromProperties(Properties properties) {
    // 配置信息可以为空
  }
}
