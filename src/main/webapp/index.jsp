<%@ page import="com.bogdanjmk.book_vista.db.DatabaseConnection" %>
<%@ page import="com.bogdanjmk.book_vista.dao.BookDAO" %>
<%@ page import="com.bogdanjmk.book_vista.dao.impl.BookDAOImpl" %>
<%@ page import="com.bogdanjmk.book_vista.entity.Book" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Book-Vista</title>
    <%@include file="components/all_css.jsp" %>

    <style>
        .back-img {
            background: url("images/home_book.jpg") no-repeat;
            height: 50vh;
            width: 100%;
            background-size: cover;
        }

        h1 {
            color: #edeef2;
        }
    </style>
</head>
<body style="background-color: #f7f7f7">
<%@include file="components/navbar.jsp" %>

<div class="back-img">
    <h1 class="text-center"><b><i class="bi bi-book-fill"></i> Welcome to Book Vista</b></h1>
</div>

<!-- Recent Books Section -->
<div>
    <h3 class="text-center mt-2">Recent Books</h3>
    <div class="container card" style="margin-top: 50px; justify-content: space-around">
        <div class="row">
            <%
                BookDAO bookDAO = new BookDAOImpl(DatabaseConnection.getConnection());
                List<Book> recentBooks = bookDAO.getRecentBooks();

                for (Book recentBook : recentBooks) {
            %>
            <div class="col-md-3 card_hover">
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
                            <a href="view_books.jsp?id=<%= recentBook.getId() %>" class="card-button"> View Details</a>
                            <a href="#" class="card-button"><i class="bi bi-currency-euro" style="margin-top: 3px;"></i>  <%= recentBook.getPrice() %></a>
                        <% } else { %>
                            <a href="#" class="card-button"> Purchase</a>
                            <a href="view_books.jsp?id=<%= recentBook.getId() %>" class="card-button"> View Details</a>
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

    <div class="text-center mt-3 mb-2">
        <a href="all_recent_books.jsp" class="btn btn-outline-primary btn-lg">View All</a>
    </div>
</div>
<!-- End of Recent Books Section -->

<!-- New Books Section -->
<div>
    <h3 class="text-center mt-5">New Books</h3>
    <div class="container card" style="margin-top: 50px; justify-content: space-evenly;">
        <div class="row">
            <%
                BookDAO bookDAO2 = new BookDAOImpl(DatabaseConnection.getConnection());
                List<Book> newBooks = bookDAO2.getNewBooks();

                for (Book newBook : newBooks) {%>
                    <div class="col-md-3 card_hover">
                        <div class="card-sl m-3">
                            <div class="card-image">
                                <img src="books/<%= newBook.getPhoto() %>" style="width: 150px; height: 200px" />
                            </div>
                            <a class="card-action" href="#"><i class="fa fa-heart"></i></a>
                            <div class="card-heading">
                                <%= newBook.getBook_name() %>
                            </div>
                            <div class="card-text">
                               Author:  <%= newBook.getAuthor() %>
                            </div>
                            <div class="card-text">
                               Category:  <%= newBook.getBook_category() %>
                            </div>
                            <div style="display: flex; flex-direction: row; gap: 10px">
                                <a href="#" class="card-button"> Purchase</a>
                                <a href="view_books.jsp?id=<%= newBook.getId() %>" class="card-button"> View Details</a>
                                <a href="#" class="card-button"><i class="bi bi-currency-euro" style="margin-top: 3px;"></i>  <%= newBook.getPrice() %></a>
                            </div>
                        </div>
                    </div>
                <%}
            %>

        </div>

        <div class="text-center mt-3 mb-2">
            <a href="all_new_books.jsp" class="btn btn-outline-primary btn-lg">View All</a>
        </div>
    </div>
</div>
<!-- End of New Books Section -->

<!-- Old Books Section -->
<div class="mb-3">
    <h3 class="text-center mt-5">Old Books</h3>
    <div class="container card" style="margin-top: 50px; justify-content: space-evenly">
        <div class="row">
            <%
                BookDAO bookDAO3 = new BookDAOImpl(DatabaseConnection.getConnection());
                List<Book> oldBooks = bookDAO3.getOldBooks();

                for (Book oldBook : oldBooks) {%>
                    <div class="col-md-3 card_hover">
                        <div class="card-sl m-3">
                            <div class="card-image">
                                <img src="books/<%= oldBook.getPhoto() %>" style="width: 150px; height: 200px" />
                            </div>
                            <a class="card-action" href="#"><i class="fa fa-heart"></i></a>
                            <div class="card-heading">
                                <%= oldBook.getBook_name() %>
                            </div>
                            <div class="card-text">
                                Author:  <%= oldBook.getAuthor() %>
                            </div>
                            <div class="card-text">
                                Category:  <%= oldBook.getBook_category() %>
                            </div>
                            <div style="display: flex; flex-direction: row; gap: 10px">
                                <a href="view_books.jsp?id=<%= oldBook.getId() %>" class="card-button"> View Details</a>
                                <a href="#" class="card-button"><i class="bi bi-currency-euro" style="margin-top: 3px;"></i>  <%= oldBook.getPrice() %></a>
                            </div>
                        </div>
                    </div>
                    <%}
                    %>
        </div>

        <div class="text-center mt-3 mb-2">
            <a href="all_old_books.jsp" class="btn btn-outline-primary btn-lg">View All</a>
        </div>
    </div>
</div>
<!-- End of Old Books Section -->

<%@include file="components/footer.jsp" %>
</body>
</html>