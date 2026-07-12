package com.tour.tour_management_system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.tour.tour_management_system.connection.GetConnection;
import com.tour.tour_management_system.entity.Tour;

public class TourDao {

    public ArrayList<Tour> getAllTours() {

        ArrayList<Tour> list = new ArrayList<>();

        try {

            Connection con = GetConnection.getConnectionObject();

            String sql = "select * from tours";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Tour t = new Tour();

                t.setId(rs.getInt("id"));
                t.setTitle(rs.getString("title"));
                t.setLocation(rs.getString("location"));
                t.setPrice(rs.getDouble("price"));
                t.setDiscountPrice(rs.getDouble("discount_price"));
                t.setDuration(rs.getString("duration"));
                t.setRating(rs.getDouble("rating"));
                t.setReviews(rs.getInt("reviews"));
                t.setCategory(rs.getString("category"));
                t.setTourType(rs.getString("tour_type"));
                t.setDifficulty(rs.getString("difficulty"));
                t.setDescription(rs.getString("description"));
                t.setImage(rs.getString("image"));
                t.setAvailableSeats(rs.getInt("available_seats"));
                t.setBestSeason(rs.getString("best_season"));
                t.setFeatured(rs.getBoolean("featured"));
                t.setTrending(rs.getBoolean("trending"));
                t.setCreatedAt(rs.getTimestamp("created_at"));

                list.add(t);

            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return list;

    }
    public ArrayList<Tour> getPopularTours() {

        ArrayList<Tour> list = new ArrayList<>();

        try {

            Connection con = GetConnection.getConnectionObject();

            String sql = "SELECT * FROM tours ORDER BY rating DESC LIMIT 4";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Tour t = new Tour();

                t.setId(rs.getInt("id"));
                t.setTitle(rs.getString("title"));
                t.setLocation(rs.getString("location"));
                t.setPrice(rs.getDouble("price"));
                t.setDiscountPrice(rs.getDouble("discount_price"));
                t.setDuration(rs.getString("duration"));
                t.setRating(rs.getDouble("rating"));
                t.setReviews(rs.getInt("reviews"));
                t.setCategory(rs.getString("category"));
                t.setTourType(rs.getString("tour_type"));
                t.setDifficulty(rs.getString("difficulty"));
                t.setDescription(rs.getString("description"));
                t.setImage(rs.getString("image"));
                t.setAvailableSeats(rs.getInt("available_seats"));
                t.setBestSeason(rs.getString("best_season"));
                t.setFeatured(rs.getBoolean("featured"));
                t.setTrending(rs.getBoolean("trending"));
                t.setCreatedAt(rs.getTimestamp("created_at"));

                list.add(t);

            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return list;
        

    }
    public Tour getTourById(int id) {

        String sql = "SELECT * FROM tours WHERE id=?";

        try (Connection con = GetConnection.getConnectionObject();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Tour tour = new Tour();

                tour.setId(rs.getInt("id"));
                tour.setTitle(rs.getString("title"));
                tour.setLocation(rs.getString("location"));
                tour.setPrice(rs.getDouble("price"));
                tour.setDiscountPrice(rs.getDouble("discount_price"));
                tour.setDuration(rs.getString("duration"));
                tour.setRating(rs.getDouble("rating"));
                tour.setReviews(rs.getInt("reviews"));
                tour.setCategory(rs.getString("category"));
                tour.setTourType(rs.getString("tour_type"));
                tour.setDifficulty(rs.getString("difficulty"));
                tour.setDescription(rs.getString("description"));
                tour.setImage(rs.getString("image"));
                tour.setAvailableSeats(rs.getInt("available_seats"));
                tour.setBestSeason(rs.getString("best_season"));
                tour.setFeatured(rs.getBoolean("featured"));
                tour.setTrending(rs.getBoolean("trending"));

                return tour;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

}