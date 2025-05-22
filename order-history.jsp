<%@ page import="java.util.List" %>
<%@ page import="com.applestore.model.Order" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .order-section {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        .order-section h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }
        th, td {
            padding: 14px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #000;
            color: white;
            font-weight: 600;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        @media (max-width: 600px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }
            tr {
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 8px;
                padding: 10px;
                background-color: #fff;
            }
            td {
                text-align: right;
                position: relative;
                padding-left: 50%;
            }
            td::before {
                content: attr(data-label);
                position: absolute;
                left: 10px;
                top: 14px;
                font-weight: bold;
                color: #555;
                text-align: left;
            }
            th {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="order-section">
        <h2>My Orders</h2>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Total Amount</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td data-label="Order ID">${order.id}</td>
                        <td data-label="Total">$${order.totalAmount}</td>
                        <td data-label="Date">${order.createdAt}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
<jsp:include page="footer.jsp" />
</body>
</html>
