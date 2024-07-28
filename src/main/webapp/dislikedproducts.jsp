<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.Example.models.getDislikedProduct" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disliked Products</title>
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Styling for product display */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .product {
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #fff;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }
        .product:hover {
            transform: scale(1.02);
        }
        .product h3 {
            font-size: 18px;
            margin-top: 0;
        }
        .product p {
            font-size: 14px;
            color: #555;
            margin-bottom: 10px;
        }
        .product img {
            max-width: 100%;
            height: auto;
            display: block;
            margin-top: 10px;
        }

        /* Button and form styling */
        .btn-container {
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .btn-container form {
            display: inline-block;
        }
        .btn-container button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 4px;
            margin-right: 10px;
        }
        .btn-container button:hover {
            background-color: #45a049;
        }

        /* Styling for "Back to Home" button */
        .btn-back-home {
            background-color: #555;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        .btn-back-home:hover {
            background-color: #333;
        }

        /* Message styling */
        .message {
            margin-top: 20px;
            padding: 10px;
            background-color: #f44336;
            color: white;
            text-align: center;
        }

        /* Input styling */
        .input-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .input-container input {
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
            flex: 1;
        }
    </style>

    <script>
        // JavaScript for confirming refresh action
        function confirmRefresh() {
            return confirm("Are you sure you want to refresh disliked products?");
        }

        // JavaScript for filtering products
        function filterProducts() {
            const searchInput = document.getElementById('searchInput');
            const filter = searchInput.value.toUpperCase();
            const products = document.querySelectorAll('.product');

            products.forEach(product => {
                const productName = product.querySelector('h3').textContent.toUpperCase();
                if (productName.indexOf(filter) > -1) {
                    product.style.display = '';
                } else {
                    product.style.display = 'none';
                }
            });
        }

        // JavaScript for sorting products by name
        function sortByName() {
            const productsContainer = document.querySelector('.product-grid');
            const products = Array.from(productsContainer.querySelectorAll('.product'));

            products.sort((a, b) => {
                const nameA = a.querySelector('h3').textContent.toUpperCase();
                const nameB = b.querySelector('h3').textContent.toUpperCase();
                if (nameA < nameB) {
                    return -1;
                }
                if (nameA > nameB) {
                    return 1;
                }
                return 0;
            });

            products.forEach(product => productsContainer.appendChild(product));
        }

        // JavaScript for sorting products by price (ascending)
        function sortByPriceAsc() {
            const productsContainer = document.querySelector('.product-grid');
            const products = Array.from(productsContainer.querySelectorAll('.product'));

            products.sort((a, b) => {
                const priceA = parseFloat(a.querySelector('.product-price').textContent.replace(/[^\d.-]/g, ''));
                const priceB = parseFloat(b.querySelector('.product-price').textContent.replace(/[^\d.-]/g, ''));
                return priceA - priceB;
            });

            products.forEach(product => productsContainer.appendChild(product));
        }

        // JavaScript for sorting products by price (descending)
        function sortByPriceDesc() {
            const productsContainer = document.querySelector('.product-grid');
            const products = Array.from(productsContainer.querySelectorAll('.product'));

            products.sort((a, b) => {
                const priceA = parseFloat(a.querySelector('.product-price').textContent.replace(/[^\d.-]/g, ''));
                const priceB = parseFloat(b.querySelector('.product-price').textContent.replace(/[^\d.-]/g, ''));
                return priceB - priceA;
            });

            products.forEach(product => productsContainer.appendChild(product));
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Your Disliked Products</h1>

        <div class="btn-container">
            <form id="viewDislikedProductsForm" action="getDislikedProductsServlet" method="get" onsubmit="return confirmRefresh();">
                <button type="submit" class="btn">Refresh Disliked Products</button>
            </form>
            <a href="index.jsp" class="btn btn-back-home">Back to Home</a>
            <div class="input-container">
                <input type="text" id="searchInput" onkeyup="filterProducts()" placeholder="Search products...">
                <button class="btn" onclick="sortByName()">Sort by Name</button>
                <button class="btn" onclick="sortByPriceAsc()">Sort by Price (Asc)</button>
                <button class="btn" onclick="sortByPriceDesc()">Sort by Price (Desc)</button>
            </div>
        </div>

        <div class="product-grid">
            <% List<getDislikedProduct> dislikedProducts = (List<getDislikedProduct>) request.getAttribute("dislikedProducts");
            if (dislikedProducts != null && !dislikedProducts.isEmpty()) {
                java.util.Iterator<getDislikedProduct> iterator = dislikedProducts.iterator();
                while (iterator.hasNext()) {
                    getDislikedProduct product = iterator.next();
            %>
                    <div class="product">
                        <h3><%= product.getProductName() %></h3>
                        <img src="<%= product.getProductImage() %>" alt="<%= product.getProductName() %>">
                        <p class="product-price">Price: <%= product.getProductPrice() %></p>
                    </div>
            <% 
                }
            } else {
            %>
                <p class="message">No disliked products found.</p>
            <% } %>
        </div>
    </div>
</body>
</html>
