<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE jsp PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Mega City Cab Service</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100%;
            background-image: url('<c:url value="/images/aboutus.png"/>');
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
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

        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 20px;
        }


        header h1 {
            font-size: 36px;
            margin: 0;
        }



        .hero-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-position: center;
            filter: brightness(0.5);
        }

        .hero-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: white;
        }



        .hero-text p {
            font-size: 18px;
            margin-bottom: 40px;
        }

        .about-content {
            background-color: rgba(255, 255, 255, 0);
            max-width: 800px;
            margin: 0 auto;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 100px;
            border-radius: 8px;
            text-align: center;
        }

        .about-content img {
            width: 100vh;
            height: auto;
            margin-top: 30px;
            border-radius: 8px;
        }


        .about-content h2 {
            font-size: 32px;
            color: #ffffff;
        }

        .about-content p {
            font-size: 18px;
            line-height: 1.6;
            color: #ffffff;
            margin-top: 20px;
        }

        .footer {
            text-align: center;
            padding: 8px;
            background-color: #333;
            color: white;
            position: fixed;
            width: 100%;
            bottom: 0;
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
    <div class="hero-image"></div>
    <div class="hero-text">
        <h2></h2>
        <p></p>
    </div>
</header>

<div class="about-content">
    <h2>Who We Are</h2>
    <p>At Mega City Cab Service, we are dedicated to offering fast, comfortable, and reliable transportation solutions for our customers. Whether you're traveling across the city for business or leisure, we have a variety of cars to choose from, ensuring a smooth journey every time. Our drivers are professionally trained, and we pride ourselves on customer satisfaction.</p>
    <p>Our services are designed to fit your needs, with a focus on safety, reliability, and efficiency. Join us for a unique travel experience that’s both affordable and luxurious.</p>



    <img src="<c:url value='/images/aboutcar.png'/>" alt="Car Image">
</div>

<div class="footer">
    <p>&copy; 2025 Mega City Cab Service. All rights reserved.</p>
</div>

</body>
</html>
