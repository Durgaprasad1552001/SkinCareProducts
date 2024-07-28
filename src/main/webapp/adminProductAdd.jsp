<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Add Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .file-upload-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border: 2px dashed #ccc;
            padding: 15px;
            border-radius: 4px;
            cursor: pointer;
            transition: border-color 0.3s ease;
            background-color: #fafafa;
        }
        .file-upload-container:hover {
            border-color: #4CAF50;
        }
        .file-upload-container label {
            font-size: 16px;
            color: #555;
        }
        .file-upload-container input[type="file"] {
            display: none;
        }
        button[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button[type="submit"]:hover {
            background-color: #45a049;
        }
        .error-message {
            color: red;
            margin-top: 5px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Add Product</h2>

    <form action="adminsentprod" method="get" enctype="multipart/form-data" onsubmit="return validateForm()">
        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" required>

        <label for="productPrice">Product Price:</label>
        <input type="text" id="productPrice" name="productPrice" required>

        <div class="file-upload-container">
            <label for="productImage">Image Path</label>
            <input type="text" id="productImage " name="productImage" required>
        </div>
      <br>

        <button type="submit">Add Product</button>
    </form>
    <br>
   <br>
     <button onclick="location.href='AdminPanel.jsp'">Back to AdminPanel</button>
    
</div>

<script>
    function validateForm() {
        var productName = document.getElementById('productName').value;
        var productPrice = document.getElementById('productPrice').value;
        var productImage = document.getElementById('productImage').value;

        if (productName.trim() === '') {
            alert('Please enter product name');
            return false;
        }

        if (productPrice.trim() === '') {
            alert('Please enter product price');
            return false;
        }

        if (productImage.trim() === '') {
            alert('Please select a product image');
            return false;
        }

        return true;
    }

    
</script>

</body>
</html>
