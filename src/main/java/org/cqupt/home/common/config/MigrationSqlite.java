package org.cqupt.home.common.config;

import org.flywaydb.core.Flyway;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.sql.DataSource;

/**
 * flyway的配置文件
 */
@Component
public class MigrationSqlite {

    @Resource
    private DataSource dataSource;


    @PostConstruct
    public void migrate() {
        Flyway flyway = new Flyway();
        flyway.setDataSource(dataSource);
        flyway.setTable("flyway_history");
        flyway.setLocations("db/sqlite");
        flyway.setEncoding("UTF-8");
        flyway.setBaselineOnMigrate(true);
        flyway.migrate();

 }
}
