<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Address</title>
    <%@include file="components/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2">
<%@include file="components/navbar.jsp" %>

<div class="container w-100">
    <div class="row w-100">
        <div class="col-md-6 offset-md-4">
            <div class="card w-100">
                <div class="card-body">
                    <h2 class="text-center">Add Address</h2>
                    <form action="">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="inputAddress">Address</label>
                                <input type="text" id="inputAddress" class="form-control">
                            </div>

                            <div class="form-group col-md-6">
                                <label for="inputLandmark">Landmark</label>
                                <input type="text" id="inputLandmark" class="form-control">
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="inputCity">City</label>
                                <input type="text" id="inputCity" class="form-control">
                            </div>

                            <div class="form-group col-md-6">
                                <label for="inputState">State</label>
                                <input type="text" id="inputState" class="form-control">
                            </div>

                            <div class="form-group col-md-6">
                                <label for="inputZipCode">Zip Code</label>
                                <input type="text" id="inputZipCode" class="form-control">
                            </div>
                        </div>

                        <div class="text-center mt-2">
                            <button class="btn btn-outline-secondary">Add Address</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
