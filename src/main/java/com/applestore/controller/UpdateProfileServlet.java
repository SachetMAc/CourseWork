package com.applestore.controller;

import com.applestore.dao.UserDAO;
import com.applestore.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            user.setName(req.getParameter("name"));
            user.setAddress(req.getParameter("address"));

            if (new UserDAO().updateUser(user)) {
                session.setAttribute("user", user); // Refresh session
                res.sendRedirect("profile.jsp");
            } else {
                req.setAttribute("error", "Update failed.");
                req.getRequestDispatcher("profile.jsp").forward(req, res);
            }
        } else {
            res.sendRedirect("login.jsp");
        }
    }
}
