package com.tour.tour_management_system.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConnection {

    public static Connection getConnectionObject(){

        try {
            Class.forName("org.postgresql.Driver");

            return DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/tour-db",
                    "postgres",
                    "test");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
		return null;
    }
}