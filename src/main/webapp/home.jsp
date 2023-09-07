<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <%@include file="components/all_css.jsp" %>
</head>
<body>
<h1>Home Page</h1>
<%@include file="components/navbar.jsp" %>

<c:if test="${empty userObj}">
    <c:redirect url="login.jsp" />
</c:if>
</body>
</html>
