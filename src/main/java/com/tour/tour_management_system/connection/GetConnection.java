package com.tour.tour_management_system.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConnection {

    public static Connection getConnectionObject(){

        try {
        	String host = System.getenv("PGHOST");
        	String database = System.getenv("PGDATABASE");
        	String user = System.getenv("PGUSER");
        	String password = System.getenv("PGPASSWORD");
            Class.forName("org.postgresql.Driver");
            String url="jdbc:postgresql://" + host + "/" + database + "?sslmode=require";
            return DriverManager.getConnection(
            		url,
                    user,
                    password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
		return null;
    }
}