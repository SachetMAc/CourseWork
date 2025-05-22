package com.applestore.controller;

import com.applestore.dao.UserDAO;
import com.applestore.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class AdminUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<User> users = new UserDAO().getAllUsers();
        req.setAttribute("users", users);
        req.getRequestDispatcher("admin/users.jsp").forward(req, res);
    }
}
