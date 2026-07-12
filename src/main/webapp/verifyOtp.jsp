<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verify OTP</title>

<style>
body{
	font-family:Poppins,sans-serif;
	background:#1b2a32;
	color:white;
	display:flex;
	justify-content:center;
	align-items:center;
	height:100vh;
}

.container{
	width:400px;
	padding:30px;
	border-radius:15px;
	background:rgba(255,255,255,.1);
	backdrop-filter:blur(10px);
	text-align:center;
}

input{
	width:100%;
	padding:12px;
	margin:15px 0;
	border-radius:8px;
	border:none;
	font-size:16px;
}

button{
	width:100%;
	padding:12px;
	background:#00c6ff;
	color:white;
	border:none;
	border-radius:8px;
	font-size:17px;
	cursor:pointer;
}
</style>

</head>
<body>

<div class="container">

	<h2>Verify OTP</h2>

	<p>Your OTP has been generated.</p>

	<input
		type="text"
		id="userOtp"
		placeholder="Enter OTP">

	<button onclick="verifyOtp()">
		Verify OTP
	</button>

</div>

<script>

const generatedOtp =
Math.floor(100000 + Math.random() * 900000);

alert("Generated OTP : " + generatedOtp);

function verifyOtp(){

	let enteredOtp =
	document.getElementById("userOtp").value;

	if(enteredOtp == generatedOtp){

		alert("OTP Verified Successfully");

		window.location.href="resetPassword.jsp";

	}
	else{

		alert("Invalid OTP");

	}

}

</script>

</body>
</html>