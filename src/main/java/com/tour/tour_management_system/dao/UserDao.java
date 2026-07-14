package com.tour.tour_management_system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tour.tour_management_system.connection.GetConnection;
import com.tour.tour_management_system.entity.User;

public class UserDao {

    Connection con = GetConnection.getConnectionObject();
    
    public boolean updatePassword(String email, String password) {

        boolean status = false;

        try {

            Connection con = GetConnection.getConnectionObject();

            String query =
                    "UPDATE users SET password=? WHERE email=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, password);

            ps.setString(2, email);

            int rows = ps.executeUpdate();

            if (rows > 0) {

                status = true;

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return status;

    }
    public boolean checkEmail(String email) {

        boolean found = false;

        try {

            Connection con = GetConnection.getConnectionObject();

            String query = "SELECT * FROM users WHERE email = ?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                found = true;

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return found;

    }
    public boolean registerUser(User user) {

        String sql = "INSERT INTO users(name,email,phone,password,gender,dob,address) VALUES(?,?,?,?,?,?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getGender());
            ps.setDate(6, user.getDob());
            ps.setString(7, user.getAddress());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    public User login(String email, String password) {

        User user = null;

        try {

            Connection con = GetConnection.getConnectionObject();

            String sql = "SELECT * FROM users WHERE email=? AND password=? AND status='Active'";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setDob(rs.getDate("dob"));
                user.setAddress(rs.getString("address"));

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    public boolean isEmailExists(String email) {

        String sql = "SELECT 1 FROM users WHERE email = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}