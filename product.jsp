<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.applestore.model.Product" %>

<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
    <style>
        .search-bar {
            width: 300px;
            margin: 20px auto;
            display: block;
            padding: 10px;
        }

        .filters {
            text-align: center;
            margin-bottom: 20px;
        }

        .filters button {
            padding: 10px 15px;
            margin: 0 5px;
            background: #000;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .product-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .product-card {
            border: 1px solid #ddd;
            padding: 20px;
            width: 220px;
            text-align: center;
            background: #f9f9f9;
        }

        .product-card img {
            width: 100%;
            height: auto;
        }

        .product-card h3 {
            font-size: 18px;
        }

        .product-card p {
            margin: 10px 0;
        }
    </style>
</head>
<body>

<input type="text" id="searchBox" class="search-bar" placeholder="Search Apple Products...">

<div class="filters">
    <button onclick="filterByCategory('All')">All</button>
    <button onclick="filterByCategory('iPhone')">iPhone</button>
    <button onclick="filterByCategory('MacBook')">MacBook</button>
    <button onclick="filterByCategory('iPad')">iPad</button>
    <button onclick="filterByCategory('Watch')">Watch</button>
</div>

<div class="product-grid" id="productContainer">
<%
    List<Product> productList = (List<Product>) request.getAttribute("products");
    if (productList != null) {
        for (Product p : productList) {
%>
    <div class="product-card" data-name="<%= p.getName().toLowerCase() %>" data-category="<%= p.getCategory() %>">
        <img src="images/<%= p.getImage() %>" alt="<%= p.getName() %>" />
        <h3><%= p.getName() %></h3>
        <p>$<%= p.getPrice() %></p>
        <form action="cart" method="post">
            <input type="hidden" name="productId" value="<%= p.getId() %>">
            <input type="number" name="quantity" value="1" min="1">
            <button type="submit">Add to Cart</button>
        </form>
    </div>
<%
        }
    } else {
%>
    <p>No products available</p>
<%
    }
%>
</div>

<script>
    const searchBox = document.getElementById("searchBox");
    const productCards = document.querySelectorAll(".product-card");

    searchBox.addEventListener("keyup", function () {
        const keyword = this.value.toLowerCase();
        productCards.forEach(card => {
            const name = card.getAttribute("data-name");
            card.style.display = name.includes(keyword) ? "" : "none";
        });
    });

    function filterByCategory(category) {
        productCards.forEach(card => {
            const prodCat = card.getAttribute("data-category");
            if (category === 'All' || prodCat === category) {
                card.style.display = "";
            } else {
                card.style.display = "none";
            }
        });
    }
</script>

<jsp:include page="footer.jsp" />
</body>
</html>
