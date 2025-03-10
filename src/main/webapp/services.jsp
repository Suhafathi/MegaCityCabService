<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE jsp PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services - Mega City Cab Service</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f4f9;
            background-image: url('<c:url value="/images/aboutus.png"/>');
        }


        .navbar {
            background-color: #333;
            padding: 15px;
            text-align: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 2;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 20px;
            margin: 0 10px;
            transition: 0.3s;
        }

        .navbar a:hover {
            background-color: #ae8b1c;
            border-radius: 5px;
        }

        .navbar a.active {
            background-color: #ae8b1c;
            border-radius: 5px;
        }

        header {
            background-color: rgba(51, 51, 51, 0);
            color: white;
            text-align: center;
            padding: 50px 0;
            margin-top: 70px;
        }

        header h1 {
            font-size: 36px;
        }

        .services-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            padding: 50px 20px;
            gap: 30px;
        }

        .service-card {
            background-color: white;
            width: 280px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .service-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 8px;
        }

        .service-card h3 {
            font-size: 24px;
            margin-top: 15px;
        }

        .service-card p {
            font-size: 16px;
            color: #777;
        }

        .footer {
            text-align: center;
            padding: 8px;
            background-color: #333;
            color: white;
        }
    </style>
</head>
<body>


<div class="navbar">
    <a href="index.jsp">Home</a>
    <a href="about-us.jsp">About Us</a>
    <a href="services.jsp">Services</a>
    <a href="contactus.jsp">Contact</a>
</div>

<header>
    <h1>Our Services</h1>
</header>

<div class="services-container">
    <div class="service-card">
        <img src="<c:url value='/images/service1.png'/>" alt="City Rides">
        <h3>City Rides</h3>
        <p>Enjoy a fast and comfortable ride within the city with Mega City Cab service.</p>
    </div>

    <div class="service-card">
        <img src="<c:url value='/images/service2.png'/>" alt="Long-Distance Trips">
        <h3>Long-Distance Trips</h3>
        <p>We also offer long-distance travel for both business and leisure trips.</p>
    </div>

    <div class="service-card">
        <img src="<c:url value='/images/service3.png'/>" alt="Airport Transfers">
        <h3>Airport Transfers</h3>
        <p>Need to get to the airport? Book a hassle-free ride with us today!</p>
    </div>
</div>

<div class="footer">
    <p>&copy; 2025 Mega City Cab Service. All rights reserved.</p>
</div>

</body>
</html>
