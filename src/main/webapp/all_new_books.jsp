<%@ page import="com.bogdanjmk.book_vista.dao.BookDAO" %>
<%@ page import="com.bogdanjmk.book_vista.dao.impl.BookDAOImpl" %>
<%@ page import="com.bogdanjmk.book_vista.db.DatabaseConnection" %>
<%@ page import="com.bogdanjmk.book_vista.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bogdanjmk.book_vista.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>New Books</title>
    <%@include file="components/all_css.jsp"%>
    <style>
        .crd-ho:hover {
            background-color: #fcf7f7;
        }

        #toast {
            min-width: 300px;
            position: fixed;
            bottom: 30px;
            left: 50%;
            margin-left: -125px;
            background: #333;
            padding: 10px;
            color: #ffff;
            text-align: center;
            z-index: 1;
            font-size: 18px;
            visibility: hidden;
            box-shadow: 0px 0px 100px #000;
        }

        #toast.display {
            visibility: visible;
            animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
        }

        @keyframes fadeIn {from {
            bottom: 0;
            opacity: 0;
        }
            to {
                bottom: 30px;
                opacity: 1;
            }

        }

        @keyframes fadeOut {from {
            bottom: 30px;
            opacity: 1;
        }
            to {
                bottom: 0;
                opacity: 0;
            }

        }
    </style>
</head>
<body>

<%
    User user = (User) session.getAttribute("userObj");
%>

<c:if test="${not empty addToCartSuccess}">
    <div id="toast">${addToCartSuccess}</div>
    <script type="text/javascript">
        showToast("${addToCartSuccess}");

        function showToast(content) {
          $("#toast").addClass("display");
          $("#toast").html(content);
          setTimeout(() => {
             $("#toast").removeClass("display");
          }, 2000);
        };
    </script>

    <c:remove var="addToCartSuccess" scope="session" />
</c:if>

<%@include file="components/navbar.jsp"%>
<div>
    <h3 class="text-center mt-2">New Books</h3>
    <div style="justify-content: space-evenly;">
        <div class="row">
            <%
                BookDAO bookDAO = new BookDAOImpl(DatabaseConnection.getConnection());
                List<Book> newBooks = bookDAO.getAllNewBooks();

                for (Book newBook : newBooks) {%>
                    <div class="col-md-3 card_hover card w-25">
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

                                <%
                                    if (user == null) { %>
                                    <a href="login.jsp" class="card-button"> Purchase</a>
                                <%
                                } else {%>
                                    <form method="post" action="cart?bookId=<%= newBook.getId() %>&&userId=<%= user.getId() %>">
                                        <button class="btn btn-outline-primary btn-sm ml-2" type="submit"><i class="bi bi-basket"></i> Purchase</button>
                                    </form>
                                <%
                                    }
                                %>
                                <a href="view_books.jsp?id=<%= newBook.getId() %>" class="card-button"> View Details</a>
                                <a href="#" class="card-button"><i class="bi bi-currency-euro" style="margin-top: 3px;"></i>  <%= newBook.getPrice() %></a>
                            </div>
                        </div>
                    </div>
            <%}
            %>

        </div>
    </div>
</div>
</body>
</html>
