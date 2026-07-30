package com.university.listener;

import com.university.database.DatabaseConfig;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.Statement;

@WebListener
public class DatabaseInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("[DatabaseInitializer] Initializing H2 database connection pool and checking tables...");
        
        String sql = "CREATE TABLE IF NOT EXISTS inquiries (" +
                "id INT AUTO_INCREMENT PRIMARY KEY, " +
                "name VARCHAR(255) NOT NULL, " +
                "email VARCHAR(255) NOT NULL, " +
                "phone VARCHAR(50) NOT NULL, " +
                "program VARCHAR(255), " +
                "message TEXT, " +
                "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP" +
                ")";
        
        try (Connection conn = DatabaseConfig.getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.execute(sql);
            System.out.println("[DatabaseInitializer] DB checked/initialized successfully.");
        } catch (Exception e) {
            System.err.println("[DatabaseInitializer] CRITICAL error while checking/initializing database tables:");
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("[DatabaseInitializer] Shutting down database connection pool...");
        DatabaseConfig.shutdown();
        System.out.println("[DatabaseInitializer] Connection pool shutdown complete.");
    }
}
