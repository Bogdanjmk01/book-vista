<%@ page import="com.bogdanjmk.book_vista.dao.CartDAO" %>
<%@ page import="com.bogdanjmk.book_vista.dao.impl.CartDAOImpl" %>
<%@ page import="com.bogdanjmk.book_vista.db.DatabaseConnection" %>
<%@ page import="com.bogdanjmk.book_vista.entity.User" %>
<%@ page import="com.bogdanjmk.book_vista.entity.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bogdanjmk.book_vista.entity.Book" %>
<%@ page import="com.bogdanjmk.book_vista.dao.BookDAO" %>
<%@ page import="com.bogdanjmk.book_vista.dao.impl.BookDAOImpl" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Cart</title>
    <%@include file="components/all_css.jsp" %>
    <style>
        .card {
            margin: auto;
            max-width: 950px;
            width: 90%;
            box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 1rem;
            border: transparent;
        }
        @media(max-width:767px){
            .card{
                margin: 3vh auto;
            }
        }

        .cart{
            background-color: #fff;
            padding: 4vh 5vh;
            border-bottom-left-radius: 1rem;
            border-top-left-radius: 1rem;
        }

        @media(max-width:767px){
            .cart{
                padding: 4vh;
                border-bottom-left-radius: unset;
                border-top-right-radius: 1rem;
            }
        }

        .summary{
            background-color: #ddd;
            border-top-right-radius: 1rem;
            border-bottom-right-radius: 1rem;
            padding: 4vh;
            color: rgb(65, 65, 65);
        }

        @media(max-width:767px){
            .summary{
                border-top-right-radius: unset;
                border-bottom-left-radius: 1rem;
            }
        }

        .summary .col-2{
            padding: 0;
        }

        .summary .col-10
        {
            padding: 0;
        }

        .row{
             margin: 0;
         }

        .title b{
            font-size: 1.5rem;
        }

        .main{
            margin: 0;
            padding: 2vh 0;
            width: 100%;
        }

        .col-2, .col{
            padding: 0 1vh;
        }

        a{
            padding: 0 1vh;
        }

        .close{
            margin-left: auto;
            font-size: 0.7rem;
        }

        img{
            width: 3.5rem;
        }

        .back-to-shop{
            margin-top: 4.5rem;
        }

        h5{
            margin-top: 4vh;
        }

        hr{
            margin-top: 1.25rem;
        }

        form{
            padding: 2vh 0;
        }

        select{
            border: 1px solid rgba(0, 0, 0, 0.137);
            padding: 1.5vh 1vh;
            margin-bottom: 4vh;
            outline: none;
            width: 100%;
            background-color: rgb(247, 247, 247);
        }

        input{
            border: 1px solid rgba(0, 0, 0, 0.137);
            outline: none;
            width: 100%;
            background-color: rgb(247, 247, 247);
        }

        input:focus::-webkit-input-placeholder
        {
            color:transparent;
        }

        a{
            color: black;
        }

        a:hover{
            color: black;
            text-decoration: none;
        }

        #code{
            background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253) , rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
            background-repeat: no-repeat;
            background-position-x: 95%;
            background-position-y: center;
        }
    </style>
</head>
<body style="background-color: #f7f7f7">
<%@include file="components/navbar.jsp" %>

<c:if test="${empty userObj}">
    <c:redirect url="login.jsp" />
</c:if>

<c:if test="${not empty success_message}">
    <p class="text-center text-success alert alert-success w-100"><b>${success_message}</b></p>
    <c:remove var="success_message" scope="session" />
</c:if>

<c:if test="${not empty failed_message}">
    <p class="text-center text-danger alert alert-danger w-100"><b>${failed_message}</b></p>
    <c:remove var="failed_message" scope="session" />
</c:if>

<c:if test="${not empty failed_order}">
    <p class="text-center text-danger alert alert-danger w-100"><b>${failed_order}</b></p>
    <c:remove var="failed_order" scope="session" />
</c:if>

<div class="card">
    <div class="row">
        <div class="col-md-8 cart">
            <div class="title">
                <div class="row">
                    <div class="col"><h4><b>Shopping Cart</b></h4></div>
                    <%
                        User user = (User) session.getAttribute("userObj");

                        CartDAO cartDAO = new CartDAOImpl(DatabaseConnection.getConnection());
                        BookDAO bookDAO = new BookDAOImpl(DatabaseConnection.getConnection());
                        List<Cart> carts = cartDAO.getCartByUserId(user.getId());
                        int numberOfItemsInTheCart = cartDAO.getNumberOfItemsInTheCart(user.getId());
                        double totalPrice = 0.00;

                        for (Cart cart : carts) {
                        Book book = bookDAO.getBookById(cart.getBookId());
                        totalPrice = cart.getTotalPrice();
                    %>
                            <div class="row border-top border-bottom">
                                <div class="row main align-items-center">
                                    <div class="col-2"><img class="img-fluid" src="books/<%= book.getPhoto() %>"></div>
                                    <div class="col">
                                        <div class="row text-muted"><%= cart.getAuthor() %></div>
                                        <div class="row"> <%= cart.getBookName() %></div>
                                    </div>
                                    <div class="col">&euro; <%= cart.getPrice() %> <a href="remove_book?bookId=<%= cart.getBookId() %>&&userId=<%= cart.getUserId() %>&&cartId=<%= cart.getId() %>" class="close fs-5">&#10005;</a></div>
                                </div>
                            </div>

                    <%
                        }

                        session.setAttribute("totalPrice", totalPrice + 5);
                    %>
                    <div class="col align-self-center text-right text-muted"> </div>
                </div>
            </div>

            <div class="back-to-shop"><a href="index.jsp">&leftarrow;</a><span class="text-muted">Back to shop</span></div>
        </div>
        <div class="col-md-4 summary">
            <div><h5><b>Summary</b></h5></div>
            <hr>
            <div class="row">
                <div class="col" style="padding-left:0;"><%= numberOfItemsInTheCart %></div>
                <div class="col text-right">&euro; <%= totalPrice %></div>
            </div>
            <form>
                <p>SHIPPING</p>
                <select><option class="text-muted">Standard-Delivery- &euro;5.00</option></select>
                <p>GIVE CODE</p>
                <input id="code" placeholder="Enter your code">
            </form>
            <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                <div class="col">TOTAL PRICE</div>
                <div class="col text-right">&euro; <%= totalPrice + 5 %></div>
            </div>
            <%
                if (numberOfItemsInTheCart == 0) {%>
               <button disabled href="checkout.jsp" class="btn btn-dark w-100">CHECKOUT</button>
            <%
                } else {%>
                <a href="checkout.jsp" class="btn btn-dark w-100">CHECKOUT</a>
            <%
                }
            %>
        </div>
    </div>

</div>
</body>
</html>
