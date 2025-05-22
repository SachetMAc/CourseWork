<%@ page import="com.applestore.model.Product" %>
<jsp:include page="header.jsp" />
<%
    Product p = (Product) request.getAttribute("product");
    if (p == null) {
%>
    <div style="text-align:center; padding: 50px;">
        <h2>Product not found.</h2>
        <a href="index.jsp">Back to Home</a>
    </div>
<%
    } else {
%>
<div class="product-detail" style="width: 60%; margin: auto;">
    <img src="images/<%= p.getImage() %>" style="width:300px;" />
    <h2><%= p.getName() %></h2>
    <p><%= p.getDescription() %></p>
    <p><strong>Price:</strong> $<%= p.getPrice() %></p>
    <form action="cart" method="post">
        <input type="hidden" name="productId" value="<%= p.getId() %>"/>
        <label>Quantity:</label>
        <input type="number" name="quantity" value="1" min="1" required />
        <button type="submit">Add to Cart</button>
    </form>
</div>
<%
    }
%>
<jsp:include page="footer.jsp" />
