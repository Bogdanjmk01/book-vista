<%@ page import="com.bogdanjmk.book_vista.entity.User" %>
<%@ page import="com.bogdanjmk.book_vista.dao.BookOrderDAO" %>
<%@ page import="com.bogdanjmk.book_vista.dao.impl.BookOrderDAOImpl" %>
<%@ page import="com.bogdanjmk.book_vista.db.DatabaseConnection" %>
<%@ page import="com.bogdanjmk.book_vista.entity.BookOrder" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Your orders</title>
    <%@include file="components/all_css.jsp" %>
</head>
<body>

<c:if test="${empty userObj}">
    <c:redirect url="login.jsp" />
</c:if>

<%@include file="components/navbar.jsp" %>
<div class="container mt-5">
    <h3 class="text-center">Your Orders</h3>
    <table class="table w-100 fs-4 text-center">
        <thead class="table-dark">
        <tr>
            <th scope="col">Order Number</th>
            <th scope="col">Name</th>
            <th scope="col">Book Name</th>
            <th scope="col">Author</th>
            <th scope="col">Price</th>
            <th scope="col">Payment Type</th>
        </tr>
        </thead>
        <tbody>
        <%
            User user = (User) session.getAttribute("userObj");
            BookOrderDAO bookOrderDAO = new BookOrderDAOImpl(DatabaseConnection.getConnection());
            List<BookOrder> orders = bookOrderDAO.getOrders(user.getEmail());

            for (BookOrder order : orders) { %>
                <tr>
                    <th scope="row"><%= order.getOrderId() %></th>
                    <th><%= order.getUserName() %></th>
                    <th><%= order.getBookName()%></th>
                    <th><%= order.getAuthor()%></th>
                    <th><%= order.getPrice()%></th>
                    <th><%= order.getPaymentType()%></th>
                </tr>
            <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
