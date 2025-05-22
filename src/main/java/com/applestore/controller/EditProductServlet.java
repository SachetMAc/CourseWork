package com.applestore.controller;

import com.applestore.dao.ProductDAO;
import com.applestore.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class EditProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product p = new ProductDAO().getProductById(id);
        req.setAttribute("product", p);
        req.getRequestDispatcher("admin/edit-product.jsp").forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Product p = new Product();
        p.setId(Integer.parseInt(req.getParameter("id")));
        p.setName(req.getParameter("name"));
        p.setDescription(req.getParameter("description"));
        p.setPrice(Double.parseDouble(req.getParameter("price")));
        p.setStock(Integer.parseInt(req.getParameter("stock")));
        p.setImage(req.getParameter("image"));

        if (new ProductDAO().updateProduct(p)) {
            res.sendRedirect("admin/dashboard.jsp");
        } else {
            req.setAttribute("error", "Product update failed");
            req.getRequestDispatcher("admin/edit-product.jsp").forward(req, res);
        }
    }
}
