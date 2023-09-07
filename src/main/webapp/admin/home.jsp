<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<%--    <link rel="stylesheet" href="../css/style.css">--%>
    <link rel="stylesheet" href="components/admin.css">

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>Admin Page</h1>

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

<form method="post">
    <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

            <div class="search-box">
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Search here...">
            </div>
        </div>

        <div class="dash-content">
            <div class="overview">
                <div class="title">
                </div>

                <div class="boxes">
                    <div class="box box1">
                        <i class="uil uil-thumbs-up"></i>
                        <span class="text">Total Likes</span>
                        <span class="number">50,120</span>
                    </div>
                    <div class="box box2">
                        <i class="uil uil-comments"></i>
                        <span class="text">Comments</span>
                        <span class="number">20,120</span>
                    </div>
                    <div class="box box3">
                        <i class="uil uil-share"></i>
                        <span class="text">Total Share</span>
                        <span class="number">10,120</span>
                    </div>
                </div>
            </div>

            <div class="activity">
                <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Recent Activity</span>
                </div>

                <div class="activity-data">

                </div>
                </div>
            </div>
        </div>
    </section>
</form>

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
