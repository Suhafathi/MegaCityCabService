<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Mega City Cab Service</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #353333;
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

        .login-container {
            display: flex;
            height: 80%;
            width: 80%;
            max-width: 1200px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .left-side {
            background-color: #000;
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .right-side {
            flex: 1;
            padding: 40px 40px 40px 80px;
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .jeep-image {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translateX(10%) translateY(-50%);
            width: 90%;
            height: auto;
            object-fit: contain;
            opacity: 0.9;
        }

        .right-side h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
            width: 100%;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #ae8b1c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .form-group button:hover {
            background-color: #ae8b1c;
        }

        .register-link {
            margin-top: 15px;
            font-size: 14px;
        }

        .register-link a {
            color: #063767;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
            }
            .left-side, .right-side {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<c:if test="${not empty errorMessage}">
    <script>
        alert("${errorMessage}");
    </script>
</c:if>

<div class="navbar">
    <a href="index.jsp">Home</a>
    <a href="about-us.jsp">About Us</a>
    <a href="services.jsp">Services</a>
    <a href="contactus.jsp">Contact</a>
</div>

<div class="login-container">

    <div class="left-side">
        <img class="jeep-image" src="images/jeep.png" alt="Cab Image">
    </div>

    <div class="right-side">
        <h2>Login</h2>
        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <select id="role" name="role" required>
                    <option value="">Select Role</option>
                    <option value="admin">Admin</option>
                    <option value="customer">Customer</option>
                    <option value="driver">Driver</option>
                </select>
            </div>
            <div class="form-group">
                <button type="submit">Login</button>
            </div>
        </form>

        <div class="register-link">
            <p>Don't have an account? <a href="registerCustomer.jsp">Register as Customer</a>
                </p>
        </div>
    </div>
</div>




</body>
</html>
