package com.tour.tour_management_system.controller;

import java.io.IOException;

import com.tour.tour_management_system.dao.TourDao;
import com.tour.tour_management_system.entity.Tour;
import com.tour.tour_management_system.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/book-tour")
public class BookTour extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private TourDao tourDao = new TourDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // User must be logged in
        if (session == null || session.getAttribute("user") == null) {

            HttpSession newSession = request.getSession();
            newSession.setAttribute("redirect",
                    "book-tour?id=" + request.getParameter("id"));

            response.sendRedirect("login.jsp");
            return;
        }

        String id = request.getParameter("id");

        if (id == null || id.isBlank()) {
            response.sendRedirect("home");
            return;
        }

        int tourId = Integer.parseInt(id);

        Tour tour = tourDao.getTourById(tourId);

        if (tour == null) {
            response.sendRedirect("home");
            return;
        }

        User user = (User) session.getAttribute("user");

        request.setAttribute("tour", tour);
        request.setAttribute("user", user);

        request.getRequestDispatcher("booking.jsp").forward(request, response);
    }
}