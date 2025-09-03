
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
<%--        <li>--%>
<%--            <a href="${pageContext.request.contextPath}/topic?method=list&c_id=${category.id}">${category.name}</a>--%>
<%--        </li>--%>

<%--        </c:forEach>--%>
<%--    </ul>--%>
<%--</div>--%>

<%--<div style="margin-top: 100px; margin-left: 150px;">--%>


<%--    <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/user?method=register" method="post">--%>
<%--        <div class="form-group">--%>
<%--            <label class="col-sm-2 col-form-label">Mobile number</label>--%>
<%--            <div class="col-lg-3">--%>
<%--                <input type="text" class="form-control" name="phone" placeholder="Mobile phone number">--%>
<%--            </div>--%>
<%--        </div>--%>


<%--        <div class="form-group">--%>
<%--            <label class="col-sm-2 col-form-label">User name</label>--%>
<%--            <div class="col-lg-3">--%>
<%--                <input type="text" class="form-control" name="username" placeholder="User name">--%>
<%--            </div>--%>
<%--        </div>--%>


<%--        <div class="form-group">--%>
<%--            <label class="col-sm-2 col-form-label">Password</label>--%>
<%--            <div class="col-lg-3">--%>
<%--                <input type="password" class="form-control" name="pwd" placeholder="Password">--%>
<%--            </div>--%>
<%--        </div>--%>


<%--        <div class="form-group">--%>
<%--            <label class="col-sm-2 col-form-label">Female</label>--%>
<%--            <div class="col-lg-3">--%>
<%--                <input type="radio" class="form-control" name="gender" value="0" checked>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--            <label class="col-sm-2 col-form-label">Male</label>--%>
<%--            <div class="col-lg-3">--%>
<%--                <input type="radio" class="form-control" name="gender" value="1">--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--            <label class="col-sm-2 col-form-label">The other</label>--%>
<%--            <div class="col-lg-3">--%>
<%--                <input type="radio" class="form-control" name="gender" value="2">--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--            <div class="col-sm-offset-2 col-sm-10">--%>
<%--                <button type="submit" class="btn btn-default" >Register</button>--%>

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
    <title>puppycat forum - Register</title>
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
        .radio-inline input[type="radio"] {
            margin-top:2px;
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

<!-- 注册卡片 -->
<div class="container" style="margin-top:60px;">
    <div class="row">
        <div class="col-sm-6 col-md-5 col-lg-5 col-md-offset-3 col-lg-offset-3">
            <div class="panel panel-default">
                <div class="panel-heading text-center" style="background:#e6f2ff; color:#004080;">
                    <h4 class="panel-title">Register</h4>
                </div>
                <div class="panel-body">
                    <form class="form" role="form"
                          action="${pageContext.request.contextPath}/user?method=register" method="post">

                        <div class="form-group">
                            <label for="phone">Mobile number</label>
                            <input type="text" class="form-control" id="phone" name="phone"
                                   placeholder="Mobile phone number" required>
                        </div>

                        <div class="form-group">
                            <label for="username">User name</label>
                            <input type="text" class="form-control" id="username" name="username"
                                   placeholder="User name" required>
                        </div>

                        <div class="form-group">
                            <label for="pwd">Password</label>
                            <input type="password" class="form-control" id="pwd" name="pwd"
                                   placeholder="Password" required>
                        </div>

                        <div class="form-group">
                            <label>Gender</label><br>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="0" checked> Female
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="1"> Male
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="2"> Other
                            </label>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block">Register</button>
                    </form>
                </div>
                <div class="panel-footer text-center">
                    Already have an account? <a href="${pageContext.request.contextPath}/user/login.jsp">Log in here</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap.min.js"></script>
</body>
</html>

