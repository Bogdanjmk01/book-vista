<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register Page</title>
    <%@include file="components/all_css.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<section class="vh-100 d-flex justify-content-center align-items-center" style="background-color: #eee;">
    <div class="container h-100" style="overflow: hidden">
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col-lg-12 col-xl-12 col-xxl-12 mt-3">
                <div class="card text-black" style="border-radius: 25px;">
                    <div class="card-body p-md-5">
                        <div class="row justify-content-center">
                            <div class="col-md-10 col-lg-4 col-xl-5 order-2 order-lg-1">

                                <c:if test="${not empty register_failed}">
                                    <p class="text-center text-danger alert alert-danger w-100"><b>${ register_failed }</b></p>
                                    <c:remove var="register_failed" scope="session" />
                                </c:if>

                                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4"><b>Register</b></p>

                                <form class="mx-1 mx-md-4" action="register" method="post">

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="bi bi-person-rolodex bi-3x me-3" style="font-size: 20px"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="text" id="form3Example1c" class="form-control" placeholder="Enter your full name" name="fullName" />
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="bi bi-envelope-fill bi-2x me-3"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="email" id="form3Example3c" class="form-control" placeholder="Enter your email" name="email" />
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="bi bi-telephone-inbound-fill me-3"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="text" id="form3Example4c" class="form-control" placeholder="Enter your phone number" name="phone_number" />
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <i class="bi bi-key-fill bi-lg me-3"></i>
                                        <div class="form-outline flex-fill mb-0">
                                            <input type="password" id="form3Example5c" class="form-control" placeholder="Enter your password" name="password" />
                                        </div>
                                    </div>

                                    <div class="form-check d-flex justify-content-center mb-2">
                                        <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3c" name="check" />
                                        <label class="form-check-label" for="form2Example3c">
                                            I agree all statements in <a href="#!">Terms of service</a>
                                        </label>
                                    </div>

                                    <div class="form-check d-flex justify-content-center mb-5">
                                        <p style="color: #1480aa">Already have an account? <a href="login.jsp"><b> Click here to Login</b></a></p>
                                    </div>


                                    <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                        <button type="submit" class="btn btn-outline-dark btn-lg">Register</button>
                                    </div>

                                </form>

                            </div>
                            <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp" class="img-fluid" alt="Sample image">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>