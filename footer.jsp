<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        footer {
            background-color: #111;
            color: #aaa;
            padding: 40px 20px;
            text-align: center;
            font-size: 14px;
            margin-top: 40px;
        }
        footer p {
            margin: 10px 0;
        }
        footer a {
            color: #aaa;
            margin: 0 10px;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        footer a:hover {
            color: white;
        }
        .social-icons {
            margin-top: 15px;
        }
        .social-icons a {
            font-size: 18px;
            margin: 0 8px;
            display: inline-block;
        }
        @media (max-width: 600px) {
            footer {
                font-size: 13px;
            }
        }
    </style>
    <!-- Font Awesome CDN -->
    <script src="https://kit.fontawesome.com/a2d9d6a4b8.js" crossorigin="anonymous"></script>
</head>
<body>
    <footer>
        <p>&copy; 2025 AppleStore. Designed in Nike Style. All rights reserved.</p>
        <p>
            <a href="#">Privacy</a> | 
            <a href="#">Terms</a> | 
            <a href="#">Contact</a>
        </p>
        <div class="social-icons">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-x-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
        </div>
    </footer>
</body>
</html>
