package com.applestore.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.applestore.dao.ProductDAO;
import com.applestore.model.Product;

public class ProductDetailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product p = new ProductDAO().getProductById(id);
        req.setAttribute("product", p);
        req.getRequestDispatcher("product-detail.jsp").forward(req, res);
    }
}
