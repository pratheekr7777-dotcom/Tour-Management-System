<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Account</title>

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
	overflow-x: hidden;
	background: linear-gradient(rgba(15, 32, 39, .65), rgba(15, 32, 39, .65)),
		url("images/tour1.jpg");
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
	animation: zoom 15s infinite alternate;
}

@keyframes zoom {
from { 
background-size:100%;
	
}

to {
	background-size: 115%;
}

}
@keyframes fadeUp {from { opacity:0;
	transform: translateY(35px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@keyframes fadeDown {from { opacity:0;
	transform: translateY(-25px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.container {
	width: min(560px, 100%);
	padding: 40px;
	border-radius: 25px;
	background: rgba(255, 255, 255, .12);
	backdrop-filter: blur(20px);
	border: 1px solid rgba(255, 255, 255, .25);
	box-shadow: 0 20px 45px rgba(0, 0, 0, .35);
	animation: fadeUp .9s ease;
}

.logo {
	font-size: 36px;
	text-align: center;
	font-weight: 700;
	color: white;
	margin-bottom: 8px;
	animation: fadeDown .8s ease;
}

.logo span {
	color: #38ef7d;
}

.subtitle {
	text-align: center;
	color: #ddd;
	font-family: cursive;
	margin-bottom: 30px;
	animation: fadeDown 1s ease;
}

.form-group {
	margin-bottom: 18px;
	opacity: 0;
	animation: fadeUp .7s ease forwards;
}

.form-group:nth-child(1) {
	animation-delay: .2s;
}

.form-group:nth-child(2) {
	animation-delay: .3s;
}

.form-group:nth-child(3) {
	animation-delay: .4s;
}

.form-group:nth-child(4) {
	animation-delay: .5s;
}

.form-group:nth-child(5) {
	animation-delay: .6s;
}

.form-group:nth-child(6) {
	animation-delay: .7s;
}

.form-group:nth-child(7) {
	animation-delay: .8s;
}

.form-group:nth-child(8) {
	animation-delay: .9s;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	color: white;
	font-weight: 500;
}

/* INPUTS */
input:not([type="radio"]), textarea, select {
	width: 100%;
	padding: 14px 16px;
	border-radius: 12px;
	border: 1px solid rgba(255, 255, 255, .25);
	background: rgba(255, 255, 255, .08);
	color: white;
	outline: none;
	font-size: 15px;
	transition: .3s;
}

input:not([type="radio"]):focus, textarea:focus, select:focus {
	background: rgba(255, 255, 255, .18);
	border-color: #38ef7d;
	box-shadow: 0 0 15px rgba(56, 239, 125, .35);
}

input::placeholder, textarea::placeholder {
	color: rgba(255, 255, 255, .65);
}

textarea {
	resize: none;
}

select {
	cursor: pointer;
}

select option {
	background: #203a43;
	color: white;
}

input[type="date"] {
	color: white;
}

input[type="date"]::-webkit-calendar-picker-indicator {
	filter: invert(1);
	cursor: pointer;
}

/* RADIO */
.gender {
	display: flex;
	gap: 35px;
	margin-top: 10px;
}

.gender label {
	display: flex;
	align-items: center;
	gap: 8px;
	cursor: pointer;
	color: white;
	font-weight: 400;
	margin: 0;
}

.gender input[type="radio"] {
	width: 18px;
	height: 18px;
	accent-color: #38ef7d;
}
/* PASSWORD FIELD */
.password-wrapper {
	position: relative;
	width: 100%;
}

.password-wrapper input {
	padding-right: 50px;
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
	z-index: 2;
}

.toggle-password:hover {
	transform: translateY(-50%) scale(1.1);
	box-shadow: none;
}

/* PASSWORD STRENGTH */
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

/* BUTTON */
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
	margin-top: 10px;
	opacity: 0;
	animation: fadeUp .8s ease forwards;
	animation-delay: 1s;
}

button:hover {
	transform: translateY(-4px);
	box-shadow: 0 15px 25px rgba(0, 0, 0, .35);
}
#registerBtn {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
	min-height: 54px;
}

#registerBtn:disabled {
	cursor: not-allowed;
	opacity: .75;
	transform: none;
}

.button-loader {
	display: none;
	width: 20px;
	height: 20px;
	border: 3px solid rgba(255, 255, 255, .35);
	border-top-color: white;
	border-radius: 50%;
	animation: spin .7s linear infinite;
}

@keyframes spin {
	to {
		transform: rotate(360deg);
	}
}
.error {
	display: none;
	font-size: 13px;
	color: #ff8080;
	margin-top: 6px;
}

.login {
	margin-top: 20px;
	text-align: center;
	color: white;
}

.login a {
	color: #38ef7d;
	text-decoration: none;
	font-weight: 600;
}

.login a:hover {
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
	opacity: 1;
	animation: none;
	box-shadow: none;
}

.toast-close:hover {
	transform: none;
	box-shadow: none;
	color: white;
}

/* ================= TABLET ================= */
@media ( max-width :768px) {
	body {
		padding: 25px 15px;
		background-attachment: scroll;
	}
	.container {
		width: 100%;
		max-width: 95%;
		padding: 30px;
		border-radius: 20px;
	}
	.logo {
		font-size: 30px;
	}
	.subtitle {
		font-size: 14px;
	}
	input:not([type="radio"]), textarea, select {
		padding: 13px 15px;
		font-size: 14px;
	}
	button {
		font-size: 16px;
		padding: 14px;
	}
}

/* ================= MOBILE ================= */
@media (max-width: 600px) {

    body {
        min-height: 100vh;
        padding: 20px 12px;
        align-items: flex-start;

        /* Keep background centered and cover full screen */
        background-size: cover;
        background-position: center center;
        background-repeat: no-repeat;
        background-attachment: scroll;

        /* Disable desktop zoom animation */
        animation: none;
    }

    .container {
        width: 100%;
        max-width: 100%;
        padding: 25px 18px;
        margin: 30px 30px;
        border-radius: 18px;
    }

    .logo {
        font-size: 28px;
    }

    .subtitle {
        font-size: 14px;
        margin-bottom: 25px;
    }

    .form-group label {
        font-size: 14px;
    }

    input:not([type="radio"]),
    textarea,
    select {
        width: 100%;
        font-size: 16px; /* prevents mobile input zoom */
        padding: 14px;
    }

    .gender {
        flex-direction: row;
        flex-wrap: wrap;
        gap: 15px;
    }

    button {
        font-size: 16px;
        padding: 14px;
    }

    .login {
        font-size: 14px;
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

    body {
        padding: 12px 8px;
    }

    .container {
        padding: 22px 15px;
        margin: 20px 20px;
    }

    .logo {
        font-size: 25px;
    }

    .subtitle {
        font-size: 13px;
    }

    /* Keep 16px to prevent zoom */
    input:not([type="radio"]),
    textarea,
    select {
        font-size: 16px;
        padding: 13px;
    }

    button {
        font-size: 16px;
        padding: 13px;
    }

    .login {
        font-size: 13px;
    }
}
</style>

</head>

<body>
	<%
	String error = (String) request.getAttribute("error");
	%>

	<div id="toast" class="toast">
		<div class="toast-icon">!</div>

		<div class="toast-content">
			<div class="toast-title">Registration Error</div>
			<div id="toastMessage" class="toast-message"></div>
		</div>

		<button type="button" class="toast-close" onclick="closeToast()">×</button>
	</div>
	<div class="container">

		<div class="logo">
			Explore <span>Tours</span>
		</div>

		<div class="subtitle">Create your account and start your next
			adventure</div>

		<form action="register" method="post" onsubmit="return validateForm()">

			<!-- FULL NAME -->
			<div class="form-group">
				<label for="uname">Full Name</label> <input type="text" id="uname"
					name="uname"
					value="<%=request.getParameter("uname") != null ? request.getParameter("uname") : ""%>"
					placeholder="Enter your full name" required>
			</div>


			<!-- EMAIL -->
			<div class="form-group">
				<label for="uemail">Email</label> <input type="email" id="uemail"
					name="uemail"
					value="<%=request.getParameter("uemail") != null ? request.getParameter("uemail") : ""%>"
					placeholder="example@gmail.com" required>
			</div>


			<!-- PHONE -->
			<div class="form-group">
				<label for="uphone">Phone Number</label> <input type="tel"
					id="uphone" name="uphone"
					value="<%=request.getParameter("uphone") != null ? request.getParameter("uphone") : ""%>"
					maxlength="10" placeholder="9876543210" required>
			</div>


			<!-- PASSWORD -->
			<div class="form-group">

				<label for="password">Password</label>

				<div class="password-wrapper">

					<input type="password" id="password" name="upswd"
						placeholder="Enter password" minlength="8" required>

					<button type="button" class="toggle-password"
						onclick="togglePassword('password', this)">👁</button>

				</div>

				<div class="password-strength">
					<div id="strengthBar"></div>
				</div>

				<div id="strengthText"></div>

			</div>


			<!-- CONFIRM PASSWORD -->
			<div class="form-group">

				<label for="confirmPassword">Confirm Password</label>

				<div class="password-wrapper">

					<input type="password" id="confirmPassword" name="cnfpswd"
						placeholder="Re-enter password" required>

					<button type="button" class="toggle-password"
						onclick="togglePassword('confirmPassword', this)">👁</button>

				</div>

				<div class="error" id="passwordError">Passwords do not match.
				</div>

			</div>


			<!-- GENDER -->

			<%
			String selectedGender = request.getParameter("ugender");
			%>

			<div class="form-group">

				<label>Gender</label>

				<div class="gender">

					<label> <input type="radio" name="ugender" value="Male"
						<%="Male".equals(selectedGender) ? "checked" : ""%> required>
						Male
					</label> <label> <input type="radio" name="ugender" value="Female"
						<%="Female".equals(selectedGender) ? "checked" : ""%>>
						Female
					</label> <label> <input type="radio" name="ugender" value="Other"
						<%="Other".equals(selectedGender) ? "checked" : ""%>>
						Other
					</label>

				</div>

			</div>


			<!-- DATE OF BIRTH -->
			<div class="form-group">

				<label for="udob">Date of Birth</label> <input type="date" id="udob"
					name="udob"
					value="<%=request.getParameter("udob") != null ? request.getParameter("udob") : ""%>"
					required>

			</div>


			<!-- ADDRESS -->
			<div class="form-group">

				<label for="uaddress">Address *</label>

				<textarea id="uaddress" name="uaddress" rows="4"
					placeholder="Enter your address" required><%=request.getParameter("uaddress") != null ? request.getParameter("uaddress") : ""%></textarea>

			</div>


			<!-- REGISTER BUTTON -->
			<button type="submit" id="registerBtn">

				<span id="buttonText"> Register </span> <span id="buttonLoader"
					class="button-loader"> </span>

			</button>


			<!-- LOGIN LINK -->
			<div class="login">

				Already have an account? <a href="login.jsp"> Login </a>

			</div>

		</form>
	</div>

	<script>
		function validateForm() {

			const password = document.getElementById("password").value;

			const confirmPassword = document.getElementById("confirmPassword").value;

			const error = document.getElementById("passwordError");

			if (password !== confirmPassword) {

				error.style.display = "block";

				return false;
			}

			error.style.display = "none";

			const registerBtn = document.getElementById("registerBtn");

			const buttonText = document.getElementById("buttonText");

			const buttonLoader = document.getElementById("buttonLoader");

			// Prevent multiple submissions
			registerBtn.disabled = true;

			// Change button UI
			buttonText.textContent = "Creating Account...";
			buttonLoader.style.display = "block";

			return true;
		}

		document.getElementById("confirmPassword").addEventListener("keyup",
				function() {

					let password = document.getElementById("password").value;

					let confirmPassword = this.value;

					let error = document.getElementById("passwordError");

					if (confirmPassword.length === 0) {

						error.style.display = "none";

						this.style.borderColor = "rgba(255,255,255,.25)";

						return;

					}

					if (password === confirmPassword) {

						error.style.display = "none";

						this.style.borderColor = "#38ef7d";

					} else {

						error.style.display = "block";

						this.style.borderColor = "#ff4d4d";

					}

				});

		document.getElementById("uphone").addEventListener("input", function() {

			this.value = this.value.replace(/[^0-9]/g, "");

		});
		/* SHOW / HIDE PASSWORD */

		function togglePassword(inputId, button) {

			const input = document.getElementById(inputId);

			if (input.type === "password") {

				input.type = "text";
				button.textContent = "🙈";

			} else {

				input.type = "password";
				button.textContent = "👁";

			}
		}

		/* PASSWORD STRENGTH */

		const passwordInput = document.getElementById("password");

		const strengthBar = document.getElementById("strengthBar");

		const strengthText = document.getElementById("strengthText");

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

			} else if (strength <= 4) {

				strengthBar.style.width = "66%";
				strengthBar.style.background = "#ffc107";

				strengthText.textContent = "Medium password";
				strengthText.style.color = "#ffd54f";

			} else {

				strengthBar.style.width = "100%";
				strengthBar.style.background = "#38ef7d";

				strengthText.textContent = "Strong password";
				strengthText.style.color = "#38ef7d";

			}

		});

		/* SET MAXIMUM DOB TO EXACTLY 18 YEARS AGO */

		const today = new Date();

		const maxYear = today.getFullYear() - 18;
		const maxMonth = String(today.getMonth() + 1).padStart(2, "0");
		const maxDay = String(today.getDate()).padStart(2, "0");

		document.getElementById("udob").max = maxYear + "-" + maxMonth + "-"
				+ maxDay;
		function showToast(message) {

			const toast = document.getElementById("toast");
			const toastMessage = document.getElementById("toastMessage");

			toastMessage.textContent = message;
			toast.classList.add("show");

			setTimeout(function() {
				closeToast();
			}, 4000);
		}
		function closeToast() {

			document.getElementById("toast").classList.remove("show");
		}
	<%
if (error != null) {
%>

showToast("<%= error.replace("\\", "\\\\")
                   .replace("\"", "\\\"")
                   .replace("\r", "")
                   .replace("\n", "\\n") %>");

<%
}
%>
</script>

</body>

</html>