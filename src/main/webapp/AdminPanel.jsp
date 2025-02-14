<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Admin Panel</title>
  
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <Style>
	@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500&display=swap');
   @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css");
:root {
	--primaer-color: #fff;
}
*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}
body{
	display: flex;
	width: 100%;
	height: auto;
	align-items: center;
	justify-content: center;
	background-image: url('https://res.cloudinary.com/dec3di0vs/image/upload/v1721913951/win4_o9fsco.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}
.container{
	display: flex;
	flex-direction: column;
	width: 600px;
	height: 100vh;
	border-radius: 10px;
	align-items: center;
	box-shadow: 0px 4px 10px 1px rgba(0, 0, 0, 0.2);
	overflow: hidden;
	transition: 1s;
	background: rgb(255 255 255 / 25%);
    box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
    backdrop-filter: blur( 30px );
    -webkit-backdrop-filter: blur( 3px );
    border-radius: 10px;
    border: 1px solid rgba( 255, 255, 255, 0.18 );
}
.container .brand{
	display: flex;
	width: 100%;
	height: 40px;
	padding: 0 10px;
	margin: 10px 0;
	align-items: center;
	justify-content: space-between;
}
.container .brand h3{
	font-weight: 300;
	font-size: 20px;
	color: var(--primaer-color);
}

.container .brand a i{
	color: var(--primaer-color);
	font-size: 30px;
}
.container .navbar {
	display: flex;
	width: 90%;
	height: auto;
	margin: 10px 0;
	align-items: center;
	justify-content: center;
}

.container .navbar ul{
	list-style-type: none;
	display: flex;
	flex-direction: column;
	height: 100%;
	width: 100%;
	align-items: flex-start;
	justify-content: center;
}
.container .navbar ul li{
	height: 40px;
	width: 100%;
	margin: 5px 0;
}
.container .navbar ul li a{
	display: flex;
	width: 100%;
	height: 100%;
	text-decoration: none;
	border-radius: 7px;
	align-items: center;
	justify-content: left;
}
.add .navbar:nth-child(4) {
	margin: 0;
}
.container .navbar ul li a {
	color: var(--primaer-color);
}
.container .navbar ul li a span{
	font-size: 14px;
	font-weight: 300;
}
.container .navbar ul li a i{
	display: flex;
	font-size: 20px;
	margin: 0 15px;
}
.container .navbar ul li a:hover,.container .navbar ul li a:hover span,.container .navbar ul li a:hover i{
    background: #8a8a8a14;
    backdrop-filter: blur(63px);
	
}
.container .user{
    display: flex;
    flex-direction: column;
	gap: 4px;
    width: 100%;
    height: 78px;
    align-items: center;
	text-align: center;
}


.container .user img{
	width: 50px;
	height: 50px;
	border-radius: 50%;
}
.container .user .name{
    display: flex;
    flex-direction: column;
}
.container .user .name h5{
	color: #fff;
	font-size: 12px;
	
}
.container .user .name span{
	color: #fff;
	font-size: 10px;
}
.container.active{
	width: 70px;
}
.container.active .brand{
	justify-content: center;
}
.container.active .navbar ul{
	width: 90%;
}
.container.active .user{
	width: 80%;
	height: 100%;
}
.container.active .navbar ul li a{
	justify-content: center;
}
.container.active .brand .logo,.container.active .brand h3,.container.active .navbar ul li a span,.container.active .user .name{
	display: none;
}

  </Style>
</head>

<body>
  <div class="container add" id="container">
    <div class="brand">
      <h3>Products Mangement</h3>
      <a href="#" id="toggle"><i class="bi bi-list"></i></a>
    </div>
    <div class="user">
      <img src="https://res-console.cloudinary.com/dec3di0vs/thumbnails/v1/image/upload/v1721913850/c2FtcGxlcy9hbmltYWxzL3RocmVlLWRvZ3M=/drilldown" alt="">
      <div class="name">
        <h5>Skin Care Products</h5>
        <span>Admin Panel</span>
      </div>
    </div>
    <div class="navbar">
      <ul>
        <li><a href="#"><i class="bi bi-house"></i><span>DashBoard</span></a></li>
        <li><a href="#"><i class="bi bi-person"></i><span>User</span></a></li>
        <li><a href="#"><i class="bi bi-chat-right-text"></i><span>Message</span></a></li>
        <li><a href="adminProductAdd.jsp"><i class="bi bi-bag-plus-fill"></i><span>Adding the product</span></a></li>
        <li><a href="#"><i class="bi bi-folder"></i><span>File Manager</span></a></li>
        <li><a href="deleteproduct.jsp"><i class="bi bi-trash"></i><span>Delete the Product</span></a></li>
        <li><a href="inactiveProduct.jsp"><i class="bi bi-x-circle-fill"></i><span>Inactive Product</span></a></li>
        <li><a href="DeleteCustomer.jsp"><i class="bi bi-person-x-fill"></i><span>Delete Customer</span></a></li>
        <li><a href="#"><i class="bi bi-gear"></i><span>Setting</span></a></li>
      </ul> 
    </div>

    <div class="navbar">
      <ul>
        <li><a href="AdminLogout.jsp"><i class="bi bi-box-arrow-in-right"></i><span>Log Out</span></a></li>
      </ul>
    </div>
  </div>
  <script >
	var toggle = document.getElementById("toggle");
var container = document.getElementById("container");

toggle.onclick = function(){
	container.classList.toggle('active');
}

  </script>
</body>
</html>
