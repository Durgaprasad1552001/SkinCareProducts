<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Settings Page</title>
<link rel="stylesheet" href="styles.css"> <!-- Link to external CSS file -->
</head>
<style>
/* Basic styling for the settings page */
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

.settings-container {
    max-width: 600px;
    margin: 50px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin-bottom: 20px;
}

p {
    text-align: center;
    font-size: 16px;
    margin-bottom: 30px;
}

form {
    display: grid;
    gap: 15px;
}

.setting-item {
    display: grid;
    gap: 10px;
}

label {
    font-weight: bold;
}

input[type="text"],
input[type="email"],
select {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="checkbox"] {
    width: auto;
}

button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
}

button:hover {
    background-color: #45a049;
}

</style>
<body>

<div class="settings-container">
    <h1>Settings</h1>
    <p>Use this page to update your account settings. You can change your username, email address, notification preferences, and theme. Make sure to save your changes by clicking the "Save Settings" button.</p>
    
    <form id="settings-form">
        <div class="setting-item">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter your username">
            <p class="description">Your username will be visible to others.</p>
        </div>
        
        <div class="setting-item">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email address">
            <p class="description">Your email address will be used for account notifications and password resets.</p>
        </div>
        
        <div class="setting-item">
            <label for="email">Description</label>
            <input type="text" id="email" name="email" placeholder="description" height="200px">
            <p class="description">Description of your Problem </p>
        </div>
        
        <div class="setting-item">
            <label for="notifications">Receive Notifications:</label>
            <input type="checkbox" id="notifications" name="notifications">
            <p class="description">Check this box to receive notifications about account activity and updates.</p>
        </div>
        
        <div class="setting-item">
            <label for="theme">Choose Theme:</label>
            <select id="theme" name="theme">
                <option value="light">Light Theme</option>
                <option value="dark">Dark Theme</option>
            </select>
            <p class="description">Select your preferred theme for the website.</p>
        </div>
        
        <div class="setting-item">
            <button type="submit">Save Settings</button>
        </div>
    </form>
</div>
<script>
document.getElementById('settings-form').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent the form from submitting

    const formData = new FormData(event.target);

    // Check if required fields are empty
    const username = formData.get('username');
    const email = formData.get('email');
    
    if (!username || !email) {
        alert("Please fill in all the required fields (username and email).");
        return;
    }

    // Check if email is valid
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address.");
        return;
    }

    fetch("https://getform.io/f/bjjeozwb", {
        method: "POST",
        body: formData,
        headers: {
            "Accept": "application/json",
        },
    })
    .then(response => {
        if (response.ok) {
            alert('Settings saved successfully!');
        } else {
            alert('Failed to save settings.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Failed to save settings.');
    });
});
</script>

</body>
</html>
