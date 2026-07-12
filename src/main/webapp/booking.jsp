<%@page import="com.tour.tour_management_system.entity.User"%>
<%@page import="com.tour.tour_management_system.entity.Tour"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
Tour tour = (Tour) request.getAttribute("tour");
User user = (User) request.getAttribute("user");

if(tour == null){
    response.sendRedirect("home");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Book Tour | Explore</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<link rel="stylesheet" href="css/booking.css">
<style >
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

:root{

    --primary:#2E7D32;
    --secondary:#1B5E20;
    --accent:#FFD54F;
    --glass:rgba(255,255,255,.12);
    --glass-border:rgba(255,255,255,.18);
    --white:#ffffff;
    --shadow:0 20px 50px rgba(0,0,0,.35);

}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{

    background:#111;
    overflow-x:hidden;

}

/*==========================
        HERO
==========================*/
.hero{

    min-height:100vh;

    position:relative;

        background:
    linear-gradient(rgba(7,12,20,.82),rgba(7,12,20,.82)),
    url("images/tour4.jpg");

background-size:cover;
background-position:center;
    background-attachment:fixed;

    padding:30px 50px;

}

.overlay{

    position:absolute;
    inset:0;

    background:
    linear-gradient(
    rgba(0,0,0,.35),
    rgba(0,0,0,.65));

    backdrop-filter:blur(4px);

}

/*==========================
        NAVBAR
==========================*/

.navbar{

    display:flex;

    justify-content:space-between;

    align-items:center;

    position:relative;

    z-index:100;

    margin-bottom:45px;

}

.logo{

    font-size:38px;
    color:#fff;
    font-style:italic;
    font-weight:700;

}

.menu{

    display:flex;
    gap:18px;

    background:rgba(255,255,255,.10);

    padding:14px 28px;

    border-radius:50px;

    backdrop-filter:blur(20px);

}

.menu a{

    color:#fff;
    text-decoration:none;
    transition:.3s;
    font-weight:500;

}

.menu a:hover{

    color:var(--accent);

}

/*==========================
        MAIN LAYOUT
==========================*/

.container{

    position:relative;
    z-index:10;

    margin-top:45px;

    width:1200px;

    max-width:92%;

    display:grid;

    grid-template-columns:470px 500px;

    justify-content:center;

    gap:35px;
    align-items:start;

}

/*==========================
      GLASS CARD
==========================*/

.tour-card,
.booking-card{

    background:var(--glass);

    border:1px solid var(--glass-border);

    backdrop-filter:blur(18px);

    border-radius:30px;

    box-shadow:var(--shadow);
    

}

/*==========================
      TOUR CARD
==========================*/

.tour-card{

    overflow:hidden;

}

.tour-image{

    position:relative;

}

.tour-image img{

    width:100%;
    height:280px;
    object-fit:cover;

}

.category{

    position:absolute;

    top:20px;
    left:20px;

    background:var(--accent);

    color:#222;

    padding:8px 18px;

    border-radius:50px;

    font-size:14px;

    font-weight:600;

}

.tour-content{

    padding:28px;

    color:#fff;

}

.tour-content h1{

    font-size:32px;

    margin-bottom:15px;

}

.tour-content p{

    margin:12px 0;

    color:#ececec;

}

.price{

    margin:25px 0;

    font-size:40px;

    font-weight:700;

    color:var(--accent);

}

.price small{

    font-size:16px;

    color:#fff;

}

.description{

    margin-top:20px;

    line-height:1.8;

    color:#ddd;

}

/*==========================
     BOOKING CARD
==========================*/

.booking-card{

    
    padding:28px 32px;

    max-width:600px;

}

.booking-card h2{

    color:#fff;

    font-size:34px;

    margin-bottom:30px;

}

.section-title{

    color:var(--accent);

    margin:25px 0 15px;

    font-weight:600;

    font-size:17px;

    letter-spacing:.5px;

}

label{

    color:#fff;

    display:block;

    margin-bottom:8px;

    margin-top:16px;

}

input,
textarea{

    width:100%;

    border:none;

    outline:none;

    border-radius:15px;

     padding:12px 16px;

    font-size:14px;


    background:rgba(255,255,255,.12);

    color:#fff;

    transition:.3s;

}

input:focus,
textarea:focus{

    background:rgba(255,255,255,.18);

    transform:scale(1.01);

}

textarea{

    resize:none;

}

input::placeholder,
textarea::placeholder{

    color:#ddd;

}

/*==========================
        ROW
==========================*/

.row{

    display:grid;

    grid-template-columns:1fr 1fr;

    gap:20px;

}

/*==========================
      SUMMARY
==========================*/

.summary{

    margin-top:35px;

    background:rgba(255,255,255,.08);

    padding:18px;

    border-radius:18px;

}

.summary div{

    display:flex;

    justify-content:space-between;

    align-items:center;

    color:#fff;

    margin:14px 0;

    font-size:17px;

}

.summary span{

    font-weight:700;

    color:var(--accent);

    font-size:22px;

}

/*==========================
      BUTTON
==========================*/

button{

    margin-top:30px;

    width:100%;

    padding:14px;

    border:none;

    border-radius:50px;

    cursor:pointer;

    background:linear-gradient(
    135deg,
    #43A047,
    #2E7D32);

    color:#fff;

    font-size:16px;

    font-weight:600;

    transition:.35s;

}

button:hover{

    transform:translateY(-5px);

    box-shadow:
    0 15px 35px
    rgba(46,125,50,.45);

}

/*==========================
      ANIMATIONS
==========================*/

.tour-card{

    animation:leftSlide .8s ease;

}

.booking-card{

    animation:rightSlide .8s ease;

}

@keyframes leftSlide{

    from{

        opacity:0;

        transform:translateX(-60px);

    }

    to{

        opacity:1;

        transform:translateX(0);

    }

}

@keyframes rightSlide{

    from{

        opacity:0;

        transform:translateX(60px);

    }

    to{

        opacity:1;

        transform:translateX(0);

    }

}

/*==========================
      RESPONSIVE
==========================*/

@media(max-width:1000px){

.hero{

padding:25px;

}

.container{

grid-template-columns:1fr;

}

.menu{

display:none;

}

.tour-image img{

height:240px;

}

.booking-card{

padding:30px;

}

.row{

grid-template-columns:1fr;

}

.logo{

font-size:30px;

}

}

@media(max-width:600px){

.hero{

padding:18px;

}

.tour-content h1{

font-size:24px;

}

.price{

font-size:32px;

}

.booking-card h2{

font-size:28px;

}

.summary span{

font-size:18px;

}

button{

font-size:16px;

padding:16px;

}

}
</style>
</head>

<body>

<div class="hero"
style="background-image:
linear-gradient(rgba(0,0,0,.75),rgba(0,0,0,.55)),
url('<%=tour.getImage()%>');">

<div class="overlay"></div>

<!-- ========================= -->
<!-- NAVBAR -->
<!-- ========================= -->

<nav class="navbar">

<div class="logo">

Explore

</div>

<div class="menu">

<a href="home">Home</a>

<a href="tours">Tours</a>

<a href="my-bookings">My Bookings</a>

<a href="logout">Logout</a>

</div>

</nav>

<!-- ========================= -->
<!-- CONTENT -->
<!-- ========================= -->

<div class="container">

<!-- LEFT SIDE -->

<section class="tour-card">

<div class="tour-image">

<img src="<%=tour.getImage()%>">

<span class="category">

<%=tour.getCategory()%>

</span>

</div>

<div class="tour-content">

<h1>

<%=tour.getTitle()%>

</h1>

<p>

📍 <%=tour.getLocation()%>

</p>

<p>

🕒 <%=tour.getDuration()%>

</p>

<p>

👥 <%=tour.getAvailableSeats()%> Seats Available

</p>

<p>

⭐ <%=tour.getRating()%>

</p>

<div class="price">

₹ <%=tour.getDiscountPrice()%>

<small>/ Person</small>

</div>

<div class="description">

<%=tour.getDescription()%>

</div>

</div>

</section>

<!-- RIGHT SIDE -->

<section class="booking-card">

<h2>

Complete Your Booking

</h2>

<form action="confirm-booking" method="post">

<input
type="hidden"
name="tourId"
value="<%=tour.getId()%>">

<!-- PERSONAL -->

<div class="section-title">

Personal Information

</div>

<label>

Full Name

</label>

<input
type="text"
name="fullName"
value="<%=user.getName()%>"
required>

<label>

Email Address

</label>

<input
type="email"
name="email"
value="<%=user.getEmail()%>"
required>

<label>

Phone Number

</label>

<input
type="text"
name="phone"
value="<%=user.getPhone()%>"
required>

<!-- TRAVEL -->

<div class="section-title">

Travel Information

</div>

<label>

Travel Date

</label>

<input
type="date"
name="travelDate"
required>

<div class="row">

<div>

<label>

Adults

</label>

<input
type="number"
id="adults"
name="adults"
value="1"
min="1">

</div>

<div>

<label>

Children

</label>

<input
type="number"
id="children"
name="children"
value="0"
min="0">

</div>

</div>

<label>

Special Request

</label>

<textarea
rows="3"
name="specialRequest"
placeholder="Anything we should know?"></textarea>

<!-- SUMMARY -->

<div class="summary">

<div>

Price Per Person

<span>

₹ <%=tour.getDiscountPrice()%>

</span>

</div>

<div>

Total Price

<span id="totalPrice">

₹ <%=tour.getDiscountPrice()%>

</span>

</div>

</div>

<button type="submit">

Confirm Booking →

</button>

</form>

</section>

</div>

</div>

<script src="js/booking.js"></script>

<script>

const price=<%=tour.getDiscountPrice()%>;
//=====================================
//Booking Page Script
//=====================================

document.addEventListener("DOMContentLoaded", () => {

 const adults = document.getElementById("adults");
 const children = document.getElementById("children");
 const totalPrice = document.getElementById("totalPrice");
 const travelDate = document.querySelector("input[name='travelDate']");
 const bookingForm = document.querySelector("form");
 const submitButton = document.querySelector("button");

 // -------------------------------
 // Minimum Travel Date = Today
 // -------------------------------

 const today = new Date();

 const year = today.getFullYear();

 const month = String(today.getMonth() + 1).padStart(2, "0");

 const day = String(today.getDate()).padStart(2, "0");

 const minDate = `${year}-${month}-${day}`;

 travelDate.min = minDate;

 // -------------------------------
 // Price Calculation
 // -------------------------------

 function updatePrice() {

     const adultCount = parseInt(adults.value) || 0;

     const childCount = parseInt(children.value) || 0;

     const total = (adultCount + childCount) * price;

     animatePrice(total);

 }

 // -------------------------------
 // Animated Price
 // -------------------------------

 function animatePrice(finalPrice) {

     let current = parseInt(
         totalPrice.textContent.replace(/[^\d]/g, "")
     ) || 0;

     const increment = Math.ceil(Math.abs(finalPrice - current) / 20);

     const timer = setInterval(() => {

         if (current < finalPrice) {

             current += increment;

             if (current >= finalPrice) {

                 current = finalPrice;

                 clearInterval(timer);

             }

         }

         else if (current > finalPrice) {

             current -= increment;

             if (current <= finalPrice) {

                 current = finalPrice;

                 clearInterval(timer);

             }

         }

         else {

             clearInterval(timer);

         }

         totalPrice.innerHTML = "₹ " + current;

     }, 15);

 }

 // -------------------------------
 // Listeners
 // -------------------------------

 adults.addEventListener("input", updatePrice);

 children.addEventListener("input", updatePrice);

 updatePrice();

 // -------------------------------
 // Form Validation
 // -------------------------------

 bookingForm.addEventListener("submit", function (e) {

     const adultCount = parseInt(adults.value);

     const childCount = parseInt(children.value);

     if (adultCount < 1) {

         alert("At least one adult is required.");

         e.preventDefault();

         return;

     }

     if (childCount < 0) {

         alert("Invalid number of children.");

         e.preventDefault();

         return;

     }

     // Loading State

     submitButton.disabled = true;

     submitButton.innerHTML = "Processing Booking...";

 });

});
</script>

</body>
</html>