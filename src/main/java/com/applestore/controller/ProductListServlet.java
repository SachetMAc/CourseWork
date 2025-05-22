package com.applestore.controller;

import com.applestore.dao.ProductDAO;
import com.applestore.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ProductListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<Product> products = new ProductDAO().getAllProducts();
        req.setAttribute("products", products);
        RequestDispatcher rd = req.getRequestDispatcher("products.jsp");
        rd.forward(req, res);
    }
}
