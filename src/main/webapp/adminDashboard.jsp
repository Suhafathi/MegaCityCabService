<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: rgb(255, 255, 255);
            display: flex;
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


        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #ae8b1c;
            color: white;
            padding-top: 20px;
            display: flex;
            flex-direction: column;
            position: fixed;
        }

        .sidebar h2 {
            color: #ffffff;
            text-align: center;
            margin-bottom: 40px;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar li {
            margin: 20px 0;
        }

        .sidebar a {
            color: #ffffff;
            text-decoration: none;
            padding: 10px;
            display: block;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #ecc748;
        }


        .main-content {
            margin-left: 250px;
            width: 100%;
            padding: 20px;
            margin-top: 40px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #2e2c2c;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
            color: #ffffff;
        }

        .header .user-info {
            display: flex;
            align-items: center;
        }

        .header .user-info img {
            border-radius: 50%;
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }

        .user-info span {
            font-size: 18px;
        }


        .card-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .card {
            background-color: #ffffff;
            width: 30%;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            font-size: 18px;
            color: #333;
        }

        .card h3 {
            margin: 10px 0;
            color: #ae8b1c;
        }

        .card p {
            font-size: 24px;
            color: #ae8b1c;
        }


        .profile-img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
        }


        .overview {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .overview .section {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 48%;
        }


        .overview .section h3 {
            color: #333;
            margin-bottom: 15px;
        }

        .overview .section ul {
            list-style-type: none;
            padding: 0;
        }

        .overview .section ul li {
            font-size: 18px;
            color: #333;
            padding: 5px 0;
        }



        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
            }
            .card-container {
                flex-direction: column;
                align-items: center;
            }
            .card {
                width: 80%;
                margin-bottom: 20px;
            }
            .overview {
                flex-direction: column;
            }
            .overview .section {
                width: 100%;
                margin-bottom: 20px;
            }
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


<div class="sidebar">
    <h2></h2>
    <ul>
        <li><a href="manageCars">Cars</a></li>
        <li><a href="manageDrivers">Drivers</a></li>
        <li><a href="manageBookings">View Bookings</a></li>
        <li><a href="calculateBill">View Payments</a></li>
        <li><a href="logout">Logout</a></li>
    </ul>
</div>

<div class="navbar">
    <a href="index.jsp">Home</a>
    <a href="about-us.jsp">About Us</a>
    <a href="services.jsp">Services</a>
    <a href="contactus.jsp">Contact</a>
</div>


<div class="main-content">

    <div class="header">
        <h1>Admin Dashboard</h1>
        <div class="user-info">
            <img src="images/admin.png" alt="Admin" class="profile-img">
            <span>Welcome, Admin</span>
        </div>
    </div>


    <div class="card-container">
        <div class="card">
            <h3>Total Bookings</h3>
            <p>123</p>
        </div>
        <div class="card">
            <h3>Total Drivers</h3>
            <p>45</p>
        </div>
        <div class="card">
            <h3>Revenue</h3>
            <p>$10,000</p>
        </div>
    </div>


    <div class="overview">

        <div class="section">
            <h3>Recent Activity</h3>
            <ul>
                <li>New booking from John Doe</li>
                <li>Driver David approved</li>
                <li>Booking #123 completed</li>
            </ul>
        </div>


        <div class="section">
            <h3>Notifications</h3>
            <ul>
                <li>Booking #124 has been cancelled</li>
                <li>New driver application pending</li>
                <li>Payment overdue for Booking #122</li>
            </ul>
        </div>
    </div>


</div>
<div class="footer">
    <p>&copy; 2025 Mega City Cab Service. All rights reserved.</p>
</div>

</body>
</html>
