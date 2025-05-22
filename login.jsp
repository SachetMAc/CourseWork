<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
    <style>
        .form-container {
            width: 400px;
            margin: 60px auto;
            background: #f5f5f5;
            padding: 30px;
            border-radius: 10px;
        }
        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
        }
        button {
            width: 100%;
            background: #000;
            color: white;
            padding: 12px;
            border: none;
            cursor: pointer;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Login</h2>
    <form action="<%= request.getContextPath() %>/login" method="post">
        <input type="email" name="email" placeholder="Email" required />
        <input type="password" name="password" placeholder="Password" required />
        <button type="submit">Login</button>
    </form>
    <% if (request.getAttribute("error") != null) { %>
        <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
