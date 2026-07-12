<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 40px 20px;
	background: linear-gradient(rgba(15, 32, 39, .65), rgba(15, 32, 39, .65)),
		url("images/tour1.jpg");
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
	animation: zoom 15s infinite alternate;
}

@keyframes zoom {
	from {
		background-size: 100%;
	}
	to {
		background-size: 115%;
	}
}

.container {
	width: 100%;
	max-width: 520px;
	padding: 40px;
	border-radius: 25px;
	background: rgba(255, 255, 255, .12);
	backdrop-filter: blur(20px);
	border: 1px solid rgba(255, 255, 255, .25);
	box-shadow: 0 20px 45px rgba(0, 0, 0, .35);
}

.logo {
	font-size: 36px;
	font-weight: 700;
	color: white;
	text-align: center;
	margin-bottom: 8px;
}

.logo span {
	color: #38ef7d;
}

.subtitle {
	text-align: center;
	color: #ddd;
	font-family: cursive;
	margin-bottom: 30px;
	line-height: 1.6;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	color: white;
	font-weight: 500;
}

input {
	width: 100%;
	padding: 14px 16px;
	border-radius: 12px;
	border: 1px solid rgba(255, 255, 255, .25);
	background: rgba(255, 255, 255, .08);
	color: white;
	font-size: 15px;
	outline: none;
	transition: .3s;
}

input:focus {
	background: rgba(255, 255, 255, .18);
	border-color: #38ef7d;
	box-shadow: 0 0 15px rgba(56, 239, 125, .35);
}

input::placeholder {
	color: rgba(255, 255, 255, .65);
}

button {
	width: 100%;
	padding: 15px;
	border: none;
	border-radius: 30px;
	background: linear-gradient(45deg, #00c6ff, #0072ff);
	color: white;
	font-size: 18px;
	font-weight: 600;
	cursor: pointer;
	transition: .3s;
}

button:hover {
	transform: translateY(-4px);
	box-shadow: 0 15px 25px rgba(0, 0, 0, .35);
}

.back {
	margin-top: 22px;
	text-align: center;
	color: white;
}

.back a {
	color: #38ef7d;
	text-decoration: none;
	font-weight: 600;
}

.back a:hover {
	text-decoration: underline;
}

.info {
	margin-bottom: 25px;
	padding: 12px;
	border-radius: 10px;
	background: rgba(255,255,255,.08);
	color: #e5e5e5;
	font-size: 14px;
	text-align: center;
}

@media(max-width:600px) {

	.container {
		padding: 25px;
	}

	.logo {
		font-size: 28px;
	}
}
</style>

</head>

<body>

<%
String error = (String)request.getAttribute("error");

if(error != null){
%>

<script>
alert("<%=error%>");
</script>

<%
}
%>

<div class="container">

	<div class="logo">
		Explore <span>Tours</span>
	</div>

	<div class="subtitle">
		Forgot your password?<br>
		Enter your registered email to receive a verification OTP.
	</div>

	<div class="info">
		An OTP will be sent to your registered email address.
	</div>

	<form action="forgotPassword" method="post">

		<div class="form-group">

			<label for="uemail">Registered Email</label>

			<input
				type="email"
				id="uemail"
				name="uemail"
				placeholder="example@gmail.com"
				required>

		</div>

		<button type="submit">
			Send OTP
		</button>

		<div class="back">
			Remember your password?
			<a href="login.jsp">Back to Login</a>
		</div>

	</form>

</div>

</body>
</html>