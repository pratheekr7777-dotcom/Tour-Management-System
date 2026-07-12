package com.tour.tour_management_system.controller;

import java.io.IOException;
import java.sql.Date;

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

@WebServlet("/confirm-booking")
public class ConfirmBooking extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private BookingDao bookingDao = new BookingDao();
    private TourDao tourDao = new TourDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	HttpSession session = request.getSession(false);

    	if (session == null || session.getAttribute("user") == null) {
    	    response.sendRedirect("login.jsp");
    	    return;
    	}

    	User user = (User) session.getAttribute("user");
        int tourId = Integer.parseInt(request.getParameter("tourId"));

        Tour tour = tourDao.getTourById(tourId);

        if (tour == null) {
            response.sendRedirect("home");
            return;
        }

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Date travelDate = Date.valueOf(request.getParameter("travelDate"));

        int adults = Integer.parseInt(request.getParameter("adults"));
        int children = Integer.parseInt(request.getParameter("children"));

        String specialRequest = request.getParameter("specialRequest");

        int totalPeople = adults + children;

        // Server-side price calculation
        double totalPrice = totalPeople * tour.getDiscountPrice();

        Booking booking = new Booking();

        booking.setUserId(user.getUserId());
        booking.setTourId(tourId);

        booking.setFullName(fullName);
        booking.setEmail(email);
        booking.setPhone(phone);

        booking.setTravelDate(travelDate);

        booking.setAdults(adults);
        booking.setChildren(children);
        booking.setTotalPeople(totalPeople);

        booking.setTotalPrice(totalPrice);

        booking.setSpecialRequest(specialRequest);

        booking.setBookingStatus("Pending");

        boolean booked = bookingDao.saveBooking(booking);

        if (booked) {

        	Booking latestBooking = bookingDao.getLatestBooking(user.getUserId());

        	response.sendRedirect(
        	    "booking-success?bookingId=" + latestBooking.getBookingId()
        	);

        } else {

            request.setAttribute("error", "Booking Failed!");

            request.getRequestDispatcher("booking.jsp")
                   .forward(request, response);

        }

    }

}