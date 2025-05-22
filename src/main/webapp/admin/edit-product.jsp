<%@ page import="com.applestore.model.Product" %>
<jsp:include page="../header.jsp" />
<%
    Product p = (Product) request.getAttribute("product");
    if (p == null) {
%>
    <div style="text-align:center; padding: 50px;">
        <h2>Product Not Found</h2>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
<%
    } else {
%>
<h2>Edit Product</h2>
<form action="../edit-product" method="post" style="width:400px; margin:40px auto;">
    <input type="hidden" name="id" value="<%= p.getId() %>"/>
    <input type="text" name="name" value="<%= p.getName() %>" placeholder="Product Name" required/><br/>
    <textarea name="description" placeholder="Description"><%= p.getDescription() %></textarea><br/>
    <input type="number" name="price" value="<%= p.getPrice() %>" step="0.01" required/><br/>
    <input type="number" name="stock" value="<%= p.getStock() %>" required/><br/>
    <input type="text" name="image" value="<%= p.getImage() %>" placeholder="Image filename" required/><br/>
    <button type="submit">Update Product</button>
</form>
<%
    }
%>
<jsp:include page="../footer.jsp" />
