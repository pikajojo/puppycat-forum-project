
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>puppycat forum</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/static/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <ul class="nav nav-tabs">
        <c:forEach items="${categoryList}" var="category">
            <li>
                <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${category.id}">${category.name}</a>
            </li>

        </c:forEach>
    </ul>
</div>

<div style="margin-top: 100px; margin-left: 150px;">
    ${msg}

    <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/user?method=login" method="post">
        <div class="form-group">
            <label class="col-sm-2 col-form-label">Mobile number</label>
            <div class="col-lg-3">
                <input type="text" class="form-control" name="phone" placeholder="Mobile phone number">
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-2 col-form-label">Password</label>
            <div class="col-lg-3">
                <input type="password" class="form-control" name="pwd" placeholder="Password">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default" >Log in</button>

            </div>
        </div>

    </form>


</div>

</body>
</html>
