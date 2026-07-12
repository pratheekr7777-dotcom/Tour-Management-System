package com.tour.tour_management_system.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tour.tour_management_system.connection.GetConnection;
import com.tour.tour_management_system.entity.Booking;


public class BookingDao {

    // Save Booking
    public boolean saveBooking(Booking booking) {

        String sql = "INSERT INTO bookings(user_id, tour_id, full_name, email, phone, "
                + "travel_date, adults, children, total_people, total_price, "
                + "special_request, booking_status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = GetConnection.getConnectionObject();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, booking.getUserId());
            ps.setInt(2, booking.getTourId());
            ps.setString(3, booking.getFullName());
            ps.setString(4, booking.getEmail());
            ps.setString(5, booking.getPhone());

            ps.setDate(6, booking.getTravelDate());

            ps.setInt(7, booking.getAdults());
            ps.setInt(8, booking.getChildren());
            ps.setInt(9, booking.getTotalPeople());

            ps.setDouble(10, booking.getTotalPrice());

            ps.setString(11, booking.getSpecialRequest());
            ps.setString(12, booking.getBookingStatus());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Get all bookings of a user
    public ArrayList<Booking> getBookingsByUser(int userId) {

        ArrayList<Booking> list = new ArrayList<>();

        String sql = "SELECT * FROM bookings WHERE user_id=? ORDER BY booking_date DESC";

        try (Connection con = GetConnection.getConnectionObject();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Booking booking = new Booking();

                booking.setBookingId(rs.getInt("booking_id"));
                booking.setUserId(rs.getInt("user_id"));
                booking.setTourId(rs.getInt("tour_id"));

                booking.setFullName(rs.getString("full_name"));
                booking.setEmail(rs.getString("email"));
                booking.setPhone(rs.getString("phone"));

                booking.setTravelDate(rs.getDate("travel_date"));

                booking.setAdults(rs.getInt("adults"));
                booking.setChildren(rs.getInt("children"));
                booking.setTotalPeople(rs.getInt("total_people"));

                booking.setTotalPrice(rs.getDouble("total_price"));

                booking.setSpecialRequest(rs.getString("special_request"));
                booking.setBookingStatus(rs.getString("booking_status"));

                booking.setBookingDate(rs.getTimestamp("booking_date"));

                list.add(booking);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // Get booking by booking id
    public Booking getBookingById(int bookingId) {

        String sql = "SELECT * FROM bookings WHERE booking_id=?";

        try (Connection con = GetConnection.getConnectionObject();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, bookingId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Booking booking = new Booking();

                booking.setBookingId(rs.getInt("booking_id"));
                booking.setUserId(rs.getInt("user_id"));
                booking.setTourId(rs.getInt("tour_id"));

                booking.setFullName(rs.getString("full_name"));
                booking.setEmail(rs.getString("email"));
                booking.setPhone(rs.getString("phone"));

                booking.setTravelDate(rs.getDate("travel_date"));

                booking.setAdults(rs.getInt("adults"));
                booking.setChildren(rs.getInt("children"));
                booking.setTotalPeople(rs.getInt("total_people"));

                booking.setTotalPrice(rs.getDouble("total_price"));

                booking.setSpecialRequest(rs.getString("special_request"));
                booking.setBookingStatus(rs.getString("booking_status"));

                booking.setBookingDate(rs.getTimestamp("booking_date"));

                return booking;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Cancel booking
    public boolean cancelBooking(int bookingId) {

        String sql = "UPDATE bookings SET booking_status='Cancelled' WHERE booking_id=?";

        try (Connection con = GetConnection.getConnectionObject();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, bookingId);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    public Booking getLatestBooking(int userId) {

        String sql = """
                SELECT *
                FROM bookings
                WHERE user_id = ?
                ORDER BY booking_date DESC
                LIMIT 1
                """;

        try (Connection con = GetConnection.getConnectionObject();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Booking booking = new Booking();

                booking.setBookingId(rs.getInt("booking_id"));
                booking.setUserId(rs.getInt("user_id"));
                booking.setTourId(rs.getInt("tour_id"));

                booking.setFullName(rs.getString("full_name"));
                booking.setEmail(rs.getString("email"));
                booking.setPhone(rs.getString("phone"));

                booking.setTravelDate(rs.getDate("travel_date"));
                booking.setAdults(rs.getInt("adults"));
                booking.setChildren(rs.getInt("children"));
                booking.setTotalPeople(rs.getInt("total_people"));
                booking.setTotalPrice(rs.getDouble("total_price"));

                booking.setSpecialRequest(rs.getString("special_request"));
                booking.setBookingStatus(rs.getString("booking_status"));
                booking.setBookingDate(rs.getTimestamp("booking_date"));

                return booking;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}