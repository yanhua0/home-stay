package org.cqupt.home.common.config;

import org.flywaydb.core.Flyway;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.Resource;
import javax.sql.DataSource;

/**
 * flyway的配置文件
 */
@Configuration
public class MigrationSqlite {

    @Resource
    private DataSource dataSource;


    @Bean
    public Flyway migrate() {
        //初始化flyway类
        Flyway flyway = new Flyway();
        //设置加载数据库的相关配置信息
        flyway.setDataSource(dataSource);
        //设置存放flyway metadata数据的表名，默认"schema_version"，可不写
        flyway.setTable("flyway_history");
        //设置flyway扫描sql升级脚本、java升级脚本的目录路径或包路径，默认"db/migration"，可不写
        flyway.setLocations("db/sqlite");
        //设置sql脚本文件的编码，默认"UTF-8"，可不写
        flyway.setEncoding("UTF-8");
        flyway.setBaselineOnMigrate(true);
        flyway.migrate();
        return flyway;
 }
}
