package com.tour.tour_management_system.controller;

import java.io.IOException;

import com.tour.tour_management_system.dao.BookingDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cancel-booking")
public class CancelBooking extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private BookingDao bookingDao = new BookingDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("bookingId");

        if (id != null && !id.isBlank()) {

            int bookingId = Integer.parseInt(id);

            bookingDao.cancelBooking(bookingId);
        }

        response.sendRedirect("my-bookings");
    }
}