package com.tour.tour_management_system.controller;

import java.io.IOException;

import com.tour.tour_management_system.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("uemail");

        UserDao dao = new UserDao();

        boolean exists = dao.checkEmail(email);
    	String emails = request.getParameter("uemail");

    	System.out.println("Email: " + emails);

    	boolean existss = dao.checkEmail(email);

    	System.out.println("Exists: " + existss);

        if (exists) {

            HttpSession session = request.getSession();

            session.setAttribute("resetEmail", email);

            response.sendRedirect("verifyOtp.jsp");

        } else {

            request.setAttribute("error",
                    "Email is not registered.");

            request.getRequestDispatcher("forgotPassword.jsp")
                    .forward(request, response);

        }

    }

}