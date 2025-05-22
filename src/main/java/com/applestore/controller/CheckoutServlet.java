package com.applestore.controller;

import com.applestore.dao.DBConnection;
import com.applestore.model.Product;
import com.applestore.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        List<Product> cart = (List<Product>) session.getAttribute("cart");

        if (user == null || cart == null || cart.isEmpty()) {
            res.sendRedirect("cart.jsp");
            return;
        }

        double totalAmount = 0;
        Map<Integer, Integer> productQuantityMap = new HashMap<>(); // productId -> quantity

        // Retrieve quantity from request
        for (Product p : cart) {
            int qty = 1;
            try {
                qty = Integer.parseInt(req.getParameter("qty_" + p.getId()));
            } catch (Exception e) { qty = 1; }

            productQuantityMap.put(p.getId(), qty);
            totalAmount += p.getPrice() * qty;
        }

        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false);

            // Insert order
            String orderSQL = "INSERT INTO orders (user_id, total_amount) VALUES (?, ?)";
            PreparedStatement psOrder = con.prepareStatement(orderSQL, Statement.RETURN_GENERATED_KEYS);
            psOrder.setInt(1, user.getId());
            psOrder.setDouble(2, totalAmount);
            psOrder.executeUpdate();

            ResultSet rs = psOrder.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // Insert order_items
            String itemSQL = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            PreparedStatement psItem = con.prepareStatement(itemSQL);

            for (Product p : cart) {
                int qty = productQuantityMap.getOrDefault(p.getId(), 1);
                psItem.setInt(1, orderId);
                psItem.setInt(2, p.getId());
                psItem.setInt(3, qty);
                psItem.setDouble(4, p.getPrice());
                psItem.addBatch();
            }

            psItem.executeBatch();
            con.commit();

            // Clear cart
            session.removeAttribute("cart");
            res.sendRedirect("order-success.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Checkout failed.");
            req.getRequestDispatcher("cart.jsp").forward(req, res);
        }
    }
}
