<%--
  Created by IntelliJ IDEA.
  User: TOSHIBA
  Date: 26/04/2020
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Title</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <style>
        .aColor {
            color: #ffffff;
        }

        .space_Section {
            margin-top: 20px;
        }

        .bg-black {
            background-color: #000000!important;
        }

        .bg-cool-blue {
            background-color: #03579e!important;
        }

        .icon-drop-user {
            margin-right: 10px;
        }
        .icon-menu-space{
            margin-right: 50px;
        }

        .user-profile {
            padding-top: 80px;
            width: 100%;
            position: relative;
            display: grid;
            grid-template-columns: 100%;
            justify-items: center;
            z-index: 2;
        }

    </style>
</head>
<body>
<div class="fluid">
    <jsp:include page="../includes/main-navbar.jsp" />
    <div class="jumbotron jumbotron-fluid bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h1 class="display-4 aColor">
                        Articles Page
                    </h1>
                </div>
                <div class="col-md-4">
                    <div class="user-profile">
                        <img src="<c:url value="/resources/images/users/madeon.jpg"/>" class="user">
                        <h1>${fullName}</h1>
                    </div>
                </div>
                <div class="col-md-4">
                    <h2>Admin</h2>
                </div>
            </div>


        </div>
    </div>
    <div class="container">

    </div>
    <jsp:include page="../includes/footer.jsp" />
</div>



</body>
</html>
