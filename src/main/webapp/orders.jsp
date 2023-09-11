<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Your orders</title>
    <%@include file="components/all_css.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container mt-5">
    <h3 class="text-center">Your Orders</h3>
    <table class="table w-100 fs-4 text-center">
        <thead class="table-dark">
        <tr>
            <th scope="col">Order Number</th>
            <th scope="col">Name</th>
            <th scope="col">Book Name</th>
            <th scope="col">Author</th>
            <th scope="col">Price</th>
            <th scope="col">Payment Type</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row">1</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        <tr>
            <th scope="row">2</th>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        <tr>
            <th scope="row">3</th>
            <td colspan="2">Larry the Bird</td>
            <td>@twitter</td>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
