package com.tour.tour_management_system.entity;

import java.sql.Date;
import java.sql.Timestamp;

public class Booking {

    private int bookingId;
    private int userId;
    private int tourId;

    private String fullName;
    private String email;
    private String phone;

    private Date travelDate;

    private int adults;
    private int children;
    private int totalPeople;

    private double totalPrice;

    private String specialRequest;

    private String bookingStatus;

    private Timestamp bookingDate;

    public Booking() {

    }

    public Booking(int bookingId, int userId, int tourId, String fullName, String email, String phone,
            Date travelDate, int adults, int children, int totalPeople, double totalPrice,
            String specialRequest, String bookingStatus, Timestamp bookingDate) {

        this.bookingId = bookingId;
        this.userId = userId;
        this.tourId = tourId;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.travelDate = travelDate;
        this.adults = adults;
        this.children = children;
        this.totalPeople = totalPeople;
        this.totalPrice = totalPrice;
        this.specialRequest = specialRequest;
        this.bookingStatus = bookingStatus;
        this.bookingDate = bookingDate;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getTravelDate() {
        return travelDate;
    }

    public void setTravelDate(Date travelDate) {
        this.travelDate = travelDate;
    }

    public int getAdults() {
        return adults;
    }

    public void setAdults(int adults) {
        this.adults = adults;
    }

    public int getChildren() {
        return children;
    }

    public void setChildren(int children) {
        this.children = children;
    }

    public int getTotalPeople() {
        return totalPeople;
    }

    public void setTotalPeople(int totalPeople) {
        this.totalPeople = totalPeople;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getSpecialRequest() {
        return specialRequest;
    }

    public void setSpecialRequest(String specialRequest) {
        this.specialRequest = specialRequest;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public Timestamp getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Timestamp bookingDate) {
        this.bookingDate = bookingDate;
    }

}