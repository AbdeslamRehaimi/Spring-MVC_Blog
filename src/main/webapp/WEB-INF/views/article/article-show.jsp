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
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <style>
        .aColor {
            color: #000000;
        }

        .space_Section {
            margin-top: 20px;
        }

        .bg-black {
            background-color: #000000!important;
        }

        .bg-cool-blue {
            background-color: #a0e5e8!important;
        }

        .icon-drop-user {
            margin-right: 10px;
        }
        .icon-menu-space{
            margin-right: 50px;
        }

        .article{
            text-align: justify;
            font-style: italic;
            font-family: cursive;
        }

        .user-header {
            margin-top: -50px;
        }
        .user-profile {
            padding-top: 55px;
        }
    </style>
</head>
<body>
    <div class="fluid">
        <c:choose>
            <c:when test="${role == 'Admin'}">
                <jsp:include page="../includes/main-navbar.jsp" />
            </c:when>
            <c:when test="${role == 'Writer'}">
                <jsp:include page="../includes/main-navbar.jsp" />
            </c:when>
            <c:otherwise>
                <jsp:include page="../includes/visitor-navbar.jsp" />
            </c:otherwise>
        </c:choose>

        <div class="jumbotron jumbotron-fluid bg-cool-blue">
            <div class="container">
                <h1 class="display-4 aColor">
                    Article Show
                </h1>
            </div>
        </div>

            <div class="user-header">
                <div class="user-profile">
                    <img src="<c:url value="/resources/images/users/${article.user.image}"/>" class="user">
                    <h1>${article.user.nom} ${article.user.prenom}</h1>
                </div>
            </div>

        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12  ">
                    <br><br><br>
                    <div >
                        <a style="float: left;" class="btn btn-danger" href="${pageContext.request.contextPath}/article/" >Returne</a>
                    <c:choose>
                        <c:when test="${role == 'Admin'}">
                            <a style="float: right;" class="btn btn-primary" href="${pageContext.request.contextPath}/article/add/${article.id}" >Modifier</a>
                        </c:when>
                        <c:when test="${role == 'Writer'}">
                            <a style="float: right;" class="btn btn-primary" href="${pageContext.request.contextPath}/article/add/${article.id}" >Modifier</a>
                        </c:when>
                    </c:choose>
                     </div>
                    <div class="card" style="margin-top: 50px">
                        <div class="card-header" style="text-align: center"><h1 style="color: black;font-family: auto;">${article.title}</h1></div>
                            <div class="card-body row">
                                <div class="form-group col-sm-12 required">
                                    <div class="article">
                                        <div style="text-align: center">
                                            <img height="400px" width="800px" src="<c:url value="/resources/images/articles/${article.image}"/>">
                                        </div>
                                        <hr>
                                        <br>
                                        ${article.body}
                                    </div>
                                </div>
                            </div>
                        <div class="text-center" style="text-align: center!important;">
                            <p style="color: #20560a; font-family: initial;">Publier par ${article.user.nom} ${article.user.prenom} le: ${article.created} </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>






        <jsp:include page="../includes/footer.jsp" />
    </div>
</body>
</html>
