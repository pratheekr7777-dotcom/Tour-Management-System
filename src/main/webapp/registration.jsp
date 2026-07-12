<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	background: linear-gradient(rgba(15, 32, 39, .65), rgba(15, 32, 39, .65)),
		url("images/tour1.jpg");
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
	animation: zoom 15s infinite alternate;
}

@
keyframes zoom {from { background-size:100%;
	
}

to {
	background-size: 115%;
}

}
.container {
	width: 100%;
	max-width: 560px;
	padding: 40px;
	border-radius: 25px;
	background: rgba(255, 255, 255, .12);
	backdrop-filter: blur(20px);
	border: 1px solid rgba(255, 255, 255, .25);
	box-shadow: 0 20px 45px rgba(0, 0, 0, .35);
}

.logo {
	font-size: 36px;
	text-align: center;
	font-weight: 700;
	color: #fff;
	margin-bottom: 8px;
}

.logo span {
	color: #38ef7d;
}

.subtitle {
	text-align: center;
	color: #ddd;
	font-family:cursive;
	margin-bottom: 30px;
}

.form-group {
	margin-bottom: 18px;
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
}

button:hover {
	transform: translateY(-4px);
	box-shadow: 0 15px 25px rgba(0, 0, 0, .35);
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

@media ( max-width :600px) {
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
String error = (String) request.getAttribute("error");

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

		<div class="subtitle">Create your account and start your next
			adventure</div>

		<form action="register" method="post" onsubmit="return validateForm()">

			<div class="form-group">
				<label for="uname">Full Name</label> <input type="text" id="uname"
					name="uname" placeholder="Enter your full name" required>
			</div>

			<div class="form-group">
				<label for="uemail">Email</label> <input type="email" id="uemail"
					name="uemail" placeholder="example@gmail.com" required>
			</div>

			<div class="form-group">
				<label for="uphone">Phone Number</label> <input type="tel"
					id="uphone" name="uphone" maxlength="10" placeholder="9876543210"
					required>
			</div>

			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					id="password" name="upswd" placeholder="Enter password" required>
			</div>

			<div class="form-group">
				<label for="confirmPassword">Confirm Password</label> <input
					type="password" id="confirmPassword" name="cnfpswd"
					placeholder="Re-enter password" required>

				<div class="error" id="passwordError">Passwords do not match.
				</div>
			</div>

			<div class="form-group">

				<label>Gender</label>

				<div class="gender">

					<label> <input type="radio" name="ugender" value="Male"
						required> Male
					</label> <label> <input type="radio" name="ugender" value="Female">
						Female
					</label> <label> <input type="radio" name="ugender" value="Other">
						Other
					</label>

				</div>

			</div>

			<div class="form-group">

				<label for="udob">Date of Birth</label> <input type="date" id="udob"
					name="udob">

			</div>

			<div class="form-group">

				<label for="uaddress">Address *</label>

				<textarea id="uaddress" name="uaddress" rows="4"
					placeholder="Enter your address"></textarea>

			</div>

			<button type="submit">Register</button>

			<div class="login">
				Already have an account? <a href="login.jsp">Login</a>
			</div>

		</form>

	</div>

	<script>

function validateForm(){

    let password =
        document.getElementById("password").value;

    let confirmPassword =
        document.getElementById("confirmPassword").value;

    let error =
        document.getElementById("passwordError");

    if(password !== confirmPassword){

        error.style.display = "block";

        return false;

    }

    error.style.display = "none";

    return true;

}

document.getElementById("confirmPassword")
.addEventListener("keyup",function(){

    let password =
        document.getElementById("password").value;

    let confirmPassword =
        this.value;

    let error =
        document.getElementById("passwordError");

    if(confirmPassword.length===0){

        error.style.display="none";

        this.style.borderColor="rgba(255,255,255,.25)";

        return;

    }

    if(password===confirmPassword){

        error.style.display="none";

        this.style.borderColor="#38ef7d";

    }
    else{

        error.style.display="block";

        this.style.borderColor="#ff4d4d";

    }

});

document.getElementById("uphone")
.addEventListener("input",function(){

    this.value =
        this.value.replace(/[^0-9]/g,"");

});

</script>

</body>

</html>