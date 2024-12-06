package main.database;

import java.io.FileInputStream;
import java.sql.Connection;
import java.util.Properties;

public class DBConnection {
    public static Connection getConnection() {
        // Get url, username, and password from connection.properties
        try (FileInputStream fis = new FileInputStream("src/main/resources/connection.properties")) {
            Properties properties = new Properties();
            properties.load(fis);
            String url = properties.getProperty("DB_URL");
            String username = properties.getProperty("DB_USER");
            String password = properties.getProperty("DB_PASSWORD");
            return java.sql.DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
