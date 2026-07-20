<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Verify OTP | Explore Tours</title>

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
	max-width: 500px;

	padding: 40px;

	border-radius: 25px;

	background: rgba(255, 255, 255, .12);

	-webkit-backdrop-filter: blur(20px);
	backdrop-filter: blur(20px);

	border: 1px solid rgba(255, 255, 255, .25);

	box-shadow: 0 20px 45px rgba(0, 0, 0, .35);

	text-align: center;

	animation: fadeUp .9s ease;

}


/* ================= LOGO ================= */

.logo {

	font-size: 36px;

	font-weight: 700;

	color: white;

	margin-bottom: 8px;

	animation: fadeDown .8s ease;

}

.logo span {

	color: #38ef7d;

}


/* ================= SUBTITLE ================= */

.subtitle {

	color: #ddd;

	font-family: cursive;

	margin-bottom: 25px;

	line-height: 1.6;

	animation: fadeDown 1s ease;

}


/* ================= INFO ================= */

.info {

	padding: 14px 16px;

	margin-bottom: 25px;

	border-radius: 12px;

	background: rgba(255, 255, 255, .08);

	border: 1px solid rgba(255, 255, 255, .12);

	color: #e5e5e5;

	font-size: 14px;

	line-height: 1.6;

	opacity: 0;

	animation: fadeUp .7s ease forwards;

	animation-delay: .2s;

}


/* ================= OTP GROUP ================= */

.otp-group {

	margin-bottom: 22px;

	opacity: 0;

	animation: fadeUp .7s ease forwards;

	animation-delay: .4s;

}

.otp-group label {

	display: block;

	margin-bottom: 10px;

	color: white;

	font-weight: 500;

	text-align: left;

}


/* ================= OTP INPUT ================= */

.otp-input {

	width: 100%;

	padding: 15px 16px;

	border-radius: 12px;

	border: 1px solid rgba(255, 255, 255, .25);

	background: rgba(255, 255, 255, .08);

	color: white;

	font-size: 22px;

	font-weight: 600;

	text-align: center;

	letter-spacing: 8px;

	outline: none;

	transition: .3s;

}

.otp-input::placeholder {

	color: rgba(255, 255, 255, .45);

	font-size: 15px;

	font-weight: 400;

	letter-spacing: 1px;

}

.otp-input:focus {

	background: rgba(255, 255, 255, .18);

	border-color: #38ef7d;

	box-shadow: 0 0 15px rgba(56, 239, 125, .35);

}


/* ================= ERROR ================= */

.error {

	display: none;

	margin-top: 8px;

	color: #ff8080;

	font-size: 13px;

	text-align: left;

}


/* ================= VERIFY BUTTON ================= */

.verify-btn {

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

	font-size: 17px;

	font-weight: 600;

	cursor: pointer;

	transition: .3s;

	opacity: 0;

	animation: fadeUp .8s ease forwards;

	animation-delay: .6s;

}

.verify-btn:hover {

	transform: translateY(-4px);

	box-shadow: 0 15px 25px rgba(0, 0, 0, .35);

}

.verify-btn:disabled {

	cursor: not-allowed;

	opacity: .75;

	transform: none;

}


/* ================= LOADER ================= */

.button-loader {

	display: none;

	width: 20px;

	height: 20px;

	border: 3px solid rgba(255, 255, 255, .35);

	border-top-color: white;

	border-radius: 50%;

	animation: spin .7s linear infinite;

}


/* ================= RESEND ================= */

.resend {

	margin-top: 25px;

	color: white;

	font-size: 14px;

	opacity: 0;

	animation: fadeUp .8s ease forwards;

	animation-delay: .8s;

}

.resend a {

	color: #38ef7d;

	text-decoration: none;

	font-weight: 600;

}

.resend a:hover {

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

	text-align: left;

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

}

.toast-close {

	width: auto;

	padding: 5px;

	margin: 0;

	border: none;

	background: transparent;

	color: rgba(255, 255, 255, .7);

	font-size: 22px;

	cursor: pointer;

}

.toast-close:hover {

	color: white;

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

	}

	.info {

		font-size: 13px;

	}

	.otp-input {

		font-size: 20px;

	}

	.verify-btn {

		font-size: 16px;

	}

	.toast {

		top: 15px;

		left: 15px;

		right: 15px;

		width: auto;

	}

}

</style>

</head>

<body>

<!-- ================= ERROR TOAST ================= -->

<div id="toast" class="toast">

```
<div class="toast-icon">

	!

</div>

<div class="toast-content">

	<div class="toast-title">

		Invalid OTP

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

<!-- ================= OTP CONTAINER ================= -->

<div class="container">

```
<!-- LOGO -->

<div class="logo">

	Explore <span>Tours</span>

</div>


<!-- SUBTITLE -->

<div class="subtitle">

	Verify your identity to continue

</div>


<!-- INFO -->

<div class="info">

	We've sent a 6-digit verification code to your registered email address.

</div>


<!-- OTP INPUT -->

<div class="otp-group">

	<label for="userOtp">

		Enter Verification Code

	</label>


	<input
		type="text"
		id="userOtp"
		class="otp-input"
		placeholder="Enter 6-digit OTP"
		inputmode="numeric"
		maxlength="6"
		autocomplete="one-time-code">


	<div
		id="otpError"
		class="error">

		Please enter a valid 6-digit OTP.

	</div>

</div>


<!-- VERIFY BUTTON -->

<button
	type="button"
	id="verifyBtn"
	class="verify-btn"
	onclick="verifyOtp()">


	<span id="buttonText">

		Verify OTP

	</span>


	<span
		id="buttonLoader"
		class="button-loader">

	</span>


</button>


<!-- RESEND -->

<div class="resend">

	Didn't receive the OTP?

	<a href="forgotPassword.jsp">

		Send Again

	</a>

</div>
```

</div>

<script>


/*
 * TEMPORARY OTP GENERATION
 *
 * This keeps your current implementation working.
 * Later this should be removed and OTP verification
 * should happen inside a Java Servlet.
 */

const generatedOtp =
	Math.floor(100000 + Math.random() * 900000);


/*
 * TEMPORARY:
 * Remove this alert when OTP is sent through email.
 */

alert("Generated OTP : " + generatedOtp);


/* ================= ALLOW ONLY NUMBERS ================= */

const otpInput =
	document.getElementById("userOtp");


otpInput.addEventListener("input", function() {

	this.value =
		this.value.replace(/[^0-9]/g, "");

	const error =
		document.getElementById("otpError");


	if (this.value.length === 0) {

		error.style.display = "none";

		this.style.borderColor =
			"rgba(255,255,255,.25)";

		return;

	}


	if (this.value.length === 6) {

		error.style.display = "none";

		this.style.borderColor = "#38ef7d";

	}

	else {

		this.style.borderColor = "#ff4d4d";

	}

});


/* ================= VERIFY OTP ================= */

function verifyOtp() {


	const enteredOtp =
		document
			.getElementById("userOtp")
			.value;


	const error =
		document
			.getElementById("otpError");


	/* VALIDATE OTP LENGTH */

	if (enteredOtp.length !== 6) {

		error.style.display = "block";

		return;

	}


	error.style.display = "none";


	/* CHECK OTP */

	if (enteredOtp == generatedOtp) {


		const verifyBtn =
			document.getElementById("verifyBtn");


		const buttonText =
			document.getElementById("buttonText");


		const buttonLoader =
			document.getElementById("buttonLoader");


		verifyBtn.disabled = true;


		buttonText.textContent =
			"Verifying...";


		buttonLoader.style.display =
			"block";


		setTimeout(function() {

			window.location.href =
				"resetPassword.jsp";

		}, 800);

	}

	else {

		document
			.getElementById("userOtp")
			.style
			.borderColor = "#ff4d4d";


		showToast(
			"The verification code you entered is incorrect. Please try again."
		);

	}

}


/* ================= ENTER KEY ================= */

otpInput.addEventListener("keydown", function(event) {

	if (event.key === "Enter") {

		verifyOtp();

	}

});


/* ================= SHOW TOAST ================= */

function showToast(message) {


	const toast =
		document.getElementById("toast");


	const toastMessage =
		document.getElementById("toastMessage");


	toastMessage.textContent =
		message;


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

</script>

</body>
</html>
