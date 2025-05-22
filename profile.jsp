<%@ page import="com.applestore.model.User" %>
<jsp:include page="header.jsp" />
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Safely handle address with escaping
    String safeAddress = user.getAddress() != null ? user.getAddress().replace("\"", "&quot;") : "";
%>

<h2>Profile</h2>
<p>Name: <%= user.getName() %></p>
<p>Email: <%= user.getEmail() %></p>
<p>Address: <%= user.getAddress() %></p>
<a href="order-history.jsp">View Order History</a>

<form action="update-profile" method="post">
    <input type="text" name="name" value="<%= user.getName() %>" required />
    <input type="text" name="address" value="<%= safeAddress %>" required />
    <button type="submit">Update Info</button>
</form>

<jsp:include page="footer.jsp" />
