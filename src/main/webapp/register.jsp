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
        input {
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
    </style>
</head>
<body>
<div class="form-container">
    <h2>Register</h2>
    <form action="register" method="post">
        <input type="text" name="name" placeholder="Full Name" required />
        <input type="email" name="email" placeholder="Email" required />
        <input type="password" name="password" placeholder="Password" required />
        <input type="text" name="address" placeholder="Address" required />
        <button type="submit">Register</button>
    </form>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
