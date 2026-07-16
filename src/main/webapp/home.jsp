<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tour.tour_management_system.entity.User"%>
<%@ page import="com.tour.tour_management_system.entity.Tour"%>
<%
ArrayList<Tour> allTours =
(ArrayList<Tour>) request.getAttribute("tourList");
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Explore Tour</title>


<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body{
    overflow-x:hidden;
    overflow-y:auto;
    background:linear-gradient(
        to bottom,
        #0f2027 0%,
        #203a43 15%,
        #2c5364 30%,
        #eef7ff 45%,
        #ffffff 100%
    );
}

.hero {
	height: 100vh;
	width: 100%;
	padding: 35px 50px;
	color: white;
	display: flex;
	flex-direction: column;
	background: linear-gradient(rgba(0, 0, 0, .45), rgba(0, 0, 0, .45)),
		url("images/tour1.jpg");
	background-size: cover;
	background-position: center;
	transition: 1s;
}

.hero::after{
    content:"";
    position:absolute;
    left:0;
    bottom:-2px;
    width:100%;
    height:240px;

    background:linear-gradient(
        to bottom,
        rgba(0,0,0,0),
        rgba(18,117,185,.15),
        rgba(238,247,255,.95)
    );

    pointer-events:none;
}

/* NAVBAR */
.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	font-size: 38px;
	font-style: italic;
	font-weight: 600;
}

.menu {
	background: rgba(255, 255, 255, .35);
	backdrop-filter: blur(18px);
	padding: 14px 30px;
	border-radius: 40px;
}

.menu a {
	color: white;
	text-decoration: none;
	margin: 0 18px;
	font-size: 17px;
	font-weight: 500;
	transition: .3s;
}

.menu a:hover {
	color: #FFD54F;
}

.book {
	background: white;
	color: black;
	padding: 12px 25px;
	border-radius: 30px;
	cursor: pointer;
	text-decoration: none;
}

/* CENTER CONTENT */
.content {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.small {
	background: rgba(255, 255, 255, .25);
	padding: 8px 20px;
	border-radius: 20px;
	backdrop-filter: blur(10px);
}

h1 {
	font-size: 100px;
	font-weight: 500;
	text-align: center;
	line-height: 1.1;
}

h1 span {
	font-style: italic;
	font-weight: 600;
}

/* BOTTOM */
.bottom {
	display: flex;
	justify-content: space-between;
	align-items: end;
}

.left {
	width: 35%;
}

.left h2 {
	font-size: 40px;
}

.left h3 {
	font-size: 28px;
	margin-top: 5px;
}

.left p {
	margin: 20px 0;
	font-size: 20px;
	line-height: 1.6;
}

.btn {
	background: white;
	color: black;
	padding: 12px 30px;
	border-radius: 30px;
	text-decoration: none;
	display: inline-block;
	transition: .3s;
}

.btn:hover {
	transform: translateY(-5px);
}

/* CAROUSEL */
.carousel {
	width: 60%;
	display: flex;
	align-items: center;
	gap: 15px;
}

.cards {
	display: flex;
	gap: 15px;
	overflow: hidden;
	width: 100%;
}

.card {
	min-width: 120px;
	height: 180px;
	border-radius: 20px;
	overflow: hidden;
	cursor: pointer;
	transition: .5s;
}

.card img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.card:hover {
	transform: translateY(-12px) scale(1.05);
}

.arrow {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	border: none;
	font-size: 25px;
	cursor: pointer;
}

.price {
	font-size: 28px;
	margin-top: 10px;
}

.rating {
	font-size: 20px;
}

.destinations {
	padding: 80px 70px;
	background: white;
}

.heading {
	text-align: center;
	margin-bottom: 50px;
}

.heading h2 {
	font-size: 42px;
	color: #222;
}

.heading p {
	color: #777;
	margin-top: 10px;
}

.destination-container {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
	gap: 30px;
}

.destination-card {
	background: white;
	border-radius: 20px;
	overflow: hidden;
	box-shadow: 0 10px 30px rgba(0, 0, 0, .12);
	transition: .4s;
}

.destination-card:hover {
	transform: translateY(-10px);
}

.destination-card img {
	width: 100%;
	height: 220px;
	object-fit: cover;
}

.info {
	padding: 20px;
}

.info h3 {
	font-size: 22px;
	color: #222;
}
/* ==========================================
           PREMIUM POPULAR TOUR SECTION
========================================== */

.hero{
    position:relative;
    z-index:1;
}

.hero::after{

    content:"";

    position:absolute;

    left:0;
    bottom:0;

    width:100%;
    height:180px;

    background:linear-gradient(

        transparent,

        rgba(220,245,255,.15),

        rgba(17, 126, 2, 0.24)

    );

    pointer-events:none;

}
/* ==========================================
   SMOOTH HERO ANIMATIONS
========================================== */

/* Initial page entrance */
.navbar {
    animation: navbarEnter 0.8s ease forwards;
}

@keyframes navbarEnter {
    from {
        opacity: 0;
        transform: translateY(-25px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}


/* Center content animation */
.content {
    animation: contentEnter 1s ease 0.2s both;
}

@keyframes contentEnter {
    from {
        opacity: 0;
        transform: translateY(30px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}


/* Bottom section entrance */
.bottom {
    animation: bottomEnter 1s ease 0.4s both;
}

@keyframes bottomEnter {
    from {
        opacity: 0;
        transform: translateY(40px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}


/* ==========================================
   TOUR CHANGE ANIMATION
========================================== */

.content.animate-tour {
    animation: tourTitleChange 0.7s ease;
}

@keyframes tourTitleChange {

    0% {
        opacity: 0;
        transform: translateY(25px);
    }

    100% {
        opacity: 1;
        transform: translateY(0);
    }
}


.left.animate-tour {
    animation: tourInfoChange 0.7s ease;
}

@keyframes tourInfoChange {

    0% {
        opacity: 0;
        transform: translateX(-30px);
    }

    100% {
        opacity: 1;
        transform: translateX(0);
    }
}


/* ==========================================
   CAROUSEL ANIMATION
========================================== */

.card {
    animation: cardEnter 0.6s ease both;
}

.card:nth-child(1) {
    animation-delay: 0.05s;
}

.card:nth-child(2) {
    animation-delay: 0.1s;
}

.card:nth-child(3) {
    animation-delay: 0.15s;
}

.card:nth-child(4) {
    animation-delay: 0.2s;
}

@keyframes cardEnter {

    from {
        opacity: 0;
        transform: translateX(35px) scale(0.9);
    }

    to {
        opacity: 1;
        transform: translateX(0) scale(1);
    }
}


/* Better card hover */
.card:hover {
    transform: translateY(-10px) scale(1.04);
    box-shadow: 0 18px 35px rgba(0, 0, 0, 0.35);
}


/* ==========================================
   BUTTON ANIMATIONS
========================================== */

.book,
.btn {
    transition:
        transform 0.3s ease,
        box-shadow 0.3s ease,
        background 0.3s ease;
}

.book:hover,
.btn:hover {
    transform: translateY(-4px);

    box-shadow:
        0 10px 25px rgba(0, 0, 0, 0.25);
}


/* ==========================================
   ARROW ANIMATIONS
========================================== */

.arrow {
    transition:
        transform 0.25s ease,
        background 0.25s ease;
}

.arrow:hover {
    transform: scale(1.12);
}

.arrow:active {
    transform: scale(0.9);
}


/* ==========================================
   CATEGORY
========================================== */

.small {
    transition:
        transform 0.3s ease,
        background 0.3s ease;
}

.small:hover {
    transform: translateY(-3px);
    background: rgba(255, 255, 255, 0.35);
}
</style>


</head>



<body>
<%
String message = (String) request.getAttribute("successMessage");

if(message != null){
%>

<script>
    alert("<%=message%>");
</script>

<%
}
%>
	<div class="hero" id="hero">



		<!-- NAVBAR -->


		<div class="navbar">


			<div class="logo" id="logo">Explore</div>




			<div class="menu">

    <a href="home">Home</a>

    <a href="tours">Tours</a>

    <a href="my-bookings">Bookings</a>

    <%
    User user = (User) session.getAttribute("user");

    if(user == null){
    %>

        <a href="login.jsp">Login</a>

        <a href="registration.jsp">Register</a>

    <%
    }else{
    %>

        <a href="logout">Logout</a>

    <%
    }
    %>

</div>



			<div> <a id="navBookBtn" class="book" href="tours">
    Tours ↗
</a></div>


		</div>







		<!-- CENTER -->


		<div class="content">


			<div class="small" id="category">Adventure</div>



			<h1 id="title">Tour Title</h1>



		</div>








		<!-- BOTTOM -->


		<div class="bottom">





			<div class="left">



				<h2 id="tourName">Tour Name</h2>




				<h3 id="location">Location</h3>



				<p id="description">Description</p>




				<div class="price">

					₹ <span id="price"> 0 </span>

				</div>




				<div class="rating">

					⭐ <span id="rating"> 0 </span>

				</div>




				<br> <a id="heroBookBtn" class="btn" href="#">Book Now ↗</a>



			</div>







			<div class="carousel">



				<button class="arrow" onclick="prev()">‹</button>




				<div class="cards" id="cards"></div>




				<button class="arrow" onclick="next()">›</button>



			</div>





		</div>





	</div>

		<script>


		let tours = [

		<%
		if (allTours != null) {
		    for (int i = 0; i < allTours.size(); i++) {

		        Tour t = allTours.get(i);
		%>

		{
		    id:<%=t.getId()%>,
		    title:"<%=t.getTitle()%>",
		    location:"<%=t.getLocation()%>",
		    category:"<%=t.getCategory()%>",
		    price:<%=t.getDiscountPrice()%>,
		    rating:<%=t.getRating()%>,
		    description:`<%=t.getDescription()%>`,
		    image:"<%=t.getImage()%>"
		}<%= (i != allTours.size()-1) ? "," : "" %>

		<%
		    }
		}
		%>

		];


		console.log(tours);

		let current = 0;


		/* ================================
		   LOAD CURRENT TOUR
		================================ */

		function loadTour() {

		    if (tours.length === 0) {
		        return;
		    }

		    let tour = tours[current];

		    let hero = document.getElementById("hero");
		    let content = document.querySelector(".content");
		    let left = document.querySelector(".left");


		    /* Restart content animations */

		    content.classList.remove("animate-tour");
		    left.classList.remove("animate-tour");

		    void content.offsetWidth;


		    /* Change hero background */

		    hero.style.backgroundImage = `

		        linear-gradient(
		            rgba(0,0,0,.45),
		            rgba(0,0,0,.45)
		        ),

		        url("${tour.image}")

		    `;


		    /* Update tour details */

		    document.getElementById("logo").textContent =
		        tour.location.split(",")[0];

		    document.getElementById("category").textContent =
		        tour.category;

		    document.getElementById("title").textContent =
		        tour.title;

		    document.getElementById("tourName").textContent =
		        tour.title;

		    document.getElementById("location").textContent =
		        tour.location;

		    document.getElementById("description").textContent =
		        tour.description;

		    document.getElementById("price").textContent =
		        tour.price;

		    document.getElementById("rating").textContent =
		        tour.rating;


		    /* Booking button */

		    document.getElementById("heroBookBtn").href =
		        "book-tour?id=" + tour.id;


		    /* Start animations */

		    content.classList.add("animate-tour");

		    left.classList.add("animate-tour");


		    /* Display carousel images */

		    showCards();
		}



		/* ================================
		   DISPLAY CAROUSEL CARDS
		================================ */

		function showCards() {

		    let cards = document.getElementById("cards");

		    cards.innerHTML = "";


		    for (let i = 0; i < 4; i++) {

		        let index = (current + i) % tours.length;

		        let card = document.createElement("div");

		        card.className = "card";


		        /* When image is clicked */

		        card.addEventListener("click", function() {

		            selectImage(index);

		        });


		        /* Create image */

		        let image = document.createElement("img");

		        image.src = tours[index].image;

		        image.alt = tours[index].title;


		        /* Add image inside card */

		        card.appendChild(image);


		        /* Add card inside carousel */

		        cards.appendChild(card);

		    }

		}



		/* ================================
		   NEXT TOUR
		================================ */

		function next() {

		    if (tours.length === 0) {
		        return;
		    }

		    current = (current + 1) % tours.length;

		    loadTour();

		}



		/* ================================
		   PREVIOUS TOUR
		================================ */

		function prev() {

		    if (tours.length === 0) {
		        return;
		    }

		    current =
		        (current - 1 + tours.length) % tours.length;

		    loadTour();

		}



		/* ================================
		   SELECT CAROUSEL IMAGE
		================================ */

		function selectImage(index) {

		    current = index;

		    loadTour();

		}



		/* ================================
		   AUTO SLIDER
		================================ */

		let autoSlider = setInterval(function() {

		    next();

		}, 6000);



		/* ================================
		   INITIAL LOAD
		================================ */

		loadTour();
</script>