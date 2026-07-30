package com.university.database;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DatabaseConfig {
    private static HikariDataSource dataSource;

    static {
        try {
            // Load H2 driver explicitly
            Class.forName("org.h2.Driver");
            
            HikariConfig config = new HikariConfig();
            config.setJdbcUrl("jdbc:h2:./db/college_portal;AUTO_SERVER=TRUE;DB_CLOSE_DELAY=-1");
            config.setUsername("sa");
            config.setPassword("");
            config.setMaximumPoolSize(10);
            config.setConnectionTimeout(30000);
            config.setIdleTimeout(600000);
            config.setMaxLifetime(1800000);
            
            dataSource = new HikariDataSource(config);
        } catch (Exception e) {
            System.err.println("CRITICAL: Failed to initialize HikariCP connection pool!");
            e.printStackTrace();
            throw new RuntimeException("Failed to initialize HikariCP connection pool: " + e.getMessage());
        }
    }

    public static Connection getConnection() throws SQLException {
        if (dataSource == null) {
            throw new SQLException("DataSource is not initialized properly.");
        }
        return dataSource.getConnection();
    }

    public static void shutdown() {
        if (dataSource != null && !dataSource.isClosed()) {
            dataSource.close();
        }
    }
}
