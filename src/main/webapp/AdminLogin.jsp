
<!DOCTYPE html>
<html>
<head>
<title>Product Store</title>	
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
	<style>
			#Admin , #pass{
				margin:15px 15px 15px 15px;
				}
	</style>

</head>
<body>
<h1 Style ="text-align:center; color : white;background-color : black">Welcome To Product Store</h1>
<div class="Container fluid">
	<div class="row">
		<div class="col-md-8">
		</div>
		<div class="col-md-4 bg-dark">
			<nav class = "navbar navbar-expand-md">
				<ul class="navbar-nav">
					<li class="nav-item"><a href="registration.jsp" class="nav-link"> REGISTRATION </a></li>
					<li class="nav-item"><a href="login.jsp" class="nav-link"> LOGIN </a></li>
				</ul>
			</nav>	
		</div>		
	</div>	
</div>

<div class="Container fluid">
	<div class="row">
		<div class="col-md-4">
		</div>
		<div class="col-md-4">
		<h3 style ="text-align:center"><b>Admin Credentials</b> </h3>
					<form name="Login Page"class="form-group" method ="post" action="admin">
						<input type="text" class="form-control" name="Admin" id ="Admin" placeholder="Admin">
						<input type="password" class="form-control" name="PassWord" id ="pass" placeholder="Admin Pass">
						<button type = "submit"  class = "btn btn-success">Login</button>
						</form>
		</div>
		<div class="col-md-4">
		</div>
	</div>
</div>	
<div class="Container fluid">
	<div class="row">
		<div class="col-md-12">
		<pre>
		
						<b Style = " color : white;background-color : red">NOTE:</b>
						You can directly login if you are a old user.
						Register if you are a new user.
						Go to Admin page if you are admin.	
	</pre>
		</div>
	</div>
</div>
</body>
</html>