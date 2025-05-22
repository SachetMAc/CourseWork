<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.applestore.model.Product" %>

<%
    List<Product> cart = (List<Product>) session.getAttribute("cart");
%>

<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
    <style>
        table {
            width: 90%;
            margin: 40px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 14px;
            border: 1px solid #ccc;
            text-align: center;
        }
        .total {
            text-align: right;
            margin-right: 10%;
            font-size: 18px;
        }
        .checkout-btn {
            display: block;
            margin: 20px auto;
            background: #000;
            color: white;
            padding: 12px 30px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h2 style="text-align:center">Your Cart</h2>

<table>
    <tr>
        <th>Product</th><th>Price</th><th>Qty</th><th>Subtotal</th><th>Action</th>
    </tr>

<%
    double total = 0;
    if (cart != null && !cart.isEmpty()) {
        for (Product p : cart) {
            int quantity = 1; // You can extend with quantity storage
            double subtotal = p.getPrice() * quantity;
            total += subtotal;
%>
    <tr>
        <td><%= p.getName() %></td>
        <td>$<%= p.getPrice() %></td>
        <td>
            <form action="update-cart" method="post">
                <input type="hidden" name="productId" value="<%= p.getId() %>"/>
                <input type="number" name="quantity" value="<%= quantity %>" min="1"/>
                <button type="submit">Update</button>
            </form>
        </td>
        <td>$<%= subtotal %></td>
        <td>
            <form action="remove-cart" method="post">
                <input type="hidden" name="productId" value="<%= p.getId() %>"/>
                <button type="submit">Remove</button>
            </form>
        </td>
    </tr>
<%
        } // end for
    } else {
%>
    <tr><td colspan="5" style="text-align:center;">Your cart is empty.</td></tr>
<%
    }
%>
</table>

<%
    if (cart != null && !cart.isEmpty()) {
%>
<form action="checkout" method="post">
<%
        for (Product p : cart) {
%>
    <input type="hidden" name="qty_<%= p.getId() %>" value="1" />
<%
        }
%>
    <button class="checkout-btn" type="submit">Proceed to Checkout</button>
</form>
<p class="total">Total: $<%= total %></p>
<%
    }
%>

<jsp:include page="footer.jsp" />

</body>
</html>
