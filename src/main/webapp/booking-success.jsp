<%@page import="com.tour.tour_management_system.entity.Tour"%>
<%@page import="com.tour.tour_management_system.entity.Booking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
Booking booking = (Booking) request.getAttribute("booking");
Tour tour = (Tour) request.getAttribute("tour");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Booking Confirmed</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">
<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{

    min-height:100vh;

    padding:20px;

    overflow-y:auto;

    display:flex;

    justify-content:center;

    align-items:center;

    background:
    linear-gradient(rgba(7,12,20,.82),rgba(7,12,20,.82)),
    url("images/tour4.jpg");

    background-size:cover;

    background-position:center;

}
.success-container{

    width:100%;

    display:flex;

    justify-content:center;

    align-items:center;

    padding:20px;

}

.success-card{

     width:550px;

    max-width:95%;

    overflow:visible;

    background:rgba(20,30,40,.55);

    backdrop-filter:blur(20px);

    border:1px solid rgba(255,255,255,.08);

    border-radius:22px;

    padding:22px;

    text-align:center;

    color:#fff;

    box-shadow:0 20px 60px rgba(0,0,0,.45);

    animation:fadeUp .6s ease;

}

.success-icon{

    width:70px;

    height:70px;

    margin:auto;

    border-radius:50%;

    background:linear-gradient(135deg,#4CAF50,#2E7D32);

    display:flex;

    justify-content:center;

    align-items:center;

    font-size:34px;

    font-weight:bold;

    box-shadow:0 10px 25px rgba(76,175,80,.45);

}

.success-card h1{

    margin-top:12px;

    font-size:28px;

    font-weight:600;

}

.subtitle{

    margin:8px auto 16px;

    font-size:13px;

    color:#ddd;

    line-height:1.5;

    max-width:520px;

}

.tour-image{

    width:100%;

    height:150px;

    border-radius:18px;

    overflow:hidden;

    margin-bottom:15px;

}

.tour-image img{

    width:100%;

    height:100%;

    object-fit:cover;

}

.success-card h2{

    font-size:24px;

    color:#FFD54F;

    margin-bottom:16px;

}

.booking-details{

    display:grid;

    grid-template-columns:repeat(2,1fr);

    gap:12px;

    margin-bottom:20px;

}

.detail-box{

    background:rgba(255,255,255,.08);

    border-radius:14px;

    padding:14px;

    transition:.3s;

}

.detail-box:hover{

    transform:translateY(-3px);

    background:rgba(255,255,255,.13);

}

.detail-box span{

    display:block;

    font-size:12px;

    color:#cfcfcf;

    margin-bottom:6px;

}

.detail-box strong{

    font-size:18px;

    color:#fff;

}

.status{

    color:#FFD54F;

}

.button-group{

    display:flex;

    gap:15px;

}

.button-group a{

    flex:1;

    text-decoration:none;

    padding:13px;

    border-radius:40px;

    font-size:15px;

    font-weight:600;

    transition:.3s;

}

.primary-btn{

    background:#2E7D32;

    color:#fff;

}

.primary-btn:hover{

    background:#1B5E20;

    transform:translateY(-3px);

}

.secondary-btn{

    background:#fff;

    color:#222;

}

.secondary-btn:hover{

    background:#FFD54F;

    transform:translateY(-3px);

}

@keyframes fadeUp{

    from{

        opacity:0;

        transform:translateY(40px);

    }

    to{

        opacity:1;

        transform:translateY(0);

    }

}

@media(max-width:768px){

body{

    overflow:auto;

}

.success-card{

    width:95%;

    max-height:none;

}

.booking-details{

    grid-template-columns:1fr;

}

.button-group{

    flex-direction:column;

}

.tour-image{

    height:140px;

}

}
</style>

</head>

<body>

<div class="success-container">

    <div class="success-card">

        <div class="success-icon">
            ✓
        </div>

        <h1>Booking Confirmed</h1>

        <p class="subtitle">
            Your booking has been successfully placed.
            We can't wait to take you on your next adventure.
        </p>

        <div class="tour-image">

            <img src="<%=tour.getImage()%>">

        </div>

        <h2><%=tour.getTitle()%></h2>

        <div class="booking-details">

            <div class="detail-box">

                <span>Booking ID</span>

                <strong>#<%=booking.getBookingId()%></strong>

            </div>

            <div class="detail-box">

                <span>Travel Date</span>

                <strong><%=booking.getTravelDate()%></strong>

            </div>

            <div class="detail-box">

                <span>Total Travellers</span>

                <strong><%=booking.getTotalPeople()%></strong>

            </div>

            <div class="detail-box">

                <span>Total Amount</span>

                <strong>₹ <%=booking.getTotalPrice()%></strong>

            </div>

            <div class="detail-box status-box">

                <span>Status</span>

                <strong class="status">

                    <%=booking.getBookingStatus()%>

                </strong>

            </div>

        </div>

        <div class="button-group">

            <a href="my-bookings" class="primary-btn">

                My Bookings

            </a>

            <a href="home" class="secondary-btn">

                Back Home

            </a>

        </div>

    </div>

</div>

</body>

</html>