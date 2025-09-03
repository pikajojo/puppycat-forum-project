
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
            <th>operation</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${topicPage.list}" var="topic">
            <tr>
                <td>${topic.title}</td>
                <td>${topic.content}</td>
                <td>${topic.username}</td>
                <td>${topic.createTime}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/topic?method=findDetailById&topic_id=${topic.id}">details</a>
                </td>

            </tr>

        </c:forEach>
        </tbody>

    </table>

    <ul class="pagination">
        <li><a href="#">&laquo;</a></li>
        <c:if test="${topicPage.totalPages>0}">
            <c:forEach var="i" begin="0" end="${topicPage.totalPages-1}" step="1">
                <li>
                    <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${param.c_id}&page=${i+1}">${i+1}</a>
                </li>

            </c:forEach>

        </c:if>

        <li><a href="#">&raquo;</a></li>
    </ul>


</div>

</body>
</html>
