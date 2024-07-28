<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Product</title>
    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    width: 50%;
    margin: 100px auto;
    background: #fff;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
}

form {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

label, input, button {
    font-size: 16px;
}

button {
    padding: 10px;
    background-color: #d9534f;
    color: #fff;
    border: none;
    cursor: pointer;
}

button:hover {
    background-color: #c9302c;
}

.hidden {
    display: none;
}

#confirmationMessage {
    text-align: center;
    color: green;
    font-size: 18px;
    margin-top: 20px;
}
    
    </style>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const form = document.getElementById("deleteForm");
        form.addEventListener("submit", function(event) {
            event.preventDefault();

            const productId = document.getElementById("productId").value;
            const confirmationMessage = document.getElementById("confirmationMessage");

            fetch("DeleteProductServlet", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: `productId=${productId}`
            })
            .then(response => response.text())
            .then(data => {
                if (data === "success") {
                    confirmationMessage.classList.remove("hidden");
                    confirmationMessage.textContent = "Product deleted successfully!";
                } else {
                    confirmationMessage.classList.remove("hidden");
                    confirmationMessage.textContent = "Error deleting product!";
                }
            })
            .catch(error => {
                confirmationMessage.classList.remove("hidden");
                confirmationMessage.textContent = "Error deleting product!";
            });
        });
    });

    </script>
</head>
<body>
    <div class="container">
        <h1>Delete Product</h1>
        <form id="deleteForm" action="DeleteProductServlet" method="post">
            <label for="productId">Product ID:</label>
            <input type="text" id="productId" name="productId" required>
            <button type="submit">Delete</button>
        </form>
        <div id="confirmationMessage" class="hidden">Product deleted successfully!</div>
    </div>
</body>
</html>
