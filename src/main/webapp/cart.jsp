<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.applestore.model.Product" %>

<%
    List<Product> cart = (List<Product>) session.getAttribute("cart");
    if (cart == null) cart = new java.util.ArrayList<>();
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
        }
    </style>
</head>
<body>
<h2 style="text-align:center">Your Cart</h2>
<table>
    <tr>
        <th>Product</th><th>Price</th><th>Qty</th><th>Subtotal</th><th>Action</th>
    </tr>
    <!-- Example row -->
    <tr>
        <td>iPhone 15 Pro</td>
        <td>$999</td>
        <td>1</td>
        <td>$999</td>
        <td><button>Remove</button></td>
    </tr>

    <tr>
        <th>Product</th><th>Price</th><th>Qty</th><th>Subtotal</th><th>Action</th>
    </tr>

<%
    double total = 0;
    for (Product p : cart) {
        int quantity = 1; // You can store quantity separately in future enhancements
        double subtotal = p.getPrice() * quantity;
        total += subtotal;
%>
    <tr>
        <td><%= p.getName() %></td>
        <td>$<%= p.getPrice() %></td>
        <td>
            <form action="update-cart" method="post">
           		 <input type="text" id="searchBox" placeholder="Search products..." style="width: 300px; padding: 8px;" />
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
    }
%>
</table>
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


<jsp:include page="footer.jsp" />
<script>
    document.getElementById("searchBox").addEventListener("keyup", function () {
        let filter = this.value.toLowerCase();
        let products = document.getElementsByClassName("product-card");

        Array.from(products).forEach(card => {
            let name = card.querySelector("h3").innerText.toLowerCase();
            card.style.display = name.includes(filter) ? "" : "none";
        });
    });
</script>

</body>
</html>
