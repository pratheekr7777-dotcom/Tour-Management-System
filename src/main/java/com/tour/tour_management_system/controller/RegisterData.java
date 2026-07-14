package com.tour.tour_management_system.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import com.tour.tour_management_system.dao.UserDao;
import com.tour.tour_management_system.entity.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterData extends HttpServlet {

    private static final long serialVersionUID = 7855021096656549781L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("uname");
        String email = req.getParameter("uemail");
        String phone = req.getParameter("uphone");
        String password = req.getParameter("upswd");
        String cnfpswd = req.getParameter("cnfpswd");
        String gender = req.getParameter("ugender");
        String dob = req.getParameter("udob");
        String address = req.getParameter("uaddress");

        if (name == null || name.isBlank()) {
            showError(req, resp, "Name cannot be empty");
            return;
        }

        if (email == null || email.isBlank()) {
            showError(req, resp, "Email cannot be empty");
            return;
        }

        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            showError(req, resp, "Enter a valid Email Address");
            return;
        }
        UserDao dao = new UserDao();

        if (dao.isEmailExists(email)) {
            showError(req, resp, "Email is already registered.");
            return;
        }

        if (phone == null || !phone.matches("\\d{10}")) {
            showError(req, resp, "Phone number must contain exactly 10 digits");
            return;
        }

        if (password == null || password.isBlank()) {
            showError(req, resp, "Password cannot be empty");
            return;
        }

        if (password.length() < 8) {
            showError(req, resp, "Password must contain at least 8 characters");
            return;
        }

        if (!password.equals(cnfpswd)) {
            showError(req, resp, "Passwords do not match");
            return;
        }

        if (gender == null || gender.isBlank()) {
            showError(req, resp, "Please select your gender");
            return;
        }

        if (dob == null || dob.isBlank()) {
            showError(req, resp, "Please select your Date of Birth");
            return;
        }
        Date birthDate = Date.valueOf(dob);

        java.time.LocalDate today = java.time.LocalDate.now();
        java.time.LocalDate birth = birthDate.toLocalDate();

        int age = java.time.Period.between(birth, today).getYears();

        if (age < 18) {
            showError(req, resp, "You must be at least 18 years old to register.");
            return;
        }
        if (address == null || address.isBlank()) {
            showError(req, resp, "Address cannot be empty");
            return;
        }

        // ==========================
        // Database insertion goes here
        
        User user = new User();

        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);
        user.setGender(gender);
        user.setDob(birthDate);
        user.setAddress(address);
        
        boolean status = dao.registerUser(user);

        if (status) {

            HttpSession session = req.getSession();
            session.setAttribute("successMessage", "Welcome " + name);

            resp.sendRedirect("home");

        } else {

            showError(req, resp, "Something went wrong!");

        }    }

    private void showError(HttpServletRequest req,
                           HttpServletResponse resp,
                           String message)
            throws ServletException, IOException {

    	req.setAttribute("error", message);

    	RequestDispatcher dispatcher =
    	        req.getRequestDispatcher("registration.jsp");

    	dispatcher.forward(req, resp);    }
}