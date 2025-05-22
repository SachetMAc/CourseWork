package com.applestore.controller;

import com.applestore.dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        boolean success = new ProductDAO().deleteProduct(id);
        res.sendRedirect("admin/dashboard.jsp"); // or show confirmation
    }
}
