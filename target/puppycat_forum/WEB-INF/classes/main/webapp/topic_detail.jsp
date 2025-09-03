
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

        <c:choose>
            <c:when test="${empty loginUser}">
                <li style="float: right"><a href="${pageContext.request.contextPath}/user/register.jsp">register</a></li>
                <li style="float: right"><a href="${pageContext.request.contextPath}/user/login.jsp">log in</a></li>

            </c:when>
            <c:otherwise>
                <li style="float: right"><a href="${pageContext.request.contextPath}/user?method=logout">log out</a></li>
                <li style="float: right"><a href="#">${loginUser.username}</a></li>
                <li style="float: right">
                    <img src="${loginUser.img}" class="img-circle" width="25px" height="25px" style="margin-top: 8.5px">
                </li>
                <li style="float: right"><a href="${pageContext.request.contextPath}/publish.jsp">post</a></li>
                <li style="float: right"><a href="${pageContext.request.contextPath}/reply.jsp?topic_id=${param.topic_id}">reply</a></li>

            </c:otherwise>
        </c:choose>


    </ul>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>title</th>
            <th>content</th>
            <th>author</th>
            <th>post time</th>
        </tr>
        </thead>

        <tr>
            <td>${topic.title}</td>
            <td>${topic.content}</td>
            <td>${topic.username}</td>
            <td>${topic.createTime}</td>
        </tr>
    </table>




<table class="table table-striped">
    <thead>
    <tr>
        <th>username</th>
        <th>content</th>
        <th>reply time</th>
        <th>floor</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${replyPage.list}" var="reply">
        <tr>
            <td>${reply.username}</td>
            <td>${reply.content}</td>
            <td>${reply.createTime}</td>
            <td>${reply.floor} floor</td>
        </tr>

    </c:forEach>
    </tbody>

</table>

<ul class="pagination">
    <li><a href="#">&laquo;</a></li>
    <c:if test="${replyPage.totalPages>0}">
        <c:forEach var="i" begin="0" end="${replyPage.totalPages-1}" step="1">
            <li>
                <a href="${pageContext.request.contextPath}/topic?method=findDetailById&topic_id=${param.topic_id}&page=${i+1}">${i+1}</a>
            </li>

        </c:forEach>

    </c:if>

    <li><a href="#">&raquo;</a></li>
</ul>


</div>
</body>
</html>
