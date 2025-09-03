
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

    <form class="form-horizontal" role="form" action="/topic?method=addTopic" method="post">
        <div class="form-group">
            <label class="col-sm-2 col-form-label">Title</label>
            <div class="col-lg-3">
                <input type="text" class="form-control" name="title" placeholder="Title">
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-2 col-form-label">Category</label>
            <div class="col-lg-3">
                <select class="form-control" name="c_id">
                    <c:forEach items="${categoryList}" var="category">
                        <option value="${category.id}">${category.name}</option>

                    </c:forEach>
                </select>
            </div>
        </div>

            <div class="form-group">
                <label class="col-sm-2 col-form-label">Content</label>
                <div class="col-lg-8">
                    <textarea class="form-control" name="content" placeholder="Please enter your content here"></textarea>

                </div>
            </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default" >Post</button>

            </div>
        </div>

    </form>


</div>

</body>
</html>
