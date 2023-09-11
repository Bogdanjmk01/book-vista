<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Edit Profile</title>
    <%@include file="components/all_css.jsp" %>
    <style>
        .login-box {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 400px;
            padding: 40px;
            transform: translate(-50%, -50%);
            background: rgba(0, 0, 0, 0.7);
            box-sizing: border-box;
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.6);
            border-radius: 10px;
        }

        .login-box h2 {
            margin: 0 0 30px;
            padding: 0;
            color: #fff;
            text-align: center;
        }

        .login-box .user-box {
            position: relative;
        }

        .login-box .user-box input {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
        }

        .login-box .user-box label {
            position: absolute;
            top: 0;
            left: 0;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            pointer-events: none;
            transition: 0.5s;
        }

        .login-box .user-box input:focus~label,
        .login-box .user-box input:valid~label {
            top: -13px;
            left: 0;
            color: #fafafa;
            font-size: 10px;
        }

        .login-link {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px 20px;
            color: #fafafa;
            font-size: 16px;
            text-decoration: none;
            text-transform: uppercase;
            overflow: hidden;
            transition: 0.5s;
            margin-top: 40px;
            letter-spacing: 4px;
        }

        .login-link:hover {
            background: black;
            color: #c0c0c0;
            border-radius: 5px;
        }

        .login-box a span {
            position: absolute;
            display: block;
        }

        .login-box a span:nth-child(1) {
            top: 0;
            left: -100%;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent);
            animation: btn-anim1 1s linear infinite;
        }

        .login-box a span:nth-child(2) {
            top: -100%;
            right: 0;
            width: 2px;
            height: 100%;
            background: linear-gradient(180deg, transparent);
            animation: btn-anim2 1s linear infinite;
            animation-delay: 0.25s;
        }

        .login-box a span:nth-child(3) {
            bottom: 0;
            right: -100%;
            width: 100%;
            height: 2px;
            background: linear-gradient(270deg, transparent);
            animation: btn-anim3 1s linear infinite;
            animation-delay: 0.5s;
        }

        .login-box a span:nth-child(4) {
            bottom: -100%;
            left: 0;
            width: 2px;
            height: 100%;
            background: linear-gradient(360deg, transparent);
            animation: btn-anim4 1s linear infinite;
            animation-delay: 0.75s;
        }

        .error-msg {
            margin: 10px 0;
            display: block;
            background: crimson;
            color: #fff;
            border-radius: 5px;
            font-size: 20px;
            padding: 10px;
        }

        .register-button {
            padding: 15px 40px;
            margin-left: 5.5rem;
            background: #080808;
            /* darkest black */
            font-weight: bold;
            color: #f9f9f9;
            /* off-white */
            cursor: pointer;
            border-radius: 10px
        }

        .register-button:hover {
            color: #080808;
            background: #AAAAAA;
            transition: 0.8s;
        }
    </style>
</head>
<body>

<c:if test="${empty userObj}">
    <c:redirect url="login.jsp" />
</c:if>

<%@include file="components/navbar.jsp" %>

<c:if test="${not empty success_message}">
    <p class="text-center text-success alert alert-success w-100"><b>${success_message}</b></p>
    <c:remove var="success_message" scope="session" />
</c:if>

<c:if test="${not empty failed_message}">
    <p class="text-center text-danger alert alert-danger w-100"><b>${failed_message}</b></p>
    <c:remove var="failed_message" scope="session" />
</c:if>

<div class="login-box">
    <h2>Edit Profile</h2>
    <form method="post" action="update_profile">
        <input type="hidden" name="userId" value="${userObj.id}">
        <div class="user-box">
            <input type="text" name="name" required value="${userObj.name}">
            <label>Enter Your Full Name</label>
        </div>

        <div class="user-box">
            <input type="text" name="email" required value="${userObj.email}">
            <label>Email</label>
        </div>

        <div class="user-box">
            <input type="text" name="phone_number" required value="${userObj.phone_number}">
            <label>Phone Number</label>
        </div>

        <div class="user-box">
            <input type="password" name="password">
            <label>Password</label>
        </div>

        <div>&nbsp;</div>

        <button type="submit" name="submit" class="register-button">
            Save Profile
        </button>

        <div>&nbsp;</div>
    </form>
</div>

</body>
</html>
