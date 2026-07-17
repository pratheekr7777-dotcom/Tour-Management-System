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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Explore Tour</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    overflow-x: hidden;
    overflow-y: auto;
    background: linear-gradient(
        to bottom,
        #0f2027 0%,
        #203a43 15%,
        #2c5364 30%,
        #eef7ff 45%,
        #ffffff 100%
    );
}

img {
    max-width: 100%;
}

/* =========================
   HERO
========================= */
.hero {
    position: relative;
    z-index: 1;
    width: 100%;
    min-height: 100svh;
    height: auto;
    padding: 35px 50px;
    color: white;
    display: flex;
    flex-direction: column;
    background-size: cover;
    background-position: center center;
    background-repeat: no-repeat;
    overflow: hidden;
    transition: background-image 1s ease;
}

.hero::after {
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 180px;
    background: linear-gradient(
        transparent,
        rgba(220, 245, 255, .15),
        rgba(17, 126, 2, .24)
    );
    pointer-events: none;
}

/* =========================
   NAVBAR
========================= */
.navbar {
    position: relative;
    z-index: 1000;
    width: 100%;
    min-height: 58px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 25px;
    animation: navbarEnter .8s ease both;
}

.logo {
    flex-shrink: 0;
    color: white;
    font-size: 42px;
    line-height: 1;
    font-weight: 600;
    font-style: italic;
    letter-spacing: -1px;
    text-shadow: 0 3px 15px rgba(0, 0, 0, .30);
    cursor: default;
    transition: color .3s ease, transform .3s ease, text-shadow .3s ease;
}

.logo:hover {
    color: #FFD54F;
    transform: translateY(-2px);
    text-shadow: 0 5px 20px rgba(0, 0, 0, .40);
}

.menu {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    align-items: center;
    gap: 7px;
    padding: 9px 12px;
    border-radius: 50px;
    background: rgba(255, 255, 255, .14);
    border: 1px solid rgba(255, 255, 255, .20);
    backdrop-filter: blur(18px);
    -webkit-backdrop-filter: blur(18px);
    box-shadow: 0 10px 35px rgba(0, 0, 0, .15);
}

.nav-link {
    position: relative;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 12px 21px;
    border-radius: 30px;
    color: rgba(255, 255, 255, .90);
    text-decoration: none;
    font-size: 16px;
    font-weight: 500;
    white-space: nowrap;
    transition: color .3s ease, background .3s ease, transform .3s ease;
}

.nav-link:hover {
    color: white;
    background: rgba(255, 255, 255, .12);
    transform: translateY(-1px);
}

.nav-link.active {
    color: #173426;
    background: rgba(255, 255, 255, .95);
    box-shadow: 0 5px 18px rgba(0, 0, 0, .12);
}

/* =========================
   USER MENU
========================= */
.user-menu {
    position: relative;
}

.user-button {
    display: flex;
    align-items: center;
    gap: 9px;
    padding: 6px 13px 6px 7px;
    border: none;
    border-radius: 30px;
    background: rgba(255, 255, 255, .10);
    color: white;
    font-family: inherit;
    font-size: 15px;
    cursor: pointer;
    transition: background .3s ease, transform .3s ease;
}

.user-button:hover {
    background: rgba(255, 255, 255, .20);
    transform: translateY(-1px);
}

.user-avatar {
    width: 36px;
    height: 36px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    background: white;
    color: #173426;
    font-size: 15px;
    font-weight: 700;
    box-shadow: 0 4px 12px rgba(0, 0, 0, .15);
}

.user-name {
    max-width: 110px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    font-size: 15px;
    font-weight: 500;
}

.dropdown-arrow {
    font-size: 16px;
    transition: transform .3s ease;
}

.user-dropdown {
    position: absolute;
    top: calc(100% + 16px);
    right: 0;
    width: 190px;
    padding: 9px;
    border-radius: 17px;
    background: rgba(255, 255, 255, .97);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    box-shadow: 0 20px 50px rgba(0, 0, 0, .25);
    opacity: 0;
    visibility: hidden;
    pointer-events: none;
    transform: translateY(-10px) scale(.96);
    transform-origin: top right;
    transition: opacity .25s ease, visibility .25s ease, transform .25s ease;
}

.user-dropdown.show {
    opacity: 1;
    visibility: visible;
    pointer-events: auto;
    transform: translateY(0) scale(1);
}

.user-dropdown a {
    display: block;
    padding: 11px 13px;
    border-radius: 10px;
    color: #26352d;
    text-decoration: none;
    font-size: 13px;
    transition: background .2s ease, padding-left .2s ease;
}

.user-dropdown a:hover {
    background: #edf4ef;
    padding-left: 17px;
}

.dropdown-divider {
    height: 1px;
    margin: 6px;
    background: #e2e8e4;
}

.user-dropdown .logout-link {
    color: #c43d3d;
}

.navbar-actions {
    display: flex;
    align-items: center;
    gap: 12px;
    flex-shrink: 0;
}

.book {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 14px 29px;
    border-radius: 30px;
    background: white;
    color: #17231c;
    text-decoration: none;
    font-size: 16px;
    font-weight: 600;
    white-space: nowrap;
    box-shadow: 0 8px 25px rgba(0, 0, 0, .16);
    transition: transform .3s ease, background .3s ease, box-shadow .3s ease;
}

.book:hover {
    background: #FFD54F;
    transform: translateY(-4px);
    box-shadow: 0 13px 30px rgba(0, 0, 0, .25);
}

/* =========================
   MOBILE MENU BUTTON
========================= */
.mobile-menu-btn {
    display: none;
    width: 44px;
    height: 44px;
    padding: 0;
    border: 1px solid rgba(255, 255, 255, .25);
    border-radius: 50%;
    background: rgba(255, 255, 255, .14);
    backdrop-filter: blur(15px);
    cursor: pointer;
}

.mobile-menu-btn span {
    display: block;
    width: 18px;
    height: 2px;
    margin: 4px auto;
    border-radius: 5px;
    background: white;
    transition: .3s ease;
}

.mobile-menu-btn.active span:nth-child(1) {
    transform: translateY(6px) rotate(45deg);
}

.mobile-menu-btn.active span:nth-child(2) {
    opacity: 0;
}

.mobile-menu-btn.active span:nth-child(3) {
    transform: translateY(-6px) rotate(-45deg);
}

/* =========================
   HERO CONTENT
========================= */
.content {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    animation: contentEnter 1s ease .2s both;
}

.small {
    padding: 8px 20px;
    border-radius: 20px;
    background: rgba(255, 255, 255, .25);
    backdrop-filter: blur(10px);
    transition: transform .3s ease, background .3s ease;
}

.small:hover {
    transform: translateY(-3px);
    background: rgba(255, 255, 255, .35);
}

h1 {
    font-size: 80px;
    font-weight: 500;
    text-align: center;
    line-height: 1.1;
}

h1 span {
    font-style: italic;
    font-weight: 600;
}

/* =========================
   TOUR DETAILS
========================= */
.bottom {
    display: flex;
    justify-content: space-between;
    align-items: end;
    animation: bottomEnter 1s ease .4s both;
}

.left {
    width: 35%;
}

.left h2 {
    font-size: 30px;
}

.left h3 {
    margin-top: 5px;
    font-size: 22px;
}

.left p {
    margin: 20px 0;
    font-size: 18px;
    line-height: 1.6;
}

.price {
    margin-top: 10px;
    font-size: 24px;
}

.rating {
    font-size: 18px;
}

.btn {
    display: inline-block;
    padding: 12px 30px;
    border-radius: 30px;
    background: white;
    color: black;
    text-decoration: none;
    transition: transform .3s ease, box-shadow .3s ease, background .3s ease;
}

.btn:hover {
    transform: translateY(-4px);
    box-shadow: 0 10px 25px rgba(0, 0, 0, .25);
}

/* =========================
   CAROUSEL
========================= */
.carousel {
    width: 60%;
    display: flex;
    align-items: center;
    gap: 15px;
}

.cards {
    width: 100%;
    display: flex;
    gap: 15px;
    overflow: hidden;
}

.card {
    min-width: 120px;
    height: 180px;
    border-radius: 20px;
    overflow: hidden;
    cursor: pointer;
    transition: transform .5s ease, box-shadow .5s ease;
    animation: cardEnter .6s ease both;
}

.card:nth-child(1) { animation-delay: .05s; }
.card:nth-child(2) { animation-delay: .10s; }
.card:nth-child(3) { animation-delay: .15s; }
.card:nth-child(4) { animation-delay: .20s; }

.card img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.card:hover {
    transform: translateY(-10px) scale(1.04);
    box-shadow: 0 18px 35px rgba(0, 0, 0, .35);
}

.arrow {
    width: 45px;
    height: 45px;
    border: none;
    border-radius: 50%;
    font-size: 25px;
    cursor: pointer;
    transition: transform .25s ease, background .25s ease;
}

.arrow:hover {
    transform: scale(1.12);
}

.arrow:active {
    transform: scale(.9);
}

/* =========================
   ANIMATIONS
========================= */
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

.content.animate-tour {
    animation: tourTitleChange .7s ease;
}

@keyframes tourTitleChange {
    from {
        opacity: 0;
        transform: translateY(25px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.left.animate-tour {
    animation: tourInfoChange .7s ease;
}

@keyframes tourInfoChange {
    from {
        opacity: 0;
        transform: translateX(-30px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

@keyframes cardEnter {
    from {
        opacity: 0;
        transform: translateX(35px) scale(.9);
    }
    to {
        opacity: 1;
        transform: translateX(0) scale(1);
    }
}

/* =========================
   TABLET / SMALL LAPTOP
========================= */
@media (max-width: 1100px) {
    .hero {
        min-height: 100svh;
        padding: 28px 30px 45px;
        background-position: center 35%;
    }

    .logo {
        font-size: 35px;
    }

    .menu {
        position: absolute;
        top: calc(100% + 16px);
        left: 0;
        right: 0;
        width: 100%;
        transform: translateY(-12px);
        flex-direction: column;
        align-items: stretch;
        gap: 5px;
        padding: 17px;
        border-radius: 24px;
        background: rgba(15, 32, 39, .96);
        opacity: 0;
        visibility: hidden;
        pointer-events: none;
        transition: opacity .3s ease, transform .3s ease, visibility .3s ease;
    }

    .menu.mobile-open {
        opacity: 1;
        visibility: visible;
        pointer-events: auto;
        transform: translateY(0);
    }

    .nav-link {
        width: 100%;
        padding: 13px 17px;
        justify-content: flex-start;
        font-size: 16px;
    }

    .user-button {
        width: 100%;
        padding: 9px;
        justify-content: flex-start;
    }

    .user-name {
        display: inline-block;
        max-width: none;
        font-size: 15px;
    }

    .user-dropdown {
        position: static;
        width: 100%;
        margin-top: 8px;
        display: none;
        opacity: 1;
        visibility: visible;
        pointer-events: auto;
        transform: none;
    }

    .user-dropdown.show {
        display: block;
    }

    .mobile-menu-btn {
        display: block;
        width: 48px;
        height: 48px;
    }

    .book {
        padding: 13px 25px;
        font-size: 15px;
    }

    .content {
        min-height: 370px;
        padding-top: 60px;
    }

    h1 {
        font-size: clamp(46px, 7vw, 65px);
    }

    .bottom {
        flex-direction: column;
        align-items: stretch;
        gap: 32px;
    }

    .left {
        width: 100%;
        max-width: 700px;
    }

    .carousel {
        width: 100%;
    }
}

/* =========================
   MOBILE
========================= */
@media (max-width: 600px) {
    @supports not (height: 100dvh) {
        .hero {
            height: 100vh;
            min-height: 100vh;
        }
    }

    .hero {
        width: 100%;
        height: 100dvh;
        min-height: 100dvh;
        padding: 18px 15px 25px;
        background-size: cover;
        background-position: center center;
        background-repeat: no-repeat;
        overflow: hidden;
    }

    .navbar {
        min-height: 52px;
    }

    .logo {
        max-width: calc(100% - 65px);
        font-size: 30px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }

    .book {
        display: none;
    }

    .mobile-menu-btn {
        width: 46px;
        height: 46px;
        flex-shrink: 0;
    }

    .mobile-menu-btn span {
        width: 20px;
    }

    .menu {
        top: calc(100% + 14px);
        padding: 16px;
    }

    .nav-link {
        padding: 14px 16px;
        font-size: 16px;
    }

    .content {
        flex: 1;
        min-height: 0;
        padding: 35px 0 20px;
    }

    .small {
        padding: 7px 16px;
        font-size: 12px;
    }

    h1 {
        font-size: clamp(36px, 11vw, 50px);
        line-height: 1.08;
        overflow-wrap: anywhere;
    }

    .bottom {
        flex-shrink: 0;
        gap: 15px;
    }

    .left h2 {
        font-size: 25px;
    }

    .left h3 {
        font-size: 17px;
    }

    .left p {
        margin: 7px 0;
        display: -webkit-box;
        overflow: hidden;
        font-size: 11px;
        line-height: 1.4;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }

    .price {
        font-size: 22px;
    }

    .rating {
        font-size: 16px;
    }

    .btn {
        padding: 11px 24px;
        font-size: 14px;
    }

    .carousel {
        width: 100%;
        gap: 7px;
    }

    .cards {
        gap: 9px;
    }

    .card {
        flex: 0 0 calc(33.333% - 7px);
        min-width: calc(33.333% - 7px);
        height: 100px;
        border-radius: 14px;
    }

    .arrow {
        width: 38px;
        height: 38px;
        flex-shrink: 0;
        font-size: 21px;
    }
}

/* =========================
   VERY SMALL MOBILE
========================= */
@media (max-width: 400px) {
    .hero {
        padding: 18px 14px 30px;
    }

    .logo {
        font-size: 27px;
    }

    .content {
        padding-top: 35px;
    }

    h1 {
        font-size: 35px;
    }

    .card {
        flex: 0 0 calc(50% - 5px);
        min-width: calc(50% - 5px);
    }

    .arrow {
        width: 32px;
        height: 32px;
    }
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

<!-- =========================
     NAVBAR
========================= -->

<nav class="navbar">

    <!-- Dynamic Location -->
    <div class="logo" id="logo">
        Explore
    </div>

    <!-- Navigation Menu -->
    <div class="menu" id="navMenu">

        <a href="home" class="nav-link active">
            Home
        </a>

        <a href="tours" class="nav-link">
            Tours
        </a>

        <a href="my-bookings" class="nav-link">
            My Bookings
        </a>

        <%
        User user = (User) session.getAttribute("user");

        if (user == null) {
        %>

            <a href="login.jsp" class="nav-link">
                Login
            </a>

            <a href="registration.jsp" class="nav-link">
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
                        <%= (user.getName() != null && !user.getName().isBlank()) ? user.getName().substring(0, 1).toUpperCase() : "U" %>
                    </span>

                    <span class="user-name">
                        <%= user.getName() %>
                    </span>

                    <span class="dropdown-arrow">
                        ▾
                    </span>

                </button>

                <div
                    class="user-dropdown"
                    id="userDropdown">

                    <a href="profile">Update Profile</a>

                    <div class="dropdown-divider"></div>

                    <a
                        href="logout"
                        class="logout-link">

                        Logout

                    </a>

                </div>

            </div>

        <%
        }
        %>

    </div>

    <!-- Right Side -->
    <div class="navbar-actions">

        <a
            id="navBookBtn"
            class="book"
            href="tours">

            Tours ↗

        </a>

        <button
            id="mobileMenuBtn"
            class="mobile-menu-btn"
            type="button"
            aria-label="Open navigation"
            onclick="toggleMobileMenu()">

            <span></span>
            <span></span>
            <span></span>

        </button>

    </div>

</nav>

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

		    /* Restart animations */

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

		    /* Restart animations */

		    content.classList.add("animate-tour");
		    left.classList.add("animate-tour");

		    /* Display carousel */

		    showCards();
		}

		/* ================================
		   DISPLAY CAROUSEL CARDS
		================================ */
		window.addEventListener("resize", function() {
		    showCards();
		});
		function showCards() {

		    if (tours.length === 0) {
		        return;
		    }

		    let cards = document.getElementById("cards");

		    cards.innerHTML = "";

		    let visibleCards;

		    if (window.innerWidth <= 400) {
		        visibleCards = 2;
		    }
		    else if (window.innerWidth <= 600) {
		        visibleCards = 3;
		    }
		    else {
		        visibleCards = 4;
		    }

		    for (let i = 0; i < visibleCards; i++) {
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
		/* ==========================================
		   USER DROPDOWN
		========================================== */

		function toggleUserMenu(event) {

		    event.stopPropagation();

		    const dropdown =
		        document.getElementById("userDropdown");

		    if (dropdown) {
		        dropdown.classList.toggle("show");
		    }

		}

		/* ==========================================
		   MOBILE NAVIGATION
		========================================== */

		function toggleMobileMenu() {

		    const menu =
		        document.getElementById("navMenu");

		    const button =
		        document.getElementById("mobileMenuBtn");

		    menu.classList.toggle("mobile-open");

		    button.classList.toggle("active");

		}

		/* ==========================================
		   CLOSE MENUS WHEN CLICKING OUTSIDE
		========================================== */

		document.addEventListener("click", function(event) {

		    const userMenu =
		        document.querySelector(".user-menu");

		    const dropdown =
		        document.getElementById("userDropdown");

		    /* Close user dropdown */

		    if (
		        userMenu &&
		        dropdown &&
		        !userMenu.contains(event.target)
		    ) {

		        dropdown.classList.remove("show");

		    }

		    /* Close mobile menu */

		    if (window.innerWidth <= 1100) {

		        const navbar =
		            document.querySelector(".navbar");

		        const menu =
		            document.getElementById("navMenu");

		        const button =
		            document.getElementById("mobileMenuBtn");

		        if (
		            navbar &&
		            !navbar.contains(event.target)
		        ) {

		            menu.classList.remove("mobile-open");

		            button.classList.remove("active");

		        }

		    }

		});
</script>
