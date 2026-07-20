<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Reset Password | Explore Tours</title>

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

	animation: fadeUp .9s ease;

}


/* ================= LOGO ================= */

.logo {

	text-align: center;

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

	text-align: center;

	color: #ddd;

	font-family: cursive;

	margin-bottom: 30px;

	animation: fadeDown 1s ease;

}


/* ================= FORM ================= */

.form-group {

	margin-bottom: 22px;

	opacity: 0;

	animation: fadeUp .7s ease forwards;

}

.form-group:nth-child(1) {

	animation-delay: .2s;

}

.form-group:nth-child(2) {

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

	padding: 14px 50px 14px 16px;

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


/* ================= PASSWORD WRAPPER ================= */

.password-wrapper {

	position: relative;

	width: 100%;

}

.toggle-password {

	position: absolute;

	right: 16px;

	top: 50%;

	transform: translateY(-50%);

	width: auto;

	padding: 0;

	margin: 0;

	border: none;

	background: transparent;

	color: white;

	font-size: 20px;

	cursor: pointer;

	opacity: 1;

	animation: none;

	box-shadow: none;

}

.toggle-password:hover {

	transform: translateY(-50%) scale(1.1);

	box-shadow: none;

}


/* ================= PASSWORD STRENGTH ================= */

.password-strength {

	width: 100%;

	height: 5px;

	margin-top: 8px;

	background: rgba(255, 255, 255, .15);

	border-radius: 10px;

	overflow: hidden;

}

#strengthBar {

	width: 0;

	height: 100%;

	border-radius: 10px;

	transition: width .4s ease, background .4s ease;

}

#strengthText {

	margin-top: 5px;

	font-size: 12px;

	min-height: 18px;

}


/* ================= PASSWORD ERROR ================= */

.error {

	display: none;

	color: #ff8080;

	font-size: 13px;

	margin-top: 7px;

}


/* ================= UPDATE BUTTON ================= */

.update-btn {

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

.update-btn:hover {

	transform: translateY(-4px);

	box-shadow: 0 15px 25px rgba(0, 0, 0, .35);

}

.update-btn:disabled {

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

	input {

		font-size: 16px;

	}

	.update-btn {

		font-size: 16px;

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

}

</style>

</head>

<body>

<div class="container">

```
<!-- ================= LOGO ================= -->

<div class="logo">

	Explore <span>Tours</span>

</div>


<!-- ================= SUBTITLE ================= -->

<div class="subtitle">

	Create a strong new password for your account

</div>


<!-- ================= FORM ================= -->

<form
	action="resetPassword"
	method="post"
	onsubmit="return validatePassword()">


	<!-- NEW PASSWORD -->

	<div class="form-group">

		<label for="password">

			New Password

		</label>


		<div class="password-wrapper">

			<input
				type="password"
				id="password"
				name="password"
				placeholder="Enter your new password"
				minlength="8"
				required>


			<button
				type="button"
				class="toggle-password"
				onclick="togglePassword('password', this)">

				👁

			</button>

		</div>


		<!-- PASSWORD STRENGTH -->

		<div class="password-strength">

			<div id="strengthBar"></div>

		</div>


		<div id="strengthText"></div>

	</div>


	<!-- CONFIRM PASSWORD -->

	<div class="form-group">

		<label for="confirmPassword">

			Confirm Password

		</label>


		<div class="password-wrapper">

			<input
				type="password"
				id="confirmPassword"
				placeholder="Re-enter your new password"
				required>


			<button
				type="button"
				class="toggle-password"
				onclick="togglePassword('confirmPassword', this)">

				👁

			</button>

		</div>


		<div
			class="error"
			id="passwordError">

			Passwords do not match.

		</div>

	</div>


	<!-- UPDATE BUTTON -->

	<button
		type="submit"
		id="updateBtn"
		class="update-btn">

		<span id="buttonText">

			Update Password

		</span>


		<span
			id="buttonLoader"
			class="button-loader">
		</span>

	</button>


</form>
```

</div>

<script>


/* ================= SHOW / HIDE PASSWORD ================= */

function togglePassword(inputId, button) {

	const input =
		document.getElementById(inputId);


	if (input.type === "password") {

		input.type = "text";

		button.textContent = "🙈";

	} else {

		input.type = "password";

		button.textContent = "👁";

	}

}


/* ================= PASSWORD STRENGTH ================= */

const passwordInput =
	document.getElementById("password");

const strengthBar =
	document.getElementById("strengthBar");

const strengthText =
	document.getElementById("strengthText");


passwordInput.addEventListener("input", function() {

	const password = this.value;

	let strength = 0;


	if (password.length >= 8)
		strength++;

	if (/[A-Z]/.test(password))
		strength++;

	if (/[a-z]/.test(password))
		strength++;

	if (/[0-9]/.test(password))
		strength++;

	if (/[^A-Za-z0-9]/.test(password))
		strength++;


	if (password.length === 0) {

		strengthBar.style.width = "0";

		strengthText.textContent = "";

		return;

	}


	if (strength <= 2) {

		strengthBar.style.width = "33%";

		strengthBar.style.background = "#ff4d4d";

		strengthText.textContent = "Weak password";

		strengthText.style.color = "#ff8080";

	}

	else if (strength <= 4) {

		strengthBar.style.width = "66%";

		strengthBar.style.background = "#ffc107";

		strengthText.textContent = "Medium password";

		strengthText.style.color = "#ffd54f";

	}

	else {

		strengthBar.style.width = "100%";

		strengthBar.style.background = "#38ef7d";

		strengthText.textContent = "Strong password";

		strengthText.style.color = "#38ef7d";

	}

});


/* ================= LIVE PASSWORD MATCH ================= */

document
	.getElementById("confirmPassword")
	.addEventListener("input", function() {


		const password =
			document.getElementById("password").value;


		const confirmPassword =
			this.value;


		const error =
			document.getElementById("passwordError");


		if (confirmPassword.length === 0) {

			error.style.display = "none";

			this.style.borderColor =
				"rgba(255,255,255,.25)";

			return;

		}


		if (password === confirmPassword) {

			error.style.display = "none";

			this.style.borderColor = "#38ef7d";

		}

		else {

			error.style.display = "block";

			this.style.borderColor = "#ff4d4d";

		}

});


/* ================= VALIDATE FORM ================= */

function validatePassword() {


	const password =
		document.getElementById("password").value;


	const confirmPassword =
		document.getElementById("confirmPassword").value;


	const error =
		document.getElementById("passwordError");


	if (password !== confirmPassword) {

		error.style.display = "block";

		return false;

	}


	error.style.display = "none";


	/* SHOW LOADING STATE */

	const updateBtn =
		document.getElementById("updateBtn");


	const buttonText =
		document.getElementById("buttonText");


	const buttonLoader =
		document.getElementById("buttonLoader");


	updateBtn.disabled = true;

	buttonText.textContent = "Updating Password...";

	buttonLoader.style.display = "block";


	return true;

}

</script>

</body>
</html>
