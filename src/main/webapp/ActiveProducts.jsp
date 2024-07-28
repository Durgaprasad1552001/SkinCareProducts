<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Example.models.ActiveProducts" %>
<%@ page import="java.util.Iterator" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <!-- Include FontAwesome library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=" crossorigin="anonymous" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
        }
        .product-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .product {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            width: 220px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product img {
            max-width: 100%;
            height: auto;
        }
        .product-name {
            font-size: 18px;
            font-weight: bold;
            margin: 10px 0;
        }
        .product-price {
            color: green;
            font-size: 16px;
            margin-bottom: 10px;
        }
        .like-dislike-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .like-btn, .dislike-btn {
            background-color: transparent;
            border: none;
            cursor: pointer;
            margin: 5px 5px;
            display: flex;
            align-items: center;
            border-radius: 5px;
            padding: 10px;
        }
        .like-btn img, .dislike-btn img {
            width: 24px;
            height: 24px;
            margin-right: 5px;
            vertical-align: middle;
            border-radius: 5px;
        }
        .like-btn:hover img, .dislike-btn:hover img {
            filter: brightness(0.8);
            border-radius: 5px;
        }
        .like-btn:hover path, .dislike-btn:hover path {
            fill: #007bff;
            border-radius: 5px;
        }
        .dislike-btn:hover path {
            fill: #FF6347;
            border-radius: 5px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .liked {
            background-color: gold;
        }
        .disliked {
            background-color: orangered;
        }
        .sort-search-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .sort-search-container select, .sort-search-container input {
            padding: 10px;
            font-size: 16px;
        }
        .sort-buttons {
            display: flex;
            align-items: center;
        }
        .sort-buttons button {
            padding: 10px;
            margin-left: 10px;
            cursor: pointer;
            background-color: #ddd;
            border: none;
            border-radius: 5px;
        }
        .sort-buttons button.active {
            background-color: #007bff;
            color: white;
        }
        .search-input {
            width: 300px;
        }
        .search-container {
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Beauty Products</h1>
        <div class="sort-search-container">
            <div class="sort-buttons">
                <label for="sortOptions">Sort by:</label>
                <select id="sortOptions">
                    <option value="name">Name</option>
                    <option value="price">Price</option>
                </select>
                <button id="ascBtn" onclick="sortProducts('asc')" class="active">Asc</button>
                <button id="descBtn" onclick="sortProducts('desc')">Desc</button>
            </div>
            <div class="search-container">
                <label for="searchInput">Search:</label>
                <input type="text" id="searchInput" class="search-input" onkeyup="searchProducts()" placeholder="Search products...">
            </div>
        </div>
        <div class="product-container" id="productContainer">
            <% 
            List<ActiveProducts> products = (List<ActiveProducts>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                Iterator<ActiveProducts> iterator = products.iterator();
                while(iterator.hasNext()) {
                    ActiveProducts product = iterator.next();
            %>
            <div class="product" data-name="<%= product.getProductName() %>" data-price="<%= product.getProductPrice() %>">
                <img src="<%= product.getProductImage() %>" alt="<%= product.getProductName() %>">
                <div class="product-name"><%= product.getProductName() %></div>
                <div class="product-price">Price: <%= product.getProductPrice() %>/-</div>
                <div class="like-dislike-container">
                    <button class="like-btn" id="like-btn-<%= product.getProduct_id() %>" onclick="likeProduct('<%= product.getProductName() %>', '<%= product.getProduct_id() %>')">
                        <img id="like-icon-<%= product.getProduct_id() %>" src="https://www.svgrepo.com/show/220662/like.svg" alt="^">
                        Like
                    </button>
                    <button class="dislike-btn" id="dislike-btn-<%= product.getProduct_id() %>" onclick="dislikeProduct('<%= product.getProductName() %>', '<%= product.getProduct_id() %>')">
                        <img id="dislike-icon-<%= product.getProduct_id() %>" src="https://www.svgrepo.com/show/70813/dislike.svg" alt="*">
                        Dislike
                    </button>
                </div>
            </div>
            <% 
                }
            } else {
                // Handle case when products list is null or empty
                %>
                <div>No active products found.</div>
                <% 
            } 
            %>
        </div>
        
        <!-- Form to send request to servlet -->
        <div class="btn-container">
            <form id="viewProductsForm" action="viewProducts" method="get">
                <button type="submit" class="btn">Refresh to view products</button>
            </form>
        </div>
    </div>

    <!-- JavaScript to handle like/dislike actions and sorting/searching -->
    <script>
    function likeProduct(productName, productId) {
        fetch('/serviceWebpage/LikeProductServlet?productName=' + encodeURIComponent(productName) + '&productId=' + encodeURIComponent(productId))
            .then(response => response.text())
            .then(data => {
                alert(data); // Alert response from servlet (e.g., "Liked ProductName")
                document.getElementById('like-icon-' + productId).src = 'https://www.svgrepo.com/show/220662/liked.svg'; // Change to liked icon
                document.getElementById('like-btn-' + productId).classList.add('liked'); // Add 'liked' class for styling
                document.getElementById('dislike-icon-' + productId).src = 'https://www.svgrepo.com/show/70813/dislike.svg'; // Reset dislike icon
                document.getElementById('dislike-btn-' + productId).classList.remove('disliked'); // Remove 'disliked' class for styling
                // Optionally update UI based on response
            })
            .catch(error => {
                console.error('Error liking product:', error);
                // Handle error if AJAX request fails
            });
    }

    function dislikeProduct(productName, productId) {
        fetch('/serviceWebpage/DislikeProductServlet?productName=' + encodeURIComponent(productName) + '&productId=' + encodeURIComponent(productId))
            .then(response => response.text())
            .then(data => {
                alert(data); // Alert response from servlet (e.g., "Disliked ProductName")
                document.getElementById('dislike-icon-' + productId).src = 'https://www.svgrepo.com/show/70813/disliked.svg'; // Change to disliked icon
                document.getElementById('dislike-btn-' + productId).classList.add('disliked'); // Add 'disliked' class for styling
                document.getElementById('like-icon-' + productId).src = 'https://www.svgrepo.com/show/220662/like.svg'; // Reset like icon
                document.getElementById('like-btn-' + productId).classList.remove('liked'); // Remove 'liked' class for styling
                // Optionally update UI based on response
            })
            .catch(error => {
                console.error('Error disliking product:', error);
                // Handle error if AJAX request fails
            });
    }

    function sortProducts(order) {
        const sortOption = document.getElementById('sortOptions').value;
        const productContainer = document.getElementById('productContainer');
        const products = Array.from(productContainer.getElementsByClassName('product'));

        products.sort((a, b) => {
            if (sortOption === 'name') {
                return order === 'asc' ? a.getAttribute('data-name').localeCompare(b.getAttribute('data-name')) : b.getAttribute('data-name').localeCompare(a.getAttribute('data-name'));
            } else if (sortOption === 'price') {
                return order === 'asc' ? parseFloat(a.getAttribute('data-price')) - parseFloat(b.getAttribute('data-price')) : parseFloat(b.getAttribute('data-price')) - parseFloat(a.getAttribute('data-price'));
            }
        });

        productContainer.innerHTML = '';
        products.forEach(product => productContainer.appendChild(product));

        document.getElementById('ascBtn').classList.toggle('active', order === 'asc');
        document.getElementById('descBtn').classList.toggle('active', order === 'desc');
    }

    function searchProducts() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const products = document.getElementsByClassName('product');

        Array.from(products).forEach(product => {
            const name = product.getAttribute('data-name').toLowerCase();
            if (name.includes(searchInput)) {
                product.style.display = 'block';
            } else {
                product.style.display = 'none';
            }
        });
    }
    </script>
</body>
</html>

