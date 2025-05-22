<%@ page import="java.util.List, com.applestore.model.User" %>
<jsp:include page="../header.jsp" />

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #000;
        color: #fff;
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
        margin: 40px 0 20px;
        font-size: 28px;
        color: #fff;
    }

    .nav-links {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }

    .nav-links a {
        padding: 10px 20px;
        background-color: #fff;
        color: #000;
        border-radius: 5px;
        font-weight: bold;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    .nav-links a:hover {
        background-color: #e0e0e0;
    }

    table {
        width: 90%;
        max-width: 1000px;
        margin: 20px auto 50px;
        border-collapse: collapse;
        background-color: #111;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 10px rgba(255, 255, 255, 0.05);
    }

    th, td {
        padding: 14px 20px;
        border-bottom: 1px solid #444;
        text-align: left;
    }

    th {
        background-color: #1a1a1a;
        color: #fff;
    }

    tr:hover {
        background-color: #1f1f1f;
    }

    td {
        color: #e6e6e6;
    }

    .empty-message {
        text-align: center;
        color: #bbb;
        padding: 20px;
        font-style: italic;
    }
</style>

<!-- Back Button -->
<div class="nav-links">
    <a href="../admin/dashboard.jsp">← Back to Dashboard</a>
</div>

<h2>Registered Users</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Address</th>
    </tr>
<%
    List<User> users = (List<User>) request.getAttribute("users");
    if (users != null && !users.isEmpty()) {
        for (User u : users) {
%>
    <tr>
        <td><%= u.getId() %></td>
        <td><%= u.getName() %></td>
        <td><%= u.getEmail() %></td>
        <td><%= u.getRole() %></td>
        <td><%= u.getAddress() %></td>
    </tr>
<%
        }
    } else {
%>
    <tr><td colspan="5" class="empty-message">No users found.</td></tr>
<%
    }
%>
</table>

<jsp:include page="../footer.jsp" />
