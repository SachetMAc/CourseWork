<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="../header.jsp" />

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #000;
        color: #fff;
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
        margin-top: 40px;
        font-size: 26px;
        color: #fff;
    }

    .nav-links {
        display: flex;
        justify-content: center;
        margin: 20px 0 0;
    }

    .nav-links a {
        padding: 10px 20px;
        background-color: #fff;
        color: #000;
        border-radius: 5px;
        font-weight: bold;
        text-decoration: none;
        transition: all 0.3s ease;
    }

    .nav-links a:hover {
        background-color: #e0e0e0;
    }

    .product-form {
        width: 420px;
        background: #111;
        padding: 30px 25px;
        margin: 30px auto 60px;
        border-radius: 10px;
        box-shadow: 0 4px 20px rgba(255, 255, 255, 0.05);
    }

    .product-form input[type="text"],
    .product-form input[type="number"],
    .product-form textarea {
        width: 100%;
        padding: 12px 15px;
        margin: 12px 0;
        border: 1px solid #444;
        border-radius: 8px;
        background-color: #222;
        color: #fff;
        transition: border-color 0.3s ease;
        font-size: 14px;
    }

    .product-form input:focus,
    .product-form textarea:focus {
        border-color: #fff;
        outline: none;
        background-color: #000;
    }

    .product-form textarea {
        height: 100px;
        resize: vertical;
    }

    .product-form button {
        width: 100%;
        padding: 12px;
        background-color: #fff;
        color: #000;
        font-size: 16px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-top: 20px;
        font-weight: bold;
    }

    .product-form button:hover {
        background-color: #ccc;
    }
</style>

<!-- Back Button -->
<div class="nav-links">
    <a href="../admin/dashboard.jsp">← Back to Dashboard</a>
</div>

<!-- Page Heading -->
<h2>Add New Product</h2>

<!-- Product Form -->
<form action="../add-product" method="post" class="product-form">
    <input type="text" name="name" placeholder="Product Name" required />
    <textarea name="description" placeholder="Description" required></textarea>
    <input type="number" name="price" placeholder="Price (e.g., 999.99)" step="0.01" required />
    <input type="number" name="stock" placeholder="Stock" required />
    <input type="text" name="image" placeholder="Image filename (e.g., iphone.jpg)" required />
    <button type="submit">Add Product</button>
</form>

<jsp:include page="../footer.jsp" />
