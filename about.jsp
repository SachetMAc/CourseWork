<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
    <title>About Us</title>
    <style>
        .about-container {
            max-width: 1200px;
            margin: 40px auto;
            text-align: center;
        }

        .about-title {
            font-size: 32px;
            margin-bottom: 30px;
            color: #333;
        }

        .team-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
        }

        .member-card {
            width: 260px;
            padding: 20px;
            background: #f7f7f7;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .member-card h3 {
            margin: 10px 0 5px;
            font-size: 20px;
            color: #000;
        }

        .member-card p {
            font-size: 15px;
            color: #555;
        }

        @media (max-width: 768px) {
            .team-grid {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>
    <div class="about-container">
        <h2 class="about-title">Meet Our Team</h2>
        <div class="team-grid">
            <div class="member-card">
                <h3>Sachet Shilwal</h3>
                <p>Lead Backend Developer - Handles authentication, user sessions, and database architecture for the e-commerce platform.</p>
            </div>
            <div class="member-card">
                <h3>Manoj Gurung</h3>
                <p>UI/UX & Frontend Designer - Designs product pages, checkout flows, and responsive layouts for seamless user experiences.</p>
            </div>
            <div class="member-card">
                <h3>Sagar Adhikari</h3>
                <p>Payment & Cart Engineer - Manages cart logic, order checkout, and integrates secure payment systems.</p>
            </div>
            <div class="member-card">
                <h3>Manish Rana</h3>
                <p>Admin Dashboard Developer - Builds and maintains analytics, product management, and user control tools for the admin panel.</p>
            </div>
            <div class="member-card">
                <h3>Ritesh Thapa</h3>
                <p>Product & Inventory Manager - Handles product listing, categorization, and backend inventory synchronization.</p>
            </div>
        </div>
    </div>
<jsp:include page="footer.jsp" />
</body>
</html>
