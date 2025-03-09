<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab Service</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100%;
            background-image: url('images/dark.png');
            background-size: cover;
            background-position: center 20%;
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


        .hero {
            text-align: center;
            padding: 100px 50px;
            background-color: rgba(244, 244, 244, 0);
            position: relative;
            z-index: 2;
            margin-top: 60px;
        }

        .hero h1 {
            font-size: 36px;
            color: #ffffff;
        }

        .hero p {
            font-size: 18px;
            color: #ffffff;
        }


        .btn {
            display: inline-block;
            padding: 15px 30px;
            background-color: #b59000;
            color: white;
            text-decoration: none;
            font-size: 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #a88000;
        }


        .footer {
            text-align: center;
            padding: 8px;
            background-color: #333;
            color: white;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            z-index: 2;
        }

    </style>
</head>
<body>
<div class="navbar">
    <a href="#">Home</a>
    <a href="about-us.jsp">About Us</a>
    <a href="services.jsp">Services</a>
    <a href="contactus.jsp">Contact</a>
</div>

<div class="hero">
    <h1>Welcome to MegaCity Cab</h1>
    <p>Fast & Easy Way to Rent a Car.</p>
    <a href="login.jsp" class="btn">Login</a>
</div>

<div class="footer">
    <p>&copy; 2025 Mega City Cab Service. All rights reserved.</p>
</div>
</body>
</html>