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
	font-size: 70px;
	font-weight: 300;
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
	font-size: 25px;
}

.left h3 {
	font-size: 16px;
	margin-top: 5px;
}

.left p {
	margin: 20px 0;
	font-size: 14px;
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
	font-size: 22px;
	margin-top: 10px;
}

.rating {
	font-size: 16px;
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




function loadTour(){


let tour = tours[current];



let hero = document.getElementById("hero");



hero.style.backgroundImage =

`

linear-gradient(
rgba(0,0,0,.45),
rgba(0,0,0,.45)
),

url('${tour.image}')

`;




document.getElementById("logo").innerHTML =

tour.location.split(",")[0];



document.getElementById("category").innerHTML =

tour.category;



document.getElementById("title").innerHTML =

tour.title;



document.getElementById("tourName").innerHTML =

tour.title;



document.getElementById("location").innerHTML =

tour.location;



document.getElementById("description").innerHTML =

tour.description;



document.getElementById("price").innerHTML =

tour.price;



document.getElementById("rating").innerHTML =

tour.rating;

document.getElementById("heroBookBtn").href =
    "book-tour?id=" + tour.id;

showCards();


}






function showCards(){



let cards = document.getElementById("cards");


cards.innerHTML="";



let start=current;



for(let i=0;i<4;i++){


let index=(start+i)%tours.length;



cards.innerHTML +=


`

<div class="card" onclick="selectImage(${index})">


<img src="${tours[index].image}">


</div>

`;



}



}






function next(){


current++;



if(current>=tours.length){

current=0;

}



loadTour();



}






function prev(){


current--;



if(current<0){

current=tours.length-1;

}



loadTour();



}







function selectImage(index){


current=index;


loadTour();


}




// automatic slider (optional)

setInterval(()=>{


next();


},6000);





loadTour();



</script>