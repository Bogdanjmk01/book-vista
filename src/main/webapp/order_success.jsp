<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Order Success</title>
    <%@include file="components/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2">

<c:if test="${empty userObj}">
    <c:redirect url="login.jsp" />
</c:if>

<%@include file="components/navbar.jsp" %>

<div class="container text-center mt-5">
    <i class="fas fa-check-circle fa-5x text-success"></i>
    <h1>Thank You</h1>
    <h2>Your order was successfully placed</h2>
    <h5>We will make sure to reach to you whenever we send the package to the shipper</h5>
    <a href="index.jsp" class="btn btn-outline-secondary mt-3">Home</a>
    <a href="user_order.jsp" class="btn btn-outline-danger mt-3">View Order</a>
</div>
</body>
</html>
