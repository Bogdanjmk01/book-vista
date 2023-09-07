<%@ page import="com.bogdanjmk.book_vista.dao.BookDAO" %>
<%@ page import="com.bogdanjmk.book_vista.dao.impl.BookDAOImpl" %>
<%@ page import="com.bogdanjmk.book_vista.db.DatabaseConnection" %>
<%@ page import="com.bogdanjmk.book_vista.entity.Book" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@include file="components/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2">
<%@include file="components/navbar.jsp" %>

<%
    Long id = Long.parseLong(request.getParameter("id"));
    BookDAO bookDAO = new BookDAOImpl(DatabaseConnection.getConnection());
    Book book = bookDAO.getBookById(id);
%>

<div class="container p-3">
   <div class="row p-5">
       <div class="col-md-6 text-center p-5 border bg-white">
            <img src="books/<%= book.getPhoto() %>" style="height: 150px; width: 150px;"><br>
            <h4>Book Name: <%= book.getBook_name() %></h4>
            <h4>Author: <%= book.getAuthor() %></h4>
            <h4>Category: <%= book.getBook_category() %></h4>
       </div>

       <div class="col-md-6 text-center p-5 border bg-white">
           <h2><%= book.getBook_name() %></h2>
           <%
                if("OLD".equals(book.getBook_category())) {%>
                    <h5 class="text-primary">Contact Seller:</h5>
                    <h5 class="text-primary"><i class="bi bi-envelope-fill bi-2x me-3"></i> Email: <%= book.getEmail()%></h5>
                <%}
           %>
           <div class="row">
               <div class="col-md-4 text-center p-2">
                   <i class="fas fa-money-bill-wave fa-2x"></i>
                   <p class="mt-1">COD (Cash On Delivery)</p>
               </div>
               <div class="col-md-4 text-center p-2">
                    <i class="fas fa-undo-alt fa-2x"></i>
                    <p class="mt-1">Return Available</p>
               </div>
               <div class="col-md-4 text-center p-2">
                    <i class="fas fa-truck-moving fa-2x"></i>
                    <p class="mt-1">Free Shipping</p>
               </div>
           </div>

           <%
               if ("OLD".equals(book.getBook_category())) {%>
                   <div class="text-center p-3">
                       <a href="index.jsp" class="btn btn-outline-primary"><i class="bi bi-cart4"></i> Continue Shopping</a>
                   </div>
               <%} else { %>
                   <div class="text-center p-3">
                       <a href="index.jsp" class="btn btn-outline-dark"><i class="bi bi-cart4"></i> Add to Cart</a>
                       <button class="btn btn-outline-secondary" disabled><i class="bi bi-currency-euro"></i> <%= book.getPrice() %></button>
                   </div>
           <%
               }
           %>
       </div>
   </div>
</div>
</body>
</html>
