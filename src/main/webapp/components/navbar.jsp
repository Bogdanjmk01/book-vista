<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<div class="container-fluid" style="height: 10px; background-color: #608fd5"></div>

<div class="p-3">
    <div class="row">
        <div class="col-md-3">
            <h3 class="text-success"><i class="bi bi-journals"></i> Book Vista</h3>
        </div>

        <div class="col-md-6">
            <form class="d-flex" role="search" action="search.jsp" method="post">
                <input class="form-control me-1 w-50" type="search" placeholder="Search" name="searchBook" aria-label="Search">
                <button class="btn btn-outline-dark" type="submit">Search</button>
            </form>
        </div>

        <div class="col-md-3">
            <c:if test="${not empty userObj}">
                <a class="cart-button" href="cart.jsp"><i class="bi bi-cart-check-fill"></i></a>
                <button class="btn btn-outline-success" disabled style="pointer-events: none">${userObj.name}</button>
                <a class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="fa-solid fa-arrow-right-to-bracket mt-1"></i> Logout</a>
            </c:if>

            <c:if test="${empty userObj}">
                <a href="login.jsp" class="btn btn-outline-success"><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
                <span>&nbsp;</span>
                <a href="register.jsp" class="btn btn-outline-primary"><i class="fa-solid fa-square-plus"></i> Register</a>
            </c:if>
        </div>

        <div class="modal fade" tabindex="-1" id="logoutModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Logout</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p style="font-size: 20px"><b>Are you sure you want to log out?</b></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                        <a href="logout" type="button" class="btn btn-outline-dark">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp"><i class="bi bi-house-fill"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="all_recent_books.jsp"><i class="bi bi-book-half"></i> Recent Book</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="all_new_books.jsp"><i class="bi bi-book-half"></i> New Book</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="all_old_books.jsp"><i class="bi bi-book-half"></i> Old Book</a>
                </li>
            </ul>

            <form class="d-flex mt-3" role="search">
                <a href="settings.jsp" class="btn btn-outline-light" type="submit"><i class="bi bi-gear"></i>&nbsp; Settings</a>
                <span>&nbsp;</span>
                <a href="#" class="btn btn-outline-light" type="submit"><i class="bi bi-telephone-forward"></i> &nbsp; Contact Us</a>
            </form>
        </div>
    </div>
</nav>