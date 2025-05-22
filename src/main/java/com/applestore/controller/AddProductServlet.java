package com.applestore.controller;

import com.applestore.dao.ProductDAO;
import com.applestore.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Product p = new Product();
        p.setName(req.getParameter("name"));
        p.setDescription(req.getParameter("description"));
        p.setPrice(Double.parseDouble(req.getParameter("price")));
        p.setStock(Integer.parseInt(req.getParameter("stock")));
        p.setImage(req.getParameter("image"));

        if (new ProductDAO().addProduct(p)) {
            res.sendRedirect("admin/dashboard.jsp");
        } else {
            req.setAttribute("error", "Product not added");
            req.getRequestDispatcher("admin/add-product.jsp").forward(req, res);
        }
    }
}
