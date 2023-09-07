<%@ page import="com.bogdanjmk.book_vista.dao.BookDAO" %>
<%@ page import="com.bogdanjmk.book_vista.dao.impl.BookDAOImpl" %>
<%@ page import="com.bogdanjmk.book_vista.db.DatabaseConnection" %>
<%@ page import="com.bogdanjmk.book_vista.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <link rel="stylesheet" href="components/style.css">
    <link rel="stylesheet" href="components/admin.css">
    <link rel="stylesheet" href="components/add_books.css">

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body>
<nav>
    <div class="logo-name">
        <div class="logo-image">
            <span></span>
        </div>
    </div>

    <div class="menu-items">
        <ul class="nav-links">
            <li><a href="home.jsp">
                <i class="uil uil-estate"></i>
                <span class="link-name">Dahsboard</span>
            </a></li>
            <li>
                <a href="add_books.jsp">
                    <i class="uil uil-diary"></i>
                    <span class="link-name">Add new Book</span>
                </a>
            </li>
            <li>
                <a href="all_books.jsp">
                    <i class="uil uil-books"></i>
                    <span class="link-name">See all Books</span>
                </a>
            </li>

            <li><a href="#">
                <i class="uil uil-chart"></i>
                <span class="link-name">Analytics</span>
            </a></li>
        </ul>

        <ul class="logout-mode">
            <li><a href="../authentication/logout.php">
                <i class="uil uil-signout"></i>
                <span class="link-name">Logout</span>
            </a></li>

            <li class="mode">
                <a href="#">
                    <i class="uil uil-moon"></i>
                    <span class="link-name">Dark Mode</span>
                </a>

                <div class="mode-toggle">
                    <span class="switch"></span>
                </div>
            </li>
        </ul>
    </div>
</nav>

<section class="dashboard">
    <div class="table-container">

        <c:if test="${not empty success_message}">
            <p class="text-center text-success alert alert-success w-100">${success_message}</p>
            <c:remove var="success_message" scope="session" />
        </c:if>

        <c:if test="${not empty update_success}">
            <p class="text-center text-success alert alert-success w-100">${update_success}</p>
            <c:remove var="update_success" scope="session" />
        </c:if>

        <c:if test="${not empty delete_success}">
            <p class="text-center text-success alert alert-success w-100">${delete_success}</p>
            <c:remove var="delete_success" scope="session" />
        </c:if>

        <c:if test="${not empty delete_failed}">
            <p class="text-center text-warning alert alert-warning w-100">${delete_failed}</p>
            <c:remove var="delete_failed" scope="session" />
        </c:if>

        <h2 style="color: #a49c9c">Books</h2>

        <table class="table">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Image</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Category</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
                <%
                    BookDAO bookDAO = new BookDAOImpl(DatabaseConnection.getConnection());
                    List<Book> books = bookDAO.getAllBooks();

                    for (Book book : books) { %>
                            <tr>
                                <td><%= book.getId() %></td>
                                <td><img src="../books/<%= book.getPhoto() %>" style="width: 50px; height: 50px"></td>
                                <td><%= book.getBook_name() %></td>
                                <td><%= book.getAuthor() %></td>
                                <td><%= book.getPrice() %></td>
                                <td><%= book.getBook_category()%></td>
                                <td><%= book.getStatus() %></td>
                                <td class="gap-2">
                                    <a href="edit_book.jsp?id=<%= book.getId() %>" class="btn btn-sm btn-outline-dark">Edit</a>
                                    <a href="../delete_book?id=<%= book.getId() %>" class="btn btn-sm btn-outline-danger">Delete</a>
                                </td>
                            </tr>
                    <%}
                %>
            </tbody>
        </table>
    </div>
</section>

<script>
    const body = document.querySelector("body"),
    modeToggle = body.querySelector(".mode-toggle");
    sidebar = body.querySelector("nav");
    sidebarToggle = body.querySelector(".sidebar-toggle");

    let getMode = localStorage.getItem("mode");
    if (getMode && getMode === "dark") {
        body.classList.toggle("dark");
    }

    let getStatus = localStorage.getItem("status");
    if (getStatus && getStatus === "close") {
        sidebar.classList.toggle("close");
    }

    modeToggle.addEventListener("click", () => {
        body.classList.toggle("dark");
        if (body.classList.contains("dark")) {
            localStorage.setItem("mode", "dark");
        } else {
            localStorage.setItem("mode", "light");
        }
    });

    sidebarToggle.addEventListener("click", () => {
        sidebar.classList.toggle("close");
        if (sidebar.classList.contains("close")) {
            localStorage.setItem("status", "close");
        } else {
            localStorage.setItem("status", "open");
        }
    });
</script>
</body>

</html>