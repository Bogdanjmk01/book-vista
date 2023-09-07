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

<c:if test="${empty adminUser}">
    <c:redirect url="../login.jsp" />
</c:if>

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
            <li>
                <a href="../logout">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">Logout</span>
                </a>
            </li>

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

    <c:if test="${not empty failed_message}">
        <p class="text-center text-danger alert alert-danger w-100">${failed_message}</p>
        <c:remove var="failed_message" scope="session" />
    </c:if>

    <div class="login-box">
        <h2>Add Book</h2>
        <form method="post" action="../add_books" enctype='multipart/form-data'>
            <div class="user-box">
                <input type="text" name="book_name" required="">
                <label>Book Name</label>
            </div>
            <div class="user-box">
                <input type="text" name="author" required="">
                <label>Author Name</label>
            </div>
            <div class="user-box">
                <input type="text" name="price" required="">
                <label>Price</label>
            </div>

            <div class="form-group">
                <select name="book_category" class="form-select form-select-md mb-3" aria-label=".form-select-lg example">
                    <option selected>--Select--</option>
                    <option value="Inactive">New Book</option>
                </select>
            </div>

            <div>&nbsp;</div>

            <div class="form-group">
                <select class="form-select form-select-md mb-3" name="status" aria-label=".form-select-lg example">
                    <option selected>--Select--</option>
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                </select>
            </div>

            <div>&nbsp;</div>

            <div class="form-group">
                <label for="formFileLg" class="form-label text-white">Upload Photo</label>
                <input class="form-control form-control-md text-white" id="formFileLg" name="photo" type="file" />
            </div>

            <div>&nbsp;</div>

            <button type="submit" name="submit" class="register-button">
                Add Book
            </button>

            <div>&nbsp;</div>
        </form>
        </form>
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
    })
</script>
</body>

</html>