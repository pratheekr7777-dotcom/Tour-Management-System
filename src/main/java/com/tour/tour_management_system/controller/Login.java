package com.tour.tour_management_system.controller;

import java.io.IOException;

import com.tour.tour_management_system.dao.UserDao;
import com.tour.tour_management_system.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class Login extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("uemail");
        String password = req.getParameter("upswd");

        UserDao dao = new UserDao();

        User user = dao.login(email, password);

        if (user != null) {

            HttpSession session = req.getSession();

            session.setAttribute("user", user);

            String redirect = (String) session.getAttribute("redirect");

            if (redirect != null) {

                session.removeAttribute("redirect");

                resp.sendRedirect(redirect);

            } else {

                resp.sendRedirect("home");

            }

        } else {

            req.setAttribute("error",
                    "Invalid Email or Password");

            req.getRequestDispatcher("login.jsp")
                    .forward(req, resp);

        }

    }

}