<%@ page import="com.bogdanjmk.book_vista.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <%@include file="components/all_css.jsp" %>
    <style>
        .title-style{
            font-family: Georgia, 'Times New Roman', Times, serif;
            font-weight: 700;
            font-size: 20px;
            color: hsl(52, 0%, 98%);
        }

        .title-quote{
            font-family: Georgia, 'Times New Roman', Times, serif;
            font-weight: 400;
            color: hsl(52, 0%, 98%);
        }
    </style>
</head>
<body>

<c:if test="${empty userObj}">
    <c:redirect url="login.jsp" />
</c:if>

<%@include file="components/navbar.jsp" %>
<%
    User user = (User) session.getAttribute("userObj");

%>
<div class="container py-5">
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col">
            <div class="card my-4 shadow-3">
                <div class="row g-0">
                    <div class="col-xl-4 d-xl-block bg-image">
                        <img src="https://mdbcdn.b-cdn.net/img/Others/extended-example/delivery.webp" style="height: 50%; width: 100%" alt="Sample photo" />
                        <div class="mask" style="background-color: rgba(0, 0, 0, 0.6)">
                            <div class=" justify-content-center align-items-center h-25">
                                <div class=" text-center" style="margin-top: 20px;">
                                    <i class="fas fa-truck text-white fa-3x"></i>
                                    <p class="text-white title-style">Lorem ipsum delivery</p>
                                    <p class="text-white mb-0"></p>

                                    <figure class="text-center mb-0">
                                        <blockquote class="blockquote text-white">
                                            <p>
                                                <i class="fas fa-quote-left fa-xs text-primary"
                                                   style="color: hsl(210, 100%, 50%) ;"></i>
                                                <span class="lead font-italic">Everything at your doorstep.</span>
                                                <i class="fas fa-quote-right fa-xs text-primary"
                                                   style="color: hsl(210, 100%, 50%) ;"></i>
                                            </p>
                                        </blockquote>

                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="card-body p-md-5 text-black">
                            <h3 class="mb-4 text-uppercase">Delivery Info</h3>

                            <div class="row">
                                    <div class="form-outline mb-4">
                                        <input type="text" id="form3Example1m" class="form-control form-control-lg" value="<%= user.getName() %>" disabled />
                                    </div>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="text" id="form3Example2" disabled value="<%= user.getEmail() %>" class="form-control form-control-lg" />
                            </div>

                            <div class="form-outline mb-4">
                                <input type="text" class="form-control form-control-lg" placeholder="Enter your address" />
                            </div>

                            <div class="form-outline mb-4">
                                <input type="text" class="form-control form-control-lg" placeholder="Enter your phone number" value="<%= user.getPhone_number() %>" />
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <select class="form-select form-select-lg mb-4" name="status" aria-label=".form-select-lg example">
                                        <option selected>--Select--</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <select class="form-select form-select-lg mb-4" name="status" aria-label=".form-select-lg example">
                                        <option selected>--Select--</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="text" id="form3Example3" placeholder="Enter your zip code" class="form-control form-control-lg" />
                            </div>

                            <div class="form-group">
                                <select class="form-select form-select-lg mb-4" name="payment_method" aria-label=".form-select-lg example">
                                    <option selected>--Select Payment Method--</option>
                                    <option value="Active">COD</option>
                                    <option value="Inactive">PayPal</option>
                                </select>
                            </div>
                        </div>

                            <div class="d-flex justify-content-center mb-3">
                                <button type="button" class="btn btn-dark btn-lg">PLACE ORDER</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
