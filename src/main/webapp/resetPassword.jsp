<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>

*{
	margin:0;
	padding:0;
	box-sizing:border-box;
	font-family:'Poppins',sans-serif;
}

body{

	min-height:100vh;
	display:flex;
	justify-content:center;
	align-items:center;

	background:
	linear-gradient(rgba(15,32,39,.65),
	rgba(15,32,39,.65)),
	url("images/tour1.jpg");

	background-size:cover;
	background-position:center;
	background-attachment:fixed;

}

.container{

	width:100%;
	max-width:500px;

	padding:40px;

	border-radius:25px;

	background:rgba(255,255,255,.12);

	backdrop-filter:blur(20px);

	border:1px solid rgba(255,255,255,.25);

	box-shadow:0 20px 45px rgba(0,0,0,.35);

}

.logo{

	text-align:center;

	font-size:34px;

	font-weight:700;

	color:white;

	margin-bottom:10px;

}

.logo span{

	color:#38ef7d;

}

.subtitle{

	text-align:center;

	color:#ddd;

	margin-bottom:30px;

}

.form-group{

	margin-bottom:20px;

}

label{

	display:block;

	margin-bottom:8px;

	color:white;

	font-weight:500;

}

input{

	width:100%;

	padding:14px;

	border-radius:12px;

	border:1px solid rgba(255,255,255,.25);

	background:rgba(255,255,255,.08);

	color:white;

	font-size:15px;

	outline:none;

}

input:focus{

	border-color:#38ef7d;

	box-shadow:0 0 12px rgba(56,239,125,.3);

}

button{

	width:100%;

	padding:15px;

	border:none;

	border-radius:30px;

	background:linear-gradient(45deg,#00c6ff,#0072ff);

	color:white;

	font-size:17px;

	font-weight:600;

	cursor:pointer;

}

button:hover{

	transform:translateY(-3px);

}

.error{

	display:none;

	color:#ff8080;

	font-size:13px;

	margin-top:6px;

}

</style>

</head>

<body>

<div class="container">

	<div class="logo">
		Explore <span>Tours</span>
	</div>

	<div class="subtitle">
		Create your new password
	</div>

	<form action="resetPassword" method="post"
		onsubmit="return validatePassword()">

		<div class="form-group">

			<label>New Password</label>

			<input
				type="password"
				id="password"
				name="password"
				required>

		</div>

		<div class="form-group">

			<label>Confirm Password</label>

			<input
				type="password"
				id="confirmPassword"
				required>

			<div
				class="error"
				id="passwordError">

				Passwords do not match.

			</div>

		</div>

		<button type="submit">

			Update Password

		</button>

	</form>

</div>

<script>

function validatePassword(){

	let p=document.getElementById("password").value;

	let cp=document.getElementById("confirmPassword").value;

	let error=document.getElementById("passwordError");

	if(p!=cp){

		error.style.display="block";

		return false;

	}

	error.style.display="none";

	return true;

}

</script>

</body>
</html>