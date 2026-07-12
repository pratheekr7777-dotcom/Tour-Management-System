package com.tour.tour_management_system.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.tour.tour_management_system.dao.TourDao;
import com.tour.tour_management_system.entity.Tour;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/home")
public class HomeController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session != null) {

            String message =
                    (String) session.getAttribute("successMessage");

            if (message != null) {

                req.setAttribute("successMessage", message);

                session.removeAttribute("successMessage");
            }
        }

        TourDao dao = new TourDao();

        ArrayList<Tour> tours = dao.getAllTours();
        ArrayList<Tour> popularTours = dao.getPopularTours();

        req.setAttribute("tourList", tours);
        req.setAttribute("popularTours", popularTours);

        RequestDispatcher rd =
                req.getRequestDispatcher("home.jsp");

        rd.forward(req, resp);
    }
	
}