<%@ page import="com.bogdanjmk.book_vista.dao.BookDAO" %>
<%@ page import="com.bogdanjmk.book_vista.dao.impl.BookDAOImpl" %>
<%@ page import="com.bogdanjmk.book_vista.db.DatabaseConnection" %>
<%@ page import="com.bogdanjmk.book_vista.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Recent Books</title>
    <%@include file="components/all_css.jsp"%>
</head>
<body>
<%@include file="components/navbar.jsp"%>
<h3 class="text-center mt-2">Recent Books</h3>
<div style="justify-content: space-around">
    <div class="row">
        <%
            BookDAO bookDAO = new BookDAOImpl(DatabaseConnection.getConnection());
            List<Book> recentBooks = bookDAO.getAllRecentBooks();

            for (Book recentBook : recentBooks) {
        %>
        <div class="col-md-3 card_hover card w-25">
            <div class="card-sl m-3">
                <div class="card-image">
                    <img src="books/<%= recentBook.getPhoto() %>" style="width: 150px; height: 200px" />
                </div>
                <a class="card-action" href="#"><i class="fa fa-heart"></i></a>
                <div class="card-heading">
                    <%= recentBook.getBook_name() %>
                </div>
                <div class="card-text">
                    Author:  <%= recentBook.getAuthor() %>
                </div>
                <div class="card-text">
                    Category:  <%= recentBook.getBook_category() %>
                </div>

                <div style="display: flex; flex-direction: row; gap: 10px">
                    <% if (recentBook.getBook_category().equals("OLD")) { %>
                    <a href="#" class="card-button"> View Details</a>
                    <a href="#" class="card-button"><i class="bi bi-currency-euro" style="margin-top: 3px;"></i>  <%= recentBook.getPrice() %></a>
                    <% } else { %>
                    <a href="#" class="card-button"> Purchase</a>
                    <a href="#" class="card-button"> View Details</a>
                    <a href="#" class="card-button"><i class="bi bi-currency-euro" style="margin-top: 3px;"></i>  <%= recentBook.getPrice() %></a>
                    <% }
                    %>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
