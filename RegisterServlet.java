package com.applestore.controller;

import com.applestore.dao.UserDAO;
import com.applestore.model.User;
import com.applestore.util.HashUtil;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // ✅ Validate email
        if (email == null || !email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,6}$")) {
            req.setAttribute("error", "Invalid email format");
            req.getRequestDispatcher("register.jsp").forward(req, res);
            return;
        }

        // ✅ Validate password
        if (password == null || password.length() < 6) {
            req.setAttribute("error", "Password must be at least 6 characters");
            req.getRequestDispatcher("register.jsp").forward(req, res);
            return;
        }

       
        User user = new User();
        user.setName(req.getParameter("name"));
        user.setEmail(email);
        user.setPassword(HashUtil.hash(password));
        user.setAddress(req.getParameter("address"));
        user.setRole("user");

        if (new UserDAO().register(user)) {
        	req.getRequestDispatcher("login.jsp").forward(req, res);

        } else {
            req.setAttribute("error", "Registration failed");
            req.getRequestDispatcher("register.jsp").forward(req, res);
        }
    }
}
