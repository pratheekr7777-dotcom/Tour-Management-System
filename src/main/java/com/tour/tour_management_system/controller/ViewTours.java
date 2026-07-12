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

@WebServlet("/tours")
public class ViewTours extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        TourDao dao = new TourDao();

        ArrayList<Tour> tours = dao.getAllTours();

        req.setAttribute("tourList", tours);

        RequestDispatcher rd =
                req.getRequestDispatcher("tours.jsp");

        rd.forward(req, resp);

    }

}