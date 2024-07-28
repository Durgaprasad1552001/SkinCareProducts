<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Text&display=swap" rel="stylesheet">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css'>
  <link rel='stylesheet' href='https://pro.fontawesome.com/releases/v5.10.2/css/all.css'>
  <link rel='stylesheet' href='style.css'>
  <title>Login Page</title>
  <style>
    @charset "UTF-8";
    body {
      font-family: 'Big Shoulders Text', cursive;
      margin: 0;
      padding: 0;
      background: linear-gradient(#141e30, #243b55);
      color: #fff;
    }
    .container {
      display: flex;
      flex-direction: column;
      align-items: center;
      overflow: auto;
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: var(--background);
      color: var(--color);
    }
    .container:not(.dark) {
      --background: #fcfbfe;
      --color: #323133;
      --sectionBackground: #ffffff;
      --borderColor: #e9e9e9;
      --text1: #323133;
      --text2: #3C3B3D;
      --shadow: rgba(0,0,0,0.1);
      --iconColor: #03e9f4;
    }
    .container.dark {
      --background: #1C1B20;
      --color: #F5F7FA;
      --sectionBackground: #222126;
      --borderColor: #252429;
      --text1: #F5F7FA;
      --text2: #E6E9ED;
      --shadow: rgba(0,0,0,0.1);
      --iconColor: #03e9f4;
    }
    .container *[class*="card"] {
      background: var(--sectionBackground);
      color: var(--text1);
      box-shadow: 0 0 1rem -0.25rem var(--shadow);
    }
    .container .darkmode {
      position: fixed;
      bottom: 1rem;
      left: 1rem;
      font-size: 1.75rem;
      padding: 1rem;
      margin: 1px;
      border-radius: 100%;
      border-color: var(--iconColor) !important;
      box-shadow: 0 0 1rem -0.25rem var(--iconColor), inset 0 0 1rem -0.75rem var(--iconColor);
      color: var(--iconColor);
      cursor: pointer;
      transition: .25s -.05s;
    }
    .container .darkmode:hover {
      box-shadow: 0 0 1rem -0.25rem var(--iconColor), inset 0 0 1rem -0.25rem var(--iconColor);
    }
    .admin-login {
      position: fixed;
      top: 1rem;
      right: 1rem;
      padding: 10px 20px;
      background: #03f447;
      color: #0a0a0a;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      text-transform: uppercase;
      font-size: 14px;
      transition: 0.3s ease;
    }
    .admin-login:hover {
      background: #028fb1;
    }
    .reg-login{
        position: fixed;
      top: 5rem;
      right: 1rem;
      padding: 10px 20px;
      background: #03f447;
      color: #0a0a0a;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      text-transform: uppercase;
      font-size: 14px;
      transition: 0.3s ease;  
    }
    .reg-login:hover {
      background: #028fb1;
    }
    .login-box {
      position: absolute;
      top: 50%;
      left: 50%;
      width: 400px;
      padding: 40px;
      transform: translate(-50%, -50%);
      background: rgba(0, 0, 0, .5);
      box-sizing: border-box;
      box-shadow: 0 15px 25px rgba(0, 0, 0, .6);
      border-radius: 10px;
    }
    .login-box h2 {
      margin: 0 0 30px;
      padding: 0;
      color: #fff;
      text-align: center;
    }
    .login-box .user-box {
      position: relative;
    }
    .login-box .user-box input {
      width: 100%;
      padding: 10px 0;
      font-size: 16px;
      color: #fff;
      margin-bottom: 30px;
      border: none;
      border-bottom: 1px solid #fff;
      outline: none;
      background: transparent;
    }
    .login-box .user-box label {
      position: absolute;
      top: 0;
      left: 0;
      padding: 10px 0;
      font-size: 16px;
      color: #fff;
      pointer-events: none;
      transition: .5s;
    }
    .login-box .user-box input:focus ~ label,
    .login-box .user-box input:valid ~ label {
      top: -20px;
      left: 0;
      color: #03e9f4;
      font-size: 12px;
    }
    .login-box form a {
      position: relative;
      display: inline-block;
      padding: 10px 20px;
      color: #03e9f4;
      font-size: 16px;
      text-decoration: none;
      text-transform: uppercase;
      overflow: hidden;
      transition: .5s;
      margin-top: 40px;
      letter-spacing: 4px;
    }
    .login-box a:hover {
      background: #03e9f4;
      color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 5px #03e9f4,
                  0 0 25px #03e9f4,
                  0 0 50px #03e9f4,
                  0 0 100px #03e9f4;
    }
    .login-box a span {
      position: absolute;
      display: block;
    }
    .login-box a span:nth-child(1) {
      top: 0;
      left: -100%;
      width: 100%;
      height: 2px;
      background: linear-gradient(90deg, transparent, #03e9f4);
      animation: btn-anim1 1s linear infinite;
    }
    @keyframes btn-anim1 {
      0% {
        left: -100%;
      }
      50%, 100% {
        left: 100%;
      }
    }
    .login-box a span:nth-child(2) {
      top: -100%;
      right: 0;
      width: 2px;
      height: 100%;
      background: linear-gradient(180deg, transparent, #03e9f4);
      animation: btn-anim2 1s linear infinite;
      animation-delay: .25s;
    }
    @keyframes btn-anim2 {
      0% {
        top: -100%;
      }
      50%, 100% {
        top: 100%;
      }
    }
    .login-box a span:nth-child(3) {
      bottom: 0;
      right: -100%;
      width: 100%;
      height: 2px;
      background: linear-gradient(270deg, transparent, #03e9f4);
      animation: btn-anim3 1s linear infinite;
      animation-delay: .5s;
    }
    @keyframes btn-anim3 {
      0% {
        right: -100%;
      }
      50%, 100% {
        right: 100%;
      }
    }
    .login-box a span:nth-child(4) {
      bottom: -100%;
      left: 0;
      width: 2px;
      height: 100%;
      background: linear-gradient(360deg, transparent, #03e9f4);
      animation: btn-anim4 1s linear infinite;
      animation-delay: .75s;
    }
    @keyframes btn-anim4 {
      0% {
        bottom: -100%;
      }
      50%, 100% {
        bottom: 100%;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <button class="admin-login" onclick="window.location.href='AdminLogin.jsp'">Admin Login</button>
	<button class="reg-login" onclick="window.location.href='registration.jsp'">Registration</button>
    <div class="darkmode fas fa-moon-cloud" onclick="toggleDarkMode()"></div>
    <div class="login-box">
      <h2>Login</h2>
      <form id="loginForm" action="Login" method="post" onsubmit="return validateForm()">
        <div class="user-box">
          <input type="text" id="userid" name="UserName" required="">
          <label>Username</label>
        </div>
        <div class="user-box">
          <input type="password" id="password" name="PassWord" required="">
          <label>Password</label>
        </div>
        <a href="#" onclick="document.getElementById('loginForm').submit();">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          Submit
        </a>
      </form>
    </div>
  </div>

  <script>
    function toggleDarkMode() {
      document.querySelector('.container').classList.toggle('dark');
    }
    
    function validateForm() {
      var userid = document.getElementById("userid").value;
      var password = document.getElementById("password").value;
  
      if (userid == "" || password == "") {
        alert("UserName and PassWord must be filled out");
        return false;
      }
      return true;
    }
  </script>
</body>
</html>
