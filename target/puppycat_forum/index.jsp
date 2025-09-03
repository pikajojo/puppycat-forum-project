
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>puppycat forum</title>--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap.min.css">--%>
<%--    <script src="${pageContext.request.contextPath}/static/bootstrap.min.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <ul class="nav nav-tabs">--%>
<%--        <c:forEach items="${categoryList}" var="category">--%>
<%--            <li>--%>
<%--                <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${category.id}">${category.name}</a>--%>
<%--            </li>--%>

<%--        </c:forEach>--%>

<%--        <c:choose>--%>
<%--            <c:when test="${empty loginUser}">--%>
<%--                <li style="float: right"><a href="${pageContext.request.contextPath}/user/register.jsp">register</a></li>--%>
<%--                <li style="float: right"><a href="${pageContext.request.contextPath}/user/login.jsp">log in</a></li>--%>

<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                <li style="float: right"><a href="${pageContext.request.contextPath}/user?method=logout">log out</a></li>--%>
<%--                <li style="float: right"><a href="#">${loginUser.username}</a></li>--%>
<%--                <li style="float: right">--%>
<%--                    <img src="${loginUser.img}" class="img-circle" width="25px" height="25px" style="margin-top: 8.5px">--%>
<%--                </li>--%>
<%--                <li style="float: right"><a href="${pageContext.request.contextPath}/publish.jsp">post</a></li>--%>

<%--            </c:otherwise>--%>
<%--        </c:choose>--%>


<%--    </ul>--%>


<%--    <table class="table table-striped">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>title</th>--%>
<%--            <th>content</th>--%>
<%--            <th>author</th>--%>
<%--            <th>post time</th>--%>
<%--            <th>operation</th>--%>

<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <c:forEach items="${topicPage.list}" var="topic">--%>
<%--            <tr>--%>
<%--                <td>${topic.title}</td>--%>
<%--                <td>${topic.content}</td>--%>
<%--                <td>${topic.username}</td>--%>
<%--                <td>${topic.createTime}</td>--%>
<%--                <td>--%>
<%--                    <a href="${pageContext.request.contextPath}/topic?method=findDetailById&topic_id=${topic.id}">details</a>--%>
<%--                </td>--%>

<%--            </tr>--%>

<%--        </c:forEach>--%>
<%--        </tbody>--%>

<%--    </table>--%>

<%--    <ul class="pagination">--%>
<%--        <li><a href="#">&laquo;</a></li>--%>
<%--        <c:if test="${topicPage.totalPages>0}">--%>
<%--            <c:forEach var="i" begin="0" end="${topicPage.totalPages-1}" step="1">--%>
<%--                <li>--%>
<%--                    <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${param.c_id}&page=${i+1}">${i+1}</a>--%>
<%--                </li>--%>

<%--            </c:forEach>--%>

<%--        </c:if>--%>

<%--        <li><a href="#">&raquo;</a></li>--%>
<%--    </ul>--%>


<%--</div>--%>

<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>puppycat forum</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- 本地 Bootstrap 3 与 jQuery -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap.min.css">
    <style>
        body { background:#f7f9fb; }
        .navbar-brand { font-weight:700; letter-spacing:.3px; }
        .table>tbody>tr>td { vertical-align: middle; }
        /* 内容列截断显示 */
        .topic-content {
            max-width: 520px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            color: #6c757d;
        }
        /* 标题链接样式 */
        a.title-link { font-weight:600; text-decoration:none; }
        a.title-link:hover { text-decoration:underline; }
        /* 卡片感 */
        .panel {
            border-radius: 6px;
            box-shadow: 0 2px 8px rgba(0,0,0,.05);
        }
        .avatar { width:24px; height:24px; border-radius:50%; object-fit:cover; }
    </style>
</head>
<body>

<!-- 顶部导航（淡蓝色背景） -->
<nav class="navbar" role="navigation" style="background-color:#e6f2ff; border:none; margin-bottom:20px;">
    <div class="container">
        <!-- Brand 和 折叠按钮 -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#topnav">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/" style="font-weight:700; color:#004080;">
                puppycat forum
            </a>
        </div>

        <!-- 导航内容 -->
        <div class="collapse navbar-collapse" id="topnav">
            <!-- 左侧分类 -->
            <ul class="nav navbar-nav">
                <c:forEach items="${categoryList}" var="category">
                    <li>
                        <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${category.id}"
                           style="color:#004080;">
                                ${category.name}
                        </a>
                    </li>
                </c:forEach>
            </ul>

            <!-- 右侧用户区 -->
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${empty loginUser}">
                        <li><a href="${pageContext.request.contextPath}/user/login.jsp" style="color:#004080;">log in</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/register.jsp" style="color:#004080;">register</a></li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="javascript:void(0)" style="color:#004080;">
                                <img src="${loginUser.img}" class="avatar" alt="">
                                &nbsp;${loginUser.username}
                            </a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/publish.jsp" style="color:#004080;">post</a></li>
                        <li><a href="${pageContext.request.contextPath}/user?method=logout" style="color:#004080;">log out</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<div class="container">

    <!-- 列表面板 -->
    <div class="panel panel-default">
        <div class="panel-heading"><strong>Topics</strong></div>

        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th style="width:28%">title</th>
                    <th>content</th>
                    <th style="width:12%">author</th>
                    <th style="width:18%">post time</th>
                    <th style="width:10%" class="text-right">operation</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${topicPage.list}" var="topic">
                    <tr>
                        <td>
                            <a class="title-link"
                               href="${pageContext.request.contextPath}/topic?method=findDetailById&topic_id=${topic.id}">
                                    ${topic.title}
                            </a>
                        </td>
                        <td class="topic-content">${topic.content}</td>
                        <td>${topic.username}</td>
                        <!-- 先原样显示时间，避免解析失败导致页面挂掉 -->
                        <td>${topic.createTime}</td>
                        <td class="text-right">
                            <a class="btn btn-xs btn-primary"
                               href="${pageContext.request.contextPath}/topic?method=findDetailById&topic_id=${topic.id}">
                                details
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- 分页（Bootstrap 3 语法） -->
        <div class="panel-footer" style="background:#fff">
            <c:set var="now" value="${empty param.page ? 1 : param.page}" />
            <c:set var="total" value="${topicPage.totalPages}" />
            <c:set var="prev" value="${now-1}" />
            <c:if test="${prev < 1}"><c:set var="prev" value="1"/></c:if>
            <c:set var="next" value="${now+1}" />
            <c:if test="${next > total}"><c:set var="next" value="${total}"/></c:if>

            <ul class="pagination" style="margin:0" >
                <li class="${now==1 ? 'disabled' : ''}">
                    <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${param.c_id}&page=${prev}">&laquo;</a>
                </li>

                <c:if test="${total > 0}">
                    <c:forEach var="i" begin="1" end="${total}">
                        <li class="${i == now ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${param.c_id}&page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                </c:if>

                <li class="${now==total ? 'disabled' : ''}">
                    <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${param.c_id}&page=${next}">&raquo;</a>
                </li>
            </ul>
        </div>
    </div>
</div>

<!-- JS：先 jQuery 后 Bootstrap 3 -->
<script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap.min.js"></script>
</body>
</html>










