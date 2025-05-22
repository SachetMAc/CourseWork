package com.applestore.controller;

import com.applestore.dao.ProductDAO;
import com.applestore.dao.OrderDAO;
import com.applestore.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        OrderDAO orderDAO = new OrderDAO();
        UserDAO userDAO = new UserDAO();

        req.setAttribute("totalSales", orderDAO.getTotalSales());
        req.setAttribute("totalProducts", productDAO.getTotalProductCount());
        req.setAttribute("totalOrders", orderDAO.getTotalOrderCount());
        req.setAttribute("totalUsers", userDAO.getUserCount());

        req.getRequestDispatcher("admin/dashboard.jsp").forward(req, res);
    }
}
