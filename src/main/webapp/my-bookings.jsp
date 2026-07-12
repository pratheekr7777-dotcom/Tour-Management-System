<%@page import="com.tour.tour_management_system.entity.User"%>
<%@page import="com.tour.tour_management_system.entity.Tour"%>
<%@page import="com.tour.tour_management_system.entity.Booking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>


<%
ArrayList<Booking> bookings =
(ArrayList<Booking>) request.getAttribute("bookings");

Map<Integer, Tour> tourMap =
(Map<Integer, Tour>) request.getAttribute("tourMap");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Bookings</title>

<style >
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{

    background:#111;

}

.hero{

    min-height:100vh;

    padding:50px;

    position:relative;

    background:
    linear-gradient(rgba(8,12,20,.82),rgba(8,12,20,.82)),
    url("images/tour4.jpg");

    background-size:cover;

    background-position:center;

    background-attachment:fixed;

}
/* ==========================
          NAVBAR
========================== */

.navbar{

    position:relative;

    z-index:100;

    display:flex;

    justify-content:space-between;

    align-items:center;

    margin-bottom:40px;

}

.logo{

    font-size:38px;

    font-style:italic;

    font-weight:600;

    color:#fff;

}

.menu{

    background:rgba(255,255,255,.15);

    backdrop-filter:blur(18px);

    padding:14px 30px;

    border-radius:40px;

    border:1px solid rgba(255,255,255,.12);

}

.menu a{

    color:white;

    text-decoration:none;

    margin:0 18px;

    font-size:16px;

    font-weight:500;

    padding:8px 16px;

    border-radius:30px;

    transition:.3s;

}

.menu a:hover{

    color:#FFD54F;

    background:rgba(255,255,255,.10);

}

/* Active Page */

.menu a.active{

    background:#2E7D32;

    color:white;

}

/* Right Button */

.book{

    display:inline-block;

    background:white;

    color:#222;

    text-decoration:none;

    padding:12px 24px;

    border-radius:30px;

    font-weight:600;

    transition:.3s;

}

.book:hover{

    background:#FFD54F;

    transform:translateY(-4px);

}
.overlay{

    position:absolute;

    inset:0;

    background:rgba(0,0,0,.25);

    backdrop-filter:blur(3px);

}

.container{

    position:relative;

    z-index:2;

    width:1200px;

    max-width:95%;

    margin:auto;

}

h1{

    text-align:center;

    color:white;

    font-size:46px;

    margin-bottom:35px;

}

table{

    width:100%;

    border-collapse:collapse;

    overflow:hidden;

    border-radius:22px;

    background:rgba(255,255,255,.10);

    backdrop-filter:blur(18px);

    border:1px solid rgba(255,255,255,.15);

    box-shadow:0 20px 50px rgba(0,0,0,.35);

}

thead{

    background:rgba(255,255,255,.12);

}

th{

    color:#FFD54F;

    font-size:17px;

    padding:18px;

}

td{

    padding:18px;

    color:white;

    text-align:center;

    border-top:1px solid rgba(255,255,255,.08);

}

tbody tr{

    transition:.35s;

}

tbody tr:hover{

    background:rgba(255,255,255,.08);

}

.status{

    padding:7px 18px;

    border-radius:50px;

    font-size:14px;

    font-weight:600;

}

.pending{

    background:#FFD54F;

    color:#222;

}

.confirmed{

    background:#43A047;

    color:white;

}

.cancelled{

    background:#E53935;

    color:white;

}

.cancel-btn{

    text-decoration:none;

    padding:10px 18px;

    border-radius:30px;

    background:#E53935;

    color:white;

    transition:.3s;

}

.cancel-btn:hover{

    background:#B71C1C;

}

.empty{

    padding:60px;

    color:white;

    font-size:20px;

}

@media(max-width:900px){

.hero{

padding:20px;

}

table{

display:block;

overflow-x:auto;

}

h1{

font-size:34px;

}

}
.cancel-btn{

    display:inline-flex;

    align-items:center;

    justify-content:center;

    min-width:140px;

    padding:10px 18px;

    border-radius:50px;

    text-decoration:none;

    font-size:14px;

    font-weight:600;

    color:#fff;

    background:linear-gradient(135deg,#ef5350,#c62828);

    border:1px solid rgba(255,255,255,.15);

    box-shadow:0 8px 20px rgba(198,40,40,.35);

    transition:all .35s ease;

}

.cancel-btn:hover{

    background:linear-gradient(135deg,#e53935,#b71c1c);

    transform:translateY(-3px);

    box-shadow:0 12px 30px rgba(183,28,28,.45);

}

.cancel-btn:active{

    transform:scale(.96);

}
</style>

</head>

<body>

<div class="hero">
<div class="navbar">

    <div class="logo">
        Explore
    </div>

    <div class="menu">

        <a href="home">Home</a>

        <a href="tours">Tours</a>

        <a href="my-bookings" class="active">Bookings</a>

        <%
        User user = (User) session.getAttribute("user");

        if(user == null){
        %>

            <a href="login.jsp">Login</a>

            <a href="register.jsp">Register</a>

        <%
        }else{
        %>

            <a href="logout">Logout</a>

        <%
        }
        %>

    </div>

    <div>

        <a href="tours" class="book">

            Explore Tours ↗

        </a>

    </div>

</div>
    <div class="overlay"></div>
<div class="container">

<h1>My Bookings</h1>

<table>

<thead>

<tr>

<th>ID</th>

<th>Tour</th>

<th>Travel Date</th>

<th>People</th>

<th>Amount</th>

<th>Status</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%
if (bookings == null || bookings.isEmpty()) {
%>

<tr>
    <td colspan="7" style="text-align:center; padding:30px;">
        You haven't booked any tours yet.
    </td>
</tr>

<%
} else {

    for (Booking booking : bookings) {

        Tour tour = tourMap.get(booking.getTourId());
%>

<tr>

    <td>#<%=booking.getBookingId()%></td>

    <td><%=tour.getTitle()%></td>

    <td><%=booking.getTravelDate()%></td>

    <td><%=booking.getTotalPeople()%></td>

    <td>₹<%=booking.getTotalPrice()%></td>

    <td><%=booking.getBookingStatus()%></td>

    <td>

    <%
    if ("Pending".equals(booking.getBookingStatus())) {
    %>

        <a class="cancel-btn"
   href="cancel-booking?bookingId=<%=booking.getBookingId()%>"
   onclick="return confirm('Are you sure you want to cancel this booking?');">

    
    ✖ Cancel

</a>

    <%
    } else {
    %>

        -

    <%
    }
    %>

    </td>

</tr>

<%
    }
}
%>

</tbody>
</table>

</div>
</div>
</body>

</html>