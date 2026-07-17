<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tour.tour_management_system.entity.Tour"%>
<%@ page import="com.tour.tour_management_system.entity.User"%>

<%
ArrayList<Tour> tours =
(ArrayList<Tour>) request.getAttribute("tourList");

User user =
(User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Explore Tours</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

html {
	scroll-behavior: smooth;
}

body {
	background: #10211d;
	overflow-x: hidden;
}

/*==============================
            HERO
===============================*/
.hero {
	position: relative;
	min-height: 92vh;
	padding: 35px 55px 170px;
	display: flex;
	flex-direction: column;
	background: linear-gradient(rgba(8, 18, 25, .58), rgba(8, 20, 25, .78)),
		url("images/tour4.jpg");
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
}

.hero::before {
	content: "";
	position: absolute;
	inset: 0;
	background: radial-gradient(circle at top, rgba(255, 255, 255, .08),
		transparent 60%);
	pointer-events: none;
}

/*==============================
            NAVBAR
===============================*/
.navbar {
	position: relative;
	z-index: 100;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

/*==============================
            LOGO
===============================*/
.logo {
	font-size: 40px;
	font-weight: 700;
	font-style: italic;
	color: white;
	letter-spacing: 1px;
	cursor: pointer;
	transition: .35s;
}

.logo:hover {
	color: #FFD54F;
}

/*==============================
            MENU
===============================*/
.menu {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 14px 24px;
	border-radius: 50px;
	background: rgba(255, 255, 255, .12);
	backdrop-filter: blur(20px);
	border: 1px solid rgba(255, 255, 255, .15);
}

.menu a {
	text-decoration: none;
	color: white;
	padding: 11px 18px;
	border-radius: 30px;
	transition: .35s;
	font-size: 15px;
	font-weight: 500;
}

.menu a:hover {
	background: rgba(255, 255, 255, .10);
	color: #FFD54F;
}

.menu a.active {
	background: #2E7D32;
	color: white;
}

/*==============================
        RIGHT BUTTON
===============================*/
.bookBtnTop {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	padding: 14px 28px;
	border-radius: 40px;
	text-decoration: none;
	background: white;
	color: #222;
	font-weight: 600;
	transition: .35s;
}

.bookBtnTop:hover {
	background: #FFD54F;
	transform: translateY(-4px);
}

/*==============================
        HERO CONTENT
===============================*/
.heroContent {
	flex: 1;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
	position: relative;
	z-index: 10;
}

.heroContent h1 {
	font-size: 72px;
	font-weight: 700;
	color: white;
	max-width: 900px;
	line-height: 1.1;
	margin-bottom: 25px;
}

.heroContent p {
	width: 760px;
	max-width: 95%;
	color: rgba(255, 255, 255, .85);
	font-size: 18px;
	line-height: 1.9;
}

/*==============================
        SEARCH
===============================*/
.searchBox {
	width: 950px;
	max-width: 95%;
	margin-top: 45px;
	padding: 15px;
	display: flex;
	align-items: center;
	gap: 15px;
	border-radius: 60px;
	background: rgba(255, 255, 255, .10);
	backdrop-filter: blur(22px);
	border: 1px solid rgba(255, 255, 255, .16);
}

.searchBox input {
	flex: 1;
	background: none;
	border: none;
	outline: none;
	padding: 14px 18px;
	font-size: 17px;
	color: white;
}

.searchBox input::placeholder {
	color: rgba(255, 255, 255, .70);
}

.searchBox button {
	border: none;
	padding: 16px 34px;
	border-radius: 40px;
	background: #2E7D32;
	color: white;
	font-weight: 600;
	cursor: pointer;
	transition: .35s;
}

.searchBox button:hover {
	background: #1B5E20;
}

/*==============================
        RESPONSIVE
===============================*/
@media ( max-width :991px) {
	.hero {
		padding: 30px;
	}
	.navbar {
		flex-direction: column;
		gap: 25px;
	}
	.menu {
		flex-wrap: wrap;
		justify-content: center;
	}
	.heroContent h1 {
		font-size: 50px;
	}
	.searchBox {
		flex-direction: column;
		border-radius: 30px;
	}
	.searchBox button {
		width: 100%;
	}
}
/*======================================
        FLOATING TOUR PANEL
=======================================*/
.tourWrapper {
	position: relative;
	width: 92%;
	max-width: 1450px;
	margin: -120px auto 80px;
	z-index: 50;
}

.tourGlass {
	position: relative;
	padding: 45px;
	border-radius: 35px;
	background: rgba(255, 255, 255, .10);
	backdrop-filter: blur(30px);
	-webkit-backdrop-filter: blur(30px);
	border: 1px solid rgba(255, 255, 255, .15);
	box-shadow: 0 25px 60px rgba(0, 0, 0, .35);
}

/* Soft highlight */
.tourGlass::before {
	content: "";
	position: absolute;
	top: -100px;
	left: -80px;
	width: 280px;
	height: 280px;
	border-radius: 50%;
	background: rgba(255, 255, 255, .08);
	filter: blur(70px);
	pointer-events: none;
}

/*======================================
        FILTERS
=======================================*/
.categorySection {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 15px;
	margin-bottom: 40px;
}

.filter {
	border: none;
	cursor: pointer;
	padding: 13px 26px;
	border-radius: 40px;
	background: rgba(255, 255, 255, .10);
	color: white;
	backdrop-filter: blur(20px);
	border: 1px solid rgba(255, 255, 255, .15);
	transition: .35s;
	font-size: 15px;
}

.filter:hover {
	background: #2E7D32;
}

.filter.active {
	background: #FFD54F;
	color: #222;
	font-weight: 600;
}

/*======================================
        SECTION HEADER
=======================================*/
.sectionHeader {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 40px;
	flex-wrap: wrap;
	gap: 20px;
}

.sectionTitle h2 {
	color: white;
	font-size: 40px;
	margin-bottom: 8px;
}

.sectionTitle p {
	color: rgba(255, 255, 255, .75);
	font-size: 16px;
}

.totalTours {
	padding: 15px 26px;
	border-radius: 40px;
	background: rgba(255, 255, 255, .10);
	color: #FFD54F;
	font-weight: 600;
	border: 1px solid rgba(255, 255, 255, .15);
}
/*======================================
            TOUR GRID
=======================================*/
.tourGrid {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 35px;
}

/*======================================
            TOUR CARD
=======================================*/
.tourCard {
	width: 340px;
	overflow: hidden;
	border-radius: 28px;
	background: white;
	transition: .45s;
	box-shadow: 0 18px 45px rgba(0, 0, 0, .20);
	animation: cardFade .7s ease;
}

.tourCard:hover {
	transform: translateY(-12px);
	box-shadow: 0 30px 70px rgba(0, 0, 0, .30);
}

/*======================================
            IMAGE
=======================================*/
.imageBox {
	position: relative;
	height: 240px;
	overflow: hidden;
}

.imageBox img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: .7s;
}

.tourCard:hover img {
	transform: scale(1.10);
}

.imageBox::after {
	content: "";
	position: absolute;
	inset: 0;
	background: linear-gradient(transparent, rgba(0, 0, 0, .45));
}

/*======================================
            PRICE
=======================================*/
.price {
	position: absolute;
	left: 18px;
	bottom: 18px;
	background: white;
	color: #2E7D32;
	padding: 10px 18px;
	border-radius: 40px;
	font-weight: 700;
	font-size: 18px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, .25);
}

/*======================================
            RATING
=======================================*/
.rating {
	position: absolute;
	top: 18px;
	right: 18px;
	background: #FFD54F;
	color: #222;
	padding: 8px 14px;
	border-radius: 30px;
	font-weight: 700;
	font-size: 14px;
}

/*======================================
            CONTENT
=======================================*/
.content {
	padding: 24px;
}

.content h3 {
	font-size: 24px;
	color: #222;
	margin-bottom: 12px;
}

.location {
	color: #666;
	margin-bottom: 18px;
	font-size: 15px;
}

/*======================================
            DETAILS
=======================================*/
.details {
	display: flex;
	justify-content: space-between;
	margin-bottom: 18px;
	color: #555;
	font-size: 15px;
}

.season {
	background: #F4F7F5;
	padding: 12px 16px;
	border-radius: 15px;
	color: #2E7D32;
	margin-bottom: 20px;
	font-size: 14px;
	font-weight: 500;
}

/*======================================
            BUTTON
=======================================*/
.buttons {
	display: flex;
}

.buttons a {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	padding: 16px;
	border-radius: 40px;
	background: linear-gradient(135deg, #2E7D32, #1B5E20);
	color: white;
	text-decoration: none;
	font-weight: 600;
	transition: .35s;
}

.buttons a:hover {
	transform: translateY(-3px);
	box-shadow: 0 15px 35px rgba(46, 125, 50, .35);
}

.buttons a:hover {
	background: #1B5E20;
	transform: translateY(-3px);
}

/*======================================
            CARD ANIMATION
=======================================*/
@
keyframes cardFade {from { opacity:0;
	transform: translateY(35px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/*======================================
            RESPONSIVE
=======================================*/
@media ( max-width :768px) {
	.tourCard {
		width: 100%;
		max-width: 360px;
	}
}

/*======================================
            CATEGORY BADGE
=======================================*/
.category {
	position: absolute;
	top: 18px;
	left: 18px;
	padding: 8px 16px;
	border-radius: 30px;
	background: rgba(255, 255, 255, .18);
	backdrop-filter: blur(18px);
	color: white;
	font-size: 13px;
	font-weight: 600;
	border: 1px solid rgba(255, 255, 255, .15);
}
.noResult{

display:none;

width:100%;

padding:80px;

text-align:center;

color:white;

font-size:24px;

font-weight:600;

}
.tourGlass::after{

content:"";

position:absolute;

right:-150px;

bottom:-150px;

width:320px;

height:320px;

border-radius:50%;

background:rgba(255,255,255,.06);

filter:blur(90px);

pointer-events:none;

}
</style>

</head>

<body>

	<header class="hero">

<!-- NAVBAR -->
<nav class="navbar">

    <!-- LOGO -->
    <a href="home" class="logo">
        TourM
    </a>


    <!-- MENU -->
    <div class="menu">

        <a href="home" class="active">
            Home
        </a>

        <a href="tours">
            Tours
        </a>

        <a href="my-bookings">
            Bookings
        </a>

        <%
        

        if (user == null) {
        %>

            <a href="login.jsp">
                Login
            </a>

            <a href="registration.jsp">
                Register
            </a>

        <%
        } else {
        %>

            <div class="user-menu">

                <button
                    type="button"
                    class="user-button"
                    onclick="toggleUserMenu(event)">

                    <span class="user-avatar">
                        <%=user.getName().substring(0,1).toUpperCase()%>
                    </span>

                    <span class="user-name">
                        <%=user.getName()%>
                    </span>

                    <span class="user-arrow">⌄</span>

                </button>


                <div
                    class="user-dropdown"
                    id="userDropdown">

                    <a href="profile">
                        My Profile
                    </a>

                    <a href="my-bookings">
                        My Bookings
                    </a>

                    <div class="dropdown-line"></div>

                    <a href="logout" class="logout-link">
                        Logout
                    </a>

                </div>

            </div>

        <%
        }
        %>

    </div>


    <!-- RIGHT BUTTON -->
    <a href="tours" class="bookBtnTop">
        Explore Tours ↗
    </a>

</nav>

		<div class="heroContent">

			<h1>Explore Every Destination</h1>

			<p>Discover breathtaking destinations, hidden gems, thrilling
				adventures, and unforgettable journeys crafted for every traveler.</p>

			<div class="searchBox">

				<input type="text" id="searchInput"
					placeholder="Search destination, location or category...">

				<button>Search</button>

			</div>

		</div>

	</header>
	<!-- CATEGORY FILTER -->

	<div class="tourWrapper">

		<div class="tourGlass">

			<section class="categorySection">

				<button class="filter active" data-category="All">All Tours

				</button>

				<button class="filter" data-category="Nature">Nature</button>

				<button class="filter" data-category="Wildlife">Wildlife</button>

				<button class="filter" data-category="Beach">Beach</button>

				<button class="filter" data-category="Trekking">Trekking</button>

			</section>

			<div class="sectionHeader">

				<div class="sectionTitle">

					<h2>Available Tours</h2>

					<p>Choose your next unforgettable destination.</p>

				</div>

				<div class="totalTours">

					<%=tours==null?0:tours.size()%>
					Tours Available

				</div>

			</div>

			<section class="tourSection">



				<div class="tourGrid">




					<%
if(tours!=null){
for(Tour tour : tours){
%>

					<div class="tourCard" data-title="<%=tour.getTitle()%>"
						data-location="<%=tour.getLocation()%>"
						data-category="<%=tour.getCategory()%>">

						<div class="imageBox">

							<img src="<%=tour.getImage()%>">

							<!-- Category Badge -->

							<div class="category">

								<%=tour.getCategory()%>

							</div>

							<!-- Rating -->

							<div class="rating">

								⭐
								<%=tour.getRating()%>

							</div>

							<!-- Price -->

							<div class="price">

								₹
								<%=tour.getDiscountPrice()%>

							</div>

						</div>

						<div class="content">

							<h3>

								<%=tour.getTitle()%>

							</h3>

							<p class="location">

								📍
								<%=tour.getLocation()%>

							</p>

							<div class="details">

								<span> 🕒 <%=tour.getDuration()%>

								</span> <span> 👥 <%=tour.getAvailableSeats()%> Seats

								</span>

							</div>

							<div class="season">

								🌿 Best Season : <b><%=tour.getBestSeason()%></b>

							</div>

							<div class="buttons">

								<a href="book-tour?id=<%=tour.getId()%>"> Book Now → </a>

							</div>

						</div>

					</div>

					<%
}
}
%>

				</div>
				<div id="noResult" class="noResult">No tours found.</div>
		</div>
	</div>

	</section>

	<script>
//==============================
//SEARCH
//==============================

const searchInput = document.getElementById("searchInput");

searchInput.addEventListener("keyup", filterTours);

function filterTours(){

	const value = searchInput.value.toLowerCase();

	const cards = document.querySelectorAll(".tourCard");

	let visible = 0;

	cards.forEach(card=>{

	const title =
	card.dataset.title.toLowerCase();

	const location =
	card.dataset.location.toLowerCase();

	const category =
	card.dataset.category.toLowerCase();

	if(

	title.includes(value)

	||

	location.includes(value)

	||

	category.includes(value)

	){

	card.style.display="block";

	visible++;

	}
	else{

	card.style.display="none";

	}

	});

	document.getElementById("noResult").style.display=

	visible===0

	?

	"block"

	:

	"none";

	}


//==============================
//CATEGORY FILTER
//==============================

const filters =
document.querySelectorAll(".filter");

filters.forEach(button=>{

button.addEventListener("click",()=>{

 filters.forEach(btn=>
     btn.classList.remove("active")
 );

 button.classList.add("active");

 const selected =
     button.dataset.category.toLowerCase();

 const cards =
     document.querySelectorAll(".tourCard");

 cards.forEach(card=>{

     const category =
         card.dataset.category.toLowerCase();

     if(selected=="all"){

         card.style.display="block";

     }

     else if(category==selected){

         card.style.display="block";

     }

     else{

         card.style.display="none";

     }

 });

});

});



//==============================
//SEARCH + FILTER TOGETHER
//==============================

searchInput.addEventListener("input",()=>{

 const active =
     document.querySelector(".filter.active");

 if(active){

     active.click();

 }

});
</script>

</body>

</html>