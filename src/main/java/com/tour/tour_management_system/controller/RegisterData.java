package com.tour.tour_management_system.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

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

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("uname");
        String email = req.getParameter("uemail");
        String phone = req.getParameter("uphone");
        String password = req.getParameter("upswd");
        String confirmPassword = req.getParameter("cnfpswd");
        String gender = req.getParameter("ugender");
        String dob = req.getParameter("udob");
        String address = req.getParameter("uaddress");

        // Basic validation
        if (isBlank(name))
            returnError(req, resp, "Name cannot be empty");

        else if (isBlank(email))
            returnError(req, resp, "Email cannot be empty");

        else if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$"))
            returnError(req, resp, "Enter a valid Email Address");

        else if (phone == null || !phone.matches("\\d{10}"))
            returnError(req, resp, "Phone number must contain exactly 10 digits");

        else if (isBlank(password))
            returnError(req, resp, "Password cannot be empty");

        else if (password.length() < 8)
            returnError(req, resp, "Password must contain at least 8 characters");

        else if (!password.equals(confirmPassword))
            returnError(req, resp, "Passwords do not match");

        else if (isBlank(gender))
            returnError(req, resp, "Please select your gender");

        else if (isBlank(dob))
            returnError(req, resp, "Please select your Date of Birth");

        else if (isBlank(address))
            returnError(req, resp, "Address cannot be empty");

        else {
            registerUser(req, resp, name, email, phone,
                    password, gender, dob, address);
        }
    }

    private void registerUser(
            HttpServletRequest req,
            HttpServletResponse resp,
            String name,
            String email,
            String phone,
            String password,
            String gender,
            String dob,
            String address)
            throws ServletException, IOException {

        LocalDate birthDate;

        try {
            birthDate = LocalDate.parse(dob);
        } catch (Exception e) {
            showError(req, resp, "Invalid Date of Birth");
            return;
        }

        LocalDate today = LocalDate.now();

        if (birthDate.isAfter(today)) {
            showError(req, resp, "Date of Birth cannot be a future date.");
            return;
        }

        if (Period.between(birthDate, today).getYears() < 18) {
            showError(req, resp,
                    "You must be at least 18 years old to register.");
            return;
        }

        UserDao dao = new UserDao();

        if (dao.isEmailExists(email)) {
            showError(req, resp, "Email is already registered.");
            return;
        }
        if (dao.isPhoneExists(phone)) {
            showError(req, resp, "Phone number is already registered.");
            return;
        }
        User user = new User();

        user.setName(name.trim());
        user.setEmail(email.trim().toLowerCase());
        user.setPhone(phone);
        user.setPassword(password);
        user.setGender(gender);
        user.setDob(Date.valueOf(birthDate));
        user.setAddress(address.trim());

        if (dao.registerUser(user)) {

            HttpSession session = req.getSession();
            session.setAttribute("successMessage", "Welcome " + name);

            resp.sendRedirect("home");

        } else {
            showError(req, resp,
                    "Registration failed. Please try again.");
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.isBlank();
    }

    private void returnError(
            HttpServletRequest req,
            HttpServletResponse resp,
            String message)
            throws ServletException, IOException {

        showError(req, resp, message);
    }

    private void showError(
            HttpServletRequest req,
            HttpServletResponse resp,
            String message)
            throws ServletException, IOException {

        // Store only the error message
        req.setAttribute("error", message);

        // Forward the SAME request back to registration.jsp
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("registration.jsp");

        dispatcher.forward(req, resp);
    }
}