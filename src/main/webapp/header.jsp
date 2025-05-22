<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }
        header {
            background-color: #000;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
        }
        .logo {
            font-size: 28px;
            font-weight: bold;
        }
        nav {
            display: flex;
            gap: 20px;
        }
        nav a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        nav a:hover {
            text-decoration: underline;
            color: #ddd;
        }
        .menu-toggle {
            display: none;
            font-size: 24px;
            background: none;
            border: none;
            color: white;
            cursor: pointer;
        }

        @media (max-width: 768px) {
            nav {
                position: absolute;
                top: 60px;
                right: 0;
                background-color: #000;
                flex-direction: column;
                width: 100%;
                display: none;
                padding: 15px;
            }
            nav a {
                padding: 10px 0;
                border-top: 1px solid #222;
            }
            nav.show {
                display: flex;
            }
            .menu-toggle {
                display: block;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="logo"> AppleStore</div>
        <button class="menu-toggle" onclick="toggleMenu()">☰</button>
        <nav id="navLinks">
            <a href="index.jsp">Home</a>
            <a href="product.jsp">Products</a>
            <a href="cart.jsp">Cart</a>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </nav>
    </header>

    <script>
        function toggleMenu() {
            const nav = document.getElementById('navLinks');
            nav.classList.toggle('show');
        }
    </script>
</body>
</html>
