package com.applestore.controller;

import com.applestore.dao.UserDAO;
import com.applestore.model.User;
import com.applestore.util.HashUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Hash the password before checking
        String hashedPassword = HashUtil.hash(password);

        // Authenticate user
        User user = new UserDAO().authenticate(email, hashedPassword);

        if (user != null) {
            // Store user in session
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            // Redirect based on role
            if ("admin".equals(user.getRole())) {
                res.sendRedirect("admin/dashboard.jsp");
            } else {
                res.sendRedirect("index.jsp");
            }

        } else {
            // Invalid login – return to login page with error
            req.setAttribute("error", "Invalid email or password.");
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }
}