package com.tour.tour_management_system.controller;

import java.io.IOException;

import com.tour.tour_management_system.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/resetPassword")
public class ResetPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String email = (String) session.getAttribute("resetEmail");

        String password = request.getParameter("password");

        UserDao dao = new UserDao();

        boolean status = dao.updatePassword(email, password);

        if (status) {

            session.removeAttribute("resetEmail");

            response.sendRedirect("login.jsp?msg=Password Updated Successfully");

        } else {

            request.setAttribute("error", "Password update failed.");

            request.getRequestDispatcher("resetPassword.jsp")
                    .forward(request, response);

        }

    }

}