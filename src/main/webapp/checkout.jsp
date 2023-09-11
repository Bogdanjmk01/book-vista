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
    Double totalPrice = (Double) session.getAttribute("totalPrice");
%>
<div class="container py-5">
    <div class="row d-flex justify-content-center align-items-center">

        <c:if test="${not empty failed_order}">
            <p class="text-center text-danger alert alert-danger w-100 fs-3"><b>${failed_order}</b></p>
            <c:remove var="failed_order" scope="session" />
        </c:if>

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
                        <form action="order" method="post">
                            <div class="card-body p-md-5 text-black">
                                <h3 class="mb-4 text-uppercase">Delivery Info</h3>
                                <input type="hidden" value="<%= user.getId() %>" name="userId">
                                <input type="hidden" value="<%= totalPrice %>" name="totalPrice">
                                <div class="row">
                                        <div class="form-outline mb-4">
                                            <input type="text" id="form3Example1m" class="form-control form-control-lg" name="user_name" value="<%= user.getName() %>" required />
                                        </div>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="text" id="form3Example2" value="<%= user.getEmail() %>" name="email" class="form-control form-control-lg" required />
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="text" class="form-control form-control-lg" placeholder="Enter your address" name="address" />
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="text" class="form-control form-control-lg" name="phone_number" placeholder="Enter your phone number" value="<%= user.getPhone_number() %>" required />
                                </div>

                                <div class="row">
                                    <div class="form-group mb-4">
                                        <input type="text" class="form-control form-control-lg" placeholder="Enter a landmark" name="landmark">
                                    </div>

                                    <div class="form-group mb-4">
                                        <input type="text" class="form-control form-control-lg" placeholder="Enter your city" name="city" required>
                                    </div>

                                    <div class="form-group mb-4">
                                        <input type="text" class="form-control form-control-lg" placeholder="Enter your state" name="state" required>
                                    </div>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="text" id="form3Example3" placeholder="Enter your zip code" name="zip_code" class="form-control form-control-lg" required />
                                </div>

                                <div class="form-group">
                                    <select class="form-select form-select-lg mb-4" name="payment_method" aria-label=".form-select-lg example" required>
                                        <option value="noSelect" selected>--Select Payment Method--</option>
                                        <option value="COD">COD</option>
                                        <option value="PayPal">PayPal</option>
                                    </select>
                                </div>
                            </div>

                                <div class="d-flex justify-content-center mb-3">
                                    <button type="submit" class="btn btn-dark btn-lg">PLACE ORDER</button>
                                </div>

                             </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
