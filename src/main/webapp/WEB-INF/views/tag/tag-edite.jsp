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
    </style>
</head>
<body>

<div class="fluid">
    <jsp:directive.include file="../includes/main-navbar.jsp" />

    <div class="jumbotron jumbotron-fluid bg-cool-blue">
        <div class="container">
            <h1 class="display-4 aColor">
                Tags Edite
            </h1>
        </div>
    </div>



    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-3 ">
                <br><br><br>
                <div >
                    <a style="float: left;" class="btn btn-danger" href="${pageContext.request.contextPath}/tag/" >Returne</a>
                </div>
                <div class="card" style="margin-top: 25px;margin-bottom: 50px;">
                    <div class="card-header">Tag</div>
                    <form:form method="post" action="${pageContext.request.contextPath}/tag/save" modelAttribute="tag">
                        <div class="card-body row">
                            <div class="form-group col-sm-12 required">
                                <form:input path="id" type="hidden" />
                                <label>Titre</label>
                                <form:input path="title"  type="text" name="title" class="form-control is-invalid"></form:input>
                                <form:errors path="title"  class="invalid-feedback"  cssStyle="color: red" />
                            </div>

                            <div class="form-group col-md-12">
                                <c:choose>
                                    <c:when test="${role == 'Admin'}">
                                        <form:button class="btn btn-primary btn-block">Valider</form:button>
                                    </c:when>
                                    <c:when test="${role == 'Writer'}">
                                        <form:button class="btn btn-primary btn-block">Valider</form:button>
                                    </c:when>
                                </c:choose>

                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>


    <jsp:directive.include file="../includes/footer.jsp" />
</div>

</body>
</html>
