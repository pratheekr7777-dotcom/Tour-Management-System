<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Forgot Password | Explore Tours</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>

/* ================= GLOBAL ================= */

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

	background:
		linear-gradient(rgba(15, 32, 39, .65), rgba(15, 32, 39, .65)),
		url("images/tour1.jpg");

	background-size: cover;
	background-position: center;
	background-attachment: fixed;

	animation: zoom 15s infinite alternate;
}


/* ================= ANIMATIONS ================= */

@keyframes zoom {

	from {
		background-size: 100%;
	}

	to {
		background-size: 115%;
	}

}

@keyframes fadeUp {

	from {
		opacity: 0;
		transform: translateY(35px);
	}

	to {
		opacity: 1;
		transform: translateY(0);
	}

}

@keyframes fadeDown {

	from {
		opacity: 0;
		transform: translateY(-25px);
	}

	to {
		opacity: 1;
		transform: translateY(0);
	}

}

@keyframes spin {

	to {
		transform: rotate(360deg);
	}

}


/* ================= CONTAINER ================= */

.container {

	width: 100%;
	max-width: 520px;

	padding: 40px;

	border-radius: 25px;

	background: rgba(255, 255, 255, .12);

	-webkit-backdrop-filter: blur(20px);
	backdrop-filter: blur(20px);

	border: 1px solid rgba(255, 255, 255, .25);

	box-shadow: 0 20px 45px rgba(0, 0, 0, .35);

	animation: fadeUp .9s ease;

}


/* ================= LOGO ================= */

.logo {

	font-size: 36px;
	font-weight: 700;

	color: white;

	text-align: center;

	margin-bottom: 8px;

	animation: fadeDown .8s ease;

}

.logo span {

	color: #38ef7d;

}


/* ================= SUBTITLE ================= */

.subtitle {

	text-align: center;

	color: #ddd;

	font-family: cursive;

	margin-bottom: 30px;

	line-height: 1.6;

	animation: fadeDown 1s ease;

}


/* ================= INFO BOX ================= */

.info {

	margin-bottom: 25px;

	padding: 14px 16px;

	border-radius: 12px;

	background: rgba(255, 255, 255, .08);

	border: 1px solid rgba(255, 255, 255, .12);

	color: #e5e5e5;

	font-size: 14px;

	text-align: center;

	line-height: 1.6;

	opacity: 0;

	animation: fadeUp .7s ease forwards;

	animation-delay: .2s;

}


/* ================= FORM ================= */

.form-group {

	margin-bottom: 22px;

	opacity: 0;

	animation: fadeUp .7s ease forwards;

	animation-delay: .4s;

}

.form-group label {

	display: block;

	margin-bottom: 8px;

	color: white;

	font-weight: 500;

}


/* ================= INPUT ================= */

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

input::placeholder {

	color: rgba(255, 255, 255, .65);

}

input:focus {

	background: rgba(255, 255, 255, .18);

	border-color: #38ef7d;

	box-shadow: 0 0 15px rgba(56, 239, 125, .35);

}


/* ================= SEND OTP BUTTON ================= */

.send-btn {

	width: 100%;

	min-height: 54px;

	padding: 15px;

	display: flex;
	align-items: center;
	justify-content: center;

	gap: 10px;

	border: none;

	border-radius: 30px;

	background: linear-gradient(45deg, #00c6ff, #0072ff);

	color: white;

	font-size: 18px;

	font-weight: 600;

	cursor: pointer;

	transition: .3s;

	opacity: 0;

	animation: fadeUp .8s ease forwards;

	animation-delay: .6s;

}

.send-btn:hover {

	transform: translateY(-4px);

	box-shadow: 0 15px 25px rgba(0, 0, 0, .35);

}

.send-btn:disabled {

	cursor: not-allowed;

	opacity: .75;

	transform: none;

}


/* ================= BUTTON LOADER ================= */

.button-loader {

	display: none;

	width: 20px;
	height: 20px;

	border: 3px solid rgba(255, 255, 255, .35);

	border-top-color: white;

	border-radius: 50%;

	animation: spin .7s linear infinite;

}


/* ================= BACK TO LOGIN ================= */

.back {

	margin-top: 25px;

	text-align: center;

	color: white;

	font-size: 14px;

	opacity: 0;

	animation: fadeUp .8s ease forwards;

	animation-delay: .8s;

}

.back a {

	color: #38ef7d;

	text-decoration: none;

	font-weight: 600;

	margin-left: 4px;

}

.back a:hover {

	text-decoration: underline;

}


/* ================= TOAST ================= */

.toast {

	position: fixed;

	top: 25px;
	right: 25px;

	width: min(390px, calc(100% - 30px));

	padding: 16px 18px;

	display: flex;

	align-items: center;

	gap: 14px;

	background: rgba(20, 30, 35, .92);

	-webkit-backdrop-filter: blur(20px);
	backdrop-filter: blur(20px);

	border: 1px solid rgba(255, 100, 100, .35);

	border-left: 4px solid #ff5c5c;

	border-radius: 14px;

	box-shadow: 0 15px 40px rgba(0, 0, 0, .35);

	z-index: 9999;

	opacity: 0;

	visibility: hidden;

	transform: translateX(120%);

	transition: .45s ease;

}

.toast.show {

	opacity: 1;

	visibility: visible;

	transform: translateX(0);

}

.toast-icon {

	width: 36px;
	height: 36px;

	flex-shrink: 0;

	display: flex;

	align-items: center;

	justify-content: center;

	border-radius: 50%;

	background: rgba(255, 92, 92, .18);

	color: #ff8080;

	font-size: 20px;

	font-weight: 700;

}

.toast-content {

	flex: 1;

}

.toast-title {

	color: white;

	font-size: 15px;

	font-weight: 600;

}

.toast-message {

	margin-top: 2px;

	color: rgba(255, 255, 255, .75);

	font-size: 13px;

	line-height: 1.5;

}

.toast-close {

	width: auto;

	padding: 5px;

	margin: 0;

	border: none;

	background: transparent;

	color: rgba(255, 255, 255, .7);

	font-size: 22px;

	line-height: 1;

	cursor: pointer;

}

.toast-close:hover {

	transform: none;

	box-shadow: none;

	color: white;

}


/* ================= TABLET ================= */

@media (max-width: 768px) {

	body {

		padding: 25px 15px;

		background-attachment: scroll;

	}

	.container {

		max-width: 500px;

		padding: 35px 30px;

	}

}


/* ================= MOBILE ================= */

@media (max-width: 600px) {

	body {

		padding: 20px 15px;

		background-size: cover;

		background-position: center;

		background-repeat: no-repeat;

		background-attachment: scroll;

		animation: none;

	}

	.container {

		width: 100%;

		padding: 30px 22px;

		border-radius: 20px;

	}

	.logo {

		font-size: 28px;

	}

	.subtitle {

		font-size: 14px;

		margin-bottom: 25px;

	}

	.info {

		font-size: 13px;

	}

	input {

		font-size: 16px;

	}

	.send-btn {

		font-size: 16px;

	}

	.toast {

		top: 15px;

		right: 15px;

		left: 15px;

		width: auto;

	}

}


/* ================= SMALL MOBILE ================= */

@media (max-width: 400px) {

	.container {

		padding: 25px 18px;

	}

	.logo {

		font-size: 26px;

	}

	.subtitle {

		font-size: 13px;

	}

	.info {

		font-size: 12px;

	}

}

</style>

</head>

<body>

<%
String error = (String) request.getAttribute("error");
%>

<!-- ================= ERROR TOAST ================= -->

<div id="toast" class="toast">

```
<div class="toast-icon">
	!
</div>

<div class="toast-content">

	<div class="toast-title">
		Unable to Send OTP
	</div>

	<div
		id="toastMessage"
		class="toast-message">
	</div>

</div>

<button
	type="button"
	class="toast-close"
	onclick="closeToast()">

	×

</button>
```

</div>

<!-- ================= FORGOT PASSWORD CARD ================= -->

<div class="container">

```
<!-- LOGO -->

<div class="logo">

	Explore <span>Tours</span>

</div>


<!-- SUBTITLE -->

<div class="subtitle">

	Forgot your password?<br>

	Enter your registered email to receive a verification OTP.

</div>


<!-- INFO -->

<div class="info">

	An OTP will be sent to your registered email address.

</div>


<!-- FORM -->

<form
	action="forgotPassword"
	method="post"
	onsubmit="showLoading()">


	<!-- EMAIL -->

	<div class="form-group">

		<label for="uemail">

			Registered Email

		</label>

		<input
			type="email"
			id="uemail"
			name="uemail"
			value="<%=request.getParameter("uemail") != null ? request.getParameter("uemail") : ""%>"
			placeholder="example@gmail.com"
			required>

	</div>


	<!-- SEND OTP BUTTON -->

	<button
		type="submit"
		id="sendBtn"
		class="send-btn">

		<span id="buttonText">

			Send OTP

		</span>

		<span
			id="buttonLoader"
			class="button-loader">
		</span>

	</button>


	<!-- BACK TO LOGIN -->

	<div class="back">

		Remember your password?

		<a href="login.jsp">

			Back to Login

		</a>

	</div>


</form>
```

</div>

<script>


/* ================= BUTTON LOADING ================= */

function showLoading() {

	const sendBtn =
		document.getElementById("sendBtn");

	const buttonText =
		document.getElementById("buttonText");

	const buttonLoader =
		document.getElementById("buttonLoader");


	sendBtn.disabled = true;

	buttonText.textContent = "Sending OTP...";

	buttonLoader.style.display = "block";

}


/* ================= SHOW TOAST ================= */

function showToast(message) {

	const toast =
		document.getElementById("toast");

	const toastMessage =
		document.getElementById("toastMessage");


	toastMessage.textContent = message;

	toast.classList.add("show");


	setTimeout(function() {

		closeToast();

	}, 4000);

}


/* ================= CLOSE TOAST ================= */

function closeToast() {

	document
		.getElementById("toast")
		.classList
		.remove("show");

}


/* ================= SERVER ERROR ================= */

<%
if (error != null) {
%>

showToast("<%=error.replace("\\", "\\\\")
		.replace("\"", "\\\"")
		.replace("\r", "")
		.replace("\n", "\\n")%>");

<%
}
%>


</script>

</body>
</html>
