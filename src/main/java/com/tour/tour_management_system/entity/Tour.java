package com.tour.tour_management_system.entity;

import java.sql.Timestamp;

public class Tour {

    private int id;
    private String title;
    private String location;
    private double price;
    private double discountPrice;
    private String duration;
    private double rating;
    private int reviews;
    private String category;
    private String tourType;
    private String difficulty;
    private String description;
    private String image;
    private int availableSeats;
    private String bestSeason;
    private boolean featured;
    private boolean trending;
    private Timestamp createdAt;

    public Tour() {
    }

    public Tour(int id, String title, String location, double price, double discountPrice,
                String duration, double rating, int reviews, String category,
                String tourType, String difficulty, String description,
                String image, int availableSeats, String bestSeason,
                boolean featured, boolean trending, Timestamp createdAt) {

        this.id = id;
        this.title = title;
        this.location = location;
        this.price = price;
        this.discountPrice = discountPrice;
        this.duration = duration;
        this.rating = rating;
        this.reviews = reviews;
        this.category = category;
        this.tourType = tourType;
        this.difficulty = difficulty;
        this.description = description;
        this.image = image;
        this.availableSeats = availableSeats;
        this.bestSeason = bestSeason;
        this.featured = featured;
        this.trending = trending;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(double discountPrice) {
        this.discountPrice = discountPrice;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getReviews() {
        return reviews;
    }

    public void setReviews(int reviews) {
        this.reviews = reviews;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTourType() {
        return tourType;
    }

    public void setTourType(String tourType) {
        this.tourType = tourType;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getAvailableSeats() {
        return availableSeats;
    }

    public void setAvailableSeats(int availableSeats) {
        this.availableSeats = availableSeats;
    }

    public String getBestSeason() {
        return bestSeason;
    }

    public void setBestSeason(String bestSeason) {
        this.bestSeason = bestSeason;
    }

    public boolean isFeatured() {
        return featured;
    }

    public void setFeatured(boolean featured) {
        this.featured = featured;
    }

    public boolean isTrending() {
        return trending;
    }

    public void setTrending(boolean trending) {
        this.trending = trending;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

}