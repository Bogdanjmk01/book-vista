<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Admin Page</h1>

<c:if test="${not empty adminUser}">
    <h1>Name: ${userObj.name}</h1>
    <h1>Name: ${userObj.email}</h1>
</c:if>

</body>
</html>
