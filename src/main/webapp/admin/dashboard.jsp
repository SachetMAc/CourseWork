<%@ page import="java.text.NumberFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.applestore.model.Product" %>

<jsp:include page="../header.jsp" />

<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #000;
        color: #fff;
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
        margin: 40px 0 20px;
        font-size: 28px;
        letter-spacing: 1px;
        color: #fff;
    }

    .nav-links {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 20px;
        margin-bottom: 30px;
    }

    .nav-links a {
        padding: 10px 20px;
        background-color: #fff;
        color: #000;
        border-radius: 5px;
        font-weight: 600;
        text-decoration: none;
        transition: all 0.3s ease;
    }

    .nav-links a:hover {
        background-color: #e0e0e0;
        color: #000;
    }

    .summary-cards {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 25px;
        margin: 0 auto 40px;
        max-width: 1000px;
    }

    .card {
        background-color: #111;
        color: #fff;
        padding: 30px 25px;
        border-radius: 10px;
        text-align: center;
        box-shadow: 0 0 15px rgba(255, 255, 255, 0.05);
        min-width: 200px;
        flex: 1;
    }

    .card strong {
        display: block;
        font-size: 24px;
        color: #fff;
        margin-top: 8px;
    }

    table {
        width: 80%;
        margin: 0 auto 60px;
        border-collapse: collapse;
        background-color: #111;
        color: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
    }

    th, td {
        padding: 14px 20px;
        border-bottom: 1px solid #444;
    }

    th {
        background-color: #1a1a1a;
        text-align: left;
    }

    tr:hover {
        background-color: #1f1f1f;
    }

    td a {
        color: #fff;
        text-decoration: underline;
        margin-right: 10px;
    }

    td a:hover {
        color: #ccc;
    }

    .empty-message {
        text-align: center;
        padding: 20px;
        font-style: italic;
        color: #bbb;
    }
</style>

<h2>Admin Dashboard</h2>

<!-- Navigation Links -->
<div class="nav-links">
    <a href="../admin/add-product.jsp">Add Product</a>
    <a href="../admin/orders.jsp">View Orders</a>
    <a href="../admin/users.jsp">Manage Users</a>
    <a href="../admin/reports.jsp">Analytics Report</a>
</div>

<!-- Dashboard Metrics -->
<div class="summary-cards">
    <div class="card">
        Total Sales
        <strong>$<%= request.getAttribute("totalSales") %></strong>
    </div>
    <div class="card">
        Total Products
        <strong><%= request.getAttribute("totalProducts") %></strong>
    </div>
    <div class="card">
        Total Orders
        <strong><%= request.getAttribute("totalOrders") %></strong>
    </div>
    <div class="card">
        Total Users
        <strong><%= request.getAttribute("totalUsers") %></strong>
    </div>
</div>

<!-- Product List -->
<table>
    <thead>
        <tr>
            <th>Product Name</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
<%
    List<Product> productList = (List<Product>) request.getAttribute("products");
    if (productList != null && !productList.isEmpty()) {
        for (Product p : productList) {
%>
        <tr>
            <td><%= p.getName() %></td>
            <td>
                <a href="../edit-product?id=<%= p.getId() %>">Edit</a>
                <a href="../delete-product?id=<%= p.getId() %>" onclick="return confirm('Are you sure you want to delete this product?')">Delete</a>
            </td>
        </tr>
<%
        }
    } else {
%>
        <tr><td colspan="2" class="empty-message">No products available.</td></tr>
<%
    }
%>
    </tbody>
</table>

<jsp:include page="../footer.jsp" />
