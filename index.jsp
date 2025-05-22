<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
    <title>iBuy - Home</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .hero {
            background: url('images/apple-banner.jpg') no-repeat center center/cover;
            height: 90vh;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            flex-direction: column;
        }
        .hero h1 {
            font-size: 56px;
            font-weight: 700;
            text-shadow: 1px 1px 5px rgba(0,0,0,0.6);
        }
        .hero p {
            font-size: 24px;
            margin-top: 12px;
        }
        .btn-shop {
            margin-top: 24px;
            background: #000;
            color: white;
            padding: 14px 28px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background 0.3s ease;
        }
        .btn-shop:hover {
            background: #333;
        }
        .section {
            padding: 60px 20px;
            text-align: center;
        }
        .section h2 {
            font-size: 36px;
            margin-bottom: 20px;
        }
        .products {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 40px;
            margin-top: 40px;
        }
        .product-card {
            width: 250px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 16px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            background: white;
        }
        .product-card:hover {
            transform: translateY(-8px);
        }
        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .product-card h3 {
            padding: 15px;
            font-size: 20px;
        }
        .features {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 40px;
        }
        .feature-box {
            width: 250px;
            padding: 30px;
            background: #f7f7f7;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            transition: background 0.3s ease;
        }
        .feature-box:hover {
            background: #efefef;
        }
        .feature-box i {
            font-size: 40px;
            color: #000;
            margin-bottom: 15px;
        }
        .feature-box h4 {
            font-size: 22px;
            margin-bottom: 10px;
        }
    </style>
    <script>
        window.addEventListener('scroll', () => {
            document.querySelectorAll('.feature-box, .product-card').forEach(el => {
                const rect = el.getBoundingClientRect();
                if (rect.top < window.innerHeight - 50) {
                    el.style.opacity = 1;
                    el.style.transform = 'translateY(0)';
                }
            });
        });
    </script>
</head>
<body>

    <!-- HERO -->
    <section class="hero">
        <h1>Shop the Latest Apple Devices</h1>
        <p>Premium. Sleek. Innovative.</p>
        <form action="products.jsp">
            <button class="btn-shop">Explore Products</button>
        </form>
    </section>

    <!-- FEATURED PRODUCTS -->
    <section class="section" style="background: #fff;">
        <h2>Featured Products</h2>
        <div class="products">
            <div class="product-card">
                <img src="images/iphone.jpg" alt="iPhone">
                <h3>iPhone 15 Pro</h3>
            </div>
            <div class="product-card">
                <img src="images/macbook.jpg" alt="MacBook">
                <h3>MacBook Air M3</h3>
            </div>
            <div class="product-card">
                <img src="images/ipad.jpg" alt="iPad">
                <h3>iPad Pro 12.9"</h3>
            </div>
        </div>
    </section>

    <!-- WHY CHOOSE US -->
    <section class="section" style="background: #f4f4f4;">
        <h2>Why Choose iBuy?</h2>
        <div class="features">
            <div class="feature-box">
                <i class="fas fa-shipping-fast"></i>
                <h4>Free Fast Shipping</h4>
                <p>All orders over $100 get free priority delivery.</p>
            </div>
            <div class="feature-box">
                <i class="fas fa-lock"></i>
                <h4>Secure Payments</h4>
                <p>Checkout safely with SSL encryption.</p>
            </div>
            <div class="feature-box">
                <i class="fas fa-star"></i>
                <h4>Top Rated</h4>
                <p>Thousands of verified 5-star customer reviews.</p>
            </div>
        </div>
    </section>

<jsp:include page="footer.jsp" />
<!-- Font Awesome CDN for icons -->
<script src="https://kit.fontawesome.com/a2d9d6a4b8.js" crossorigin="anonymous"></script>
</body>
</html>
