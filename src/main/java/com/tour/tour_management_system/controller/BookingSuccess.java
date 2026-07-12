package com.tour.tour_management_system.controller;

import java.io.IOException;

import com.tour.tour_management_system.dao.BookingDao;
import com.tour.tour_management_system.dao.TourDao;
import com.tour.tour_management_system.entity.Booking;
import com.tour.tour_management_system.entity.Tour;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/booking-success")
public class BookingSuccess extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private BookingDao bookingDao = new BookingDao();
    private TourDao tourDao = new TourDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingIdStr = request.getParameter("bookingId");

        if (bookingIdStr == null || bookingIdStr.isBlank()) {
            response.sendRedirect("home");
            return;
        }

        int bookingId = Integer.parseInt(bookingIdStr);

        Booking booking = bookingDao.getBookingById(bookingId);

        if (booking == null) {
            response.sendRedirect("home");
            return;
        }

        Tour tour = tourDao.getTourById(booking.getTourId());

        request.setAttribute("booking", booking);
        request.setAttribute("tour", tour);

        request.getRequestDispatcher("booking-success.jsp")
               .forward(request, response);
    }
}