<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Settings Page</title>
    <%@include file="components/all_css.jsp" %>
    <style>
        a {
            text-decoration: none;
            color: #3b3737;
        }

        a:hover {
            text-decoration: none;
        }
    </style>
</head>
<body style="background-color: #f7f7f7">

<c:if test="${empty userObj}">
    <c:redirect url="login.jsp" />
</c:if>

<%@include file="components/navbar.jsp" %>
<div>
    <c:if test="${not empty userObj}">
        <h3 class="text-center">Hello, ${userObj.name}</h3>
    </c:if>
    <div class="row p-5">
        <div class="col-md-6 mt-3">
            <a href="sell_book.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div style="overflow: hidden">
                            <i class="bi bi-book-half fs-3"></i>
                        </div>
                        <h3>Sell an Old Book</h3>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-6 mt-3">
            <a href="edit_profile.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div style="overflow: hidden">
                            <i class="bi bi-shield-fill-exclamation fs-3"></i>
                        </div>
                        <h3>Login & Security (Edit Profile)</h3>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-6 mt-3">
            <a href="user_address.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div style="overflow: hidden">
                            <i class="bi bi-geo-alt fs-3"></i>
                        </div>
                        <h3>Your Address</h3>
                        <p>Edit Address</p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-6 mt-3">
            <a href="orders.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div style="overflow: hidden">
                            <i class="bi bi-box2-heart fs-3"></i>
                        </div>
                        <h3>My Order</h3>
                        <p>Track Your Order</p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-6 mt-3">
            <a href="help_line.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div style="overflow: hidden">
                            <i class="bi bi-person-vcard fs-3"></i>
                        </div>
                        <h3>Help Center</h3>
                        <p>24/7 Service</p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>

<div style="margin-top: 80px;">
    <%@include file="components/footer.jsp" %>
</div>
</body>
</html>
