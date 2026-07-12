<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

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
	padding:20px;
	background:
	linear-gradient(rgba(15,32,39,.65),rgba(15,32,39,.65)),
	url("images/tour1.jpg");
	background-size:cover;
	background-position:center;
	background-attachment:fixed;
	animation:zoom 15s infinite alternate;
}

@keyframes zoom{

	from{
		background-size:100%;
	}

	to{
		background-size:115%;
	}

}

.container{

	width:100%;
	max-width:450px;

	padding:40px;

	border-radius:25px;

	background:rgba(255,255,255,.12);

	backdrop-filter:blur(20px);

	border:1px solid rgba(255,255,255,.25);

	box-shadow:0 20px 45px rgba(0,0,0,.35);

}

.logo{

	text-align:center;

	font-size:38px;

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

	font-family:cursive;

	margin-bottom:35px;

}

.form-group{

	margin-bottom:22px;

}

.form-group label{

	display:block;

	margin-bottom:8px;

	color:white;

	font-weight:500;

}

input{

	width:100%;

	padding:14px 16px;

	border-radius:12px;

	border:1px solid rgba(255,255,255,.25);

	background:rgba(255,255,255,.08);

	color:white;

	font-size:15px;

	outline:none;

	transition:.3s;

}

input::placeholder{

	color:rgba(255,255,255,.65);

}

input:focus{

	background:rgba(255,255,255,.18);

	border-color:#38ef7d;

	box-shadow:0 0 15px rgba(56,239,125,.35);

}

button{

	width:100%;

	padding:15px;

	border:none;

	border-radius:30px;

	background:linear-gradient(45deg,#00c6ff,#0072ff);

	color:white;

	font-size:18px;

	font-weight:600;

	cursor:pointer;

	transition:.3s;

	margin-top:10px;

}

button:hover{

	transform:translateY(-4px);

	box-shadow:0 15px 25px rgba(0,0,0,.35);

}

.extra{

	display:flex;

	justify-content:space-between;

	align-items:center;

	margin-top:18px;

	font-size:14px;

}

.extra a{

	color:#38ef7d;

	text-decoration:none;

}

.extra a:hover{

	text-decoration:underline;

}

.register{

	margin-top:30px;

	text-align:center;

	color:white;

}

.register a{

	color:#38ef7d;

	font-weight:600;

	text-decoration:none;

}

.register a:hover{

	text-decoration:underline;

}

.error{

	color:#ff8080;

	font-size:14px;

	text-align:center;

	margin-bottom:15px;

}

@media(max-width:600px){

	.container{

		padding:28px;

	}

	.logo{

		font-size:30px;

	}

}
</style>

</head>

<body>

<div class="container">

	<div class="logo">
		Explore <span>Tours</span>
	</div>

	<div class="subtitle">
		Welcome Back! Sign in to continue your journey
	</div>

	<%
	String error=(String)request.getAttribute("error");

	if(error!=null){
	%>

	<div class="error">
		<%=error%>
	</div>

	<%
	}
	%>

	<form action="login" method="post">

		<div class="form-group">

			<label>Email</label>

			<input
				type="email"
				name="uemail"
				placeholder="Enter your email"
				required>

		</div>

		<div class="form-group">

			<label>Password</label>

			<input
				type="password"
				name="upswd"
				id="password"
				placeholder="Enter your password"
				required>

		</div>

		<button type="submit">
			Login
		</button>

		<div class="extra">

			<a href="forgotPassword.jsp">Forgot Password?</a>

			<a href="home">← Back to Home</a>

		</div>

		<div class="register">

			Don't have an account?

			<a href="registration.jsp">Create Account</a>

		</div>

	</form>

</div>

</body>
</html>