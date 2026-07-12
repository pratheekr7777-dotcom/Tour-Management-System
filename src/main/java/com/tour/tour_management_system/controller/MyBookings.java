package com.tour.tour_management_system.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.tour.tour_management_system.dao.BookingDao;
import com.tour.tour_management_system.dao.TourDao;
import com.tour.tour_management_system.entity.Booking;
import com.tour.tour_management_system.entity.Tour;
import com.tour.tour_management_system.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/my-bookings")
public class MyBookings extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private BookingDao bookingDao = new BookingDao();
    private TourDao tourDao = new TourDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {

            HttpSession newSession = request.getSession();

            newSession.setAttribute("redirect", "my-bookings");

            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");


        ArrayList<Booking> bookings = bookingDao.getBookingsByUser(user.getUserId());

        Map<Integer, Tour> tourMap = new HashMap<>();

        for (Booking booking : bookings) {
            Tour tour = tourDao.getTourById(booking.getTourId());
            tourMap.put(booking.getTourId(), tour);
        }

        request.setAttribute("bookings", bookings);
        request.setAttribute("tourMap", tourMap);

        request.getRequestDispatcher("my-bookings.jsp")
               .forward(request, response);
    }
}