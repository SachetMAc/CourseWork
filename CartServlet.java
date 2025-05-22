package com.applestore.controller;

import com.applestore.dao.ProductDAO;
import com.applestore.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("productId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        Product product = new ProductDAO().getProductById(productId);
        if (product == null) {
            res.sendRedirect("products.jsp");
            return;
        }

        HttpSession session = req.getSession();
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart == null) cart = new ArrayList<>();

        cart.add(product); // (optionally: wrap in CartItem with quantity)
        session.setAttribute("cart", cart);

        res.sendRedirect("cart.jsp");
    }
}
