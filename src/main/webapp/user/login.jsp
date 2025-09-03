
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
<%--    </ul>--%>
<%--</div>--%>

<%--<div style="margin-top: 100px; margin-left: 150px;">--%>
<%--    ${msg}--%>

<%--    <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/user?method=login" method="post">--%>
<%--        <div class="form-group">--%>
<%--            <label class="col-sm-2 col-form-label">Mobile number</label>--%>
<%--            <div class="col-lg-3">--%>
<%--                <input type="text" class="form-control" name="phone" placeholder="Mobile phone number">--%>
<%--            </div>--%>
<%--        </div>--%>


<%--        <div class="form-group">--%>
<%--            <label class="col-sm-2 col-form-label">Password</label>--%>
<%--            <div class="col-lg-3">--%>
<%--                <input type="password" class="form-control" name="pwd" placeholder="Password">--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--            <div class="col-sm-offset-2 col-sm-10">--%>
<%--                <button type="submit" class="btn btn-default" >Log in</button>--%>

<%--            </div>--%>
<%--        </div>--%>

<%--    </form>--%>


<%--</div>--%>

<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>puppycat forum - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap.min.css">
    <style>
        body { background:#f7f9fb; }
        .navbar { background-color:#e6f2ff; border:none; }
        .navbar-brand, .navbar-nav>li>a { color:#004080 !important; font-weight:600; }
        .navbar-brand { font-size:18px; }
        .panel {
            border-radius:6px;
            box-shadow:0 2px 8px rgba(0,0,0,.05);
        }
        .btn-primary {
            background-color:#4da3ff;
            border-color:#4da3ff;
        }
        .btn-primary:hover {
            background-color:#1a8cff;
            border-color:#1a8cff;
        }
    </style>
</head>
<body>

<!-- 顶部导航 -->
<nav class="navbar" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">puppycat forum</a>
        </div>
        <div class="collapse navbar-collapse" id="topnav">
            <ul class="nav navbar-nav">
                <c:forEach items="${categoryList}" var="category">
                    <li>
                        <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${category.id}">
                                ${category.name}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</nav>

<!-- 登录卡片 -->
<div class="container" style="margin-top:60px;">
    <div class="row">
        <div class="col-sm-6 col-md-5 col-lg-4 col-md-offset-3 col-lg-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading text-center" style="background:#e6f2ff; color:#004080;">
                    <h4 class="panel-title">Log in</h4>
                </div>
                <div class="panel-body">
                    <!-- 提示消息 -->
                    <c:if test="${not empty msg}">
                        <div class="alert alert-danger">${msg}</div>
                    </c:if>

                    <form class="form" role="form"
                          action="${pageContext.request.contextPath}/user?method=login" method="post">

                        <div class="form-group">
                            <label for="phone">Mobile number</label>
                            <input type="text" class="form-control" id="phone" name="phone"
                                   placeholder="Mobile phone number" required>
                        </div>

                        <div class="form-group">
                            <label for="pwd">Password</label>
                            <input type="password" class="form-control" id="pwd" name="pwd"
                                   placeholder="Password" required>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block">Log in</button>
                    </form>
                </div>
                <div class="panel-footer text-center">
                    No account? <a href="${pageContext.request.contextPath}/user/register.jsp">Register here</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap.min.js"></script>
</body>
</html>
