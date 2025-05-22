<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.applestore.model.Product" %>

<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
<%
    List<Product> productList = (List<Product>) request.getAttribute("products");
    if (productList != null) {
        for (Product p : productList) {
%>
    <div class="product-card">
        <img src="images/<%= p.getImage() %>" alt="<%= p.getName() %>" />
        <h3><%= p.getName() %></h3>
        <p>$<%= p.getPrice() %></p>
        <form action="cart" method="post">
            <input type="hidden" name="productId" value="<%= p.getId() %>" />
            <button>Add to Cart</button>
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

   
<jsp:include page="footer.jsp" />
</body>
</html>
