<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Mega City Cab Service</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #1d1f22;
            color: white;
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

        .contact-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            padding: 50px 20px;
            gap: 30px;
            text-align: center;
        }

        .contact-card {
            background-color: #2c3036;
            padding: 30px;
            width: 220px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .contact-card h3 {
            font-size: 24px;
            color: #ae8b1c;
            margin-bottom: 10px;
        }

        .contact-card p {
            font-size: 16px;
            color: #ccc;
            margin-bottom: 5px;
        }

        .contact-card i {
            font-size: 30px;
            color: #ae8b1c;
            margin-bottom: 15px;
        }


        .feedback-form {
            background-color: #2c3036;
            padding: 20px;
            border-radius: 10px;
            width: 50%;
            margin: 0 auto;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .feedback-form input,
        .feedback-form textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            font-size: 16px;
        }

        .feedback-form button {
            background-color: #ae8b1c;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
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


        .map-container {
            width: 100%;
            height: 400px;
            margin-top: 20px;
        }

        iframe {
            width: 100%;
            height: 100%;
            border: 0;
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
    <h1>Let us help you</h1>
</header>






<div class="contact-container">
    <div class="contact-card">
        <i class="fas fa-map-marker-alt"></i>
        <h3>ADDRESS</h3>
        <p>Waidya Road,<br>Dehiwala, NY 120</p>
    </div>

    <div class="contact-card">
        <i class="fas fa-envelope"></i>
        <h3>EMAIL</h3>
        <p>Contact@megacitycab.com<br>Support@megacitycab.com</p>
    </div>

    <div class="contact-card">
        <i class="fas fa-phone-alt"></i>
        <h3>PHONE</h3>
        <p>+94 743520371<br>+94 779800370</p>
    </div>

    <div class="contact-card">
        <i class="fas fa-clock"></i>
        <h3>WORKING HOURS</h3>
        <p>Mon - Fri: 9 AM - 11 PM<br>Sat - Sun: 8 AM - 6 PM</p>
    </div>
</div>


<div class="feedback-form">
    <h2>Your Feedback</h2>
    <form action="submitFeedback" method="POST">
        <input type="text" name="name" placeholder="Your Name" required><br>
        <input type="email" name="email" placeholder="Your Email" required><br>
        <textarea name="message" placeholder="Your Message" rows="5" required></textarea><br>
        <button type="submit">Submit Feedback</button>
    </form>
</div>


<div class="map-container">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3153.335639451564!2d-122.08385128469508!3d37.386051779831636!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fb5d6b78f7f2b%3A0x405a271888c9d853!2sGoogleplex!5e0!3m2!1sen!2sus!4v1601099845599!5m2!1sen!2sus" allowfullscreen="" loading="lazy"></iframe>
</div>

<div class="footer">
    <p>&copy; 2025 Mega City Cab Service. All rights reserved.</p>
</div>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>


<c:if test="${param.success != null}">
    <script>
        alert("Thank you for your feedback!");
    </script>
</c:if>

</body>
</html>
