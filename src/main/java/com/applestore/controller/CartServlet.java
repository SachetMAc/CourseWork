package com.applestore.controller;

import com.applestore.model.Product;
import com.applestore.dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("productId"));
        HttpSession session = req.getSession();
        List<Product> cart = (List<Product>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        Product product = new ProductDAO().getProductById(productId);
        cart.add(product);
        session.setAttribute("cart", cart);

        res.sendRedirect("cart.jsp");
    }
}
