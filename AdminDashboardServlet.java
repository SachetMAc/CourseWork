package com.applestore.servlet;

import com.applestore.dao.ProductDAO;
import com.applestore.dao.UserDAO;
import com.applestore.dao.OrderDAO;
import com.applestore.dao.SalesDAO;
import com.applestore.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initialize DAOs
        ProductDAO productDAO = new ProductDAO();
        UserDAO userDAO = new UserDAO();
        OrderDAO orderDAO = new OrderDAO();
        SalesDAO salesDAO = new SalesDAO();

        // Fetch dashboard metrics
        int totalProducts = productDAO.getTotalProductCount();
        int totalUsers = userDAO.getUserCount();
        int totalOrders = orderDAO.getTotalOrderCount();
        double totalSales = salesDAO.getTotalSales();

        // Fetch product list
        List<Product> products = productDAO.getAllProducts();

        // Set attributes for JSP
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("totalSales", totalSales);
        request.setAttribute("products", products);

        // Forward to dashboard.jsp
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }
}
