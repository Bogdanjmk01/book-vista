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
<body>
<%@include file="components/navbar.jsp" %>

    <div class="back-img">
        <h1 class="text-center"><b><i class="bi bi-book-fill"></i> Welcome to Book Vista</b></h1>
    </div>

    <div>
        <h3 class="text-center mt-1">Recent Books</h3>
            <div class="row">
                <div class="container" style="margin-top:50px;">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="card-sl p-3">
                                <div class="card-image">
                                    <img
                                            src="https://images.pexels.com/photos/1149831/pexels-photo-1149831.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" />
                                </div>

                                <a class="card-action" href="#"><i class="fa fa-heart"></i></a>
                                <div class="card-heading">
                                    Audi Q8
                                </div>
                                <div class="card-text">
                                    Audi Q8 is a full-size luxury crossover SUV coupé made by Audi that was launched in 2018.
                                </div>
                                <div class="card-text">
                                    $67,400
                                </div>
                                <a href="#" class="card-button"> Purchase</a>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
</body>
</html>
