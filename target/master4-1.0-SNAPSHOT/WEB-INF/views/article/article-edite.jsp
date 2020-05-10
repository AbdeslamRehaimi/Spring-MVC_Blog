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
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<html>
<head>
    <title>Title</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
    <script src="<c:url value="/resources/ckeditor/adapters/jquery.js" />"></script>
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
                    Articles
                </h1>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div >
                        <a style="float: left;" class="btn btn-danger" href="${pageContext.request.contextPath}/article/" >Returne</a>
                    </div>
                    <br><br>
                    <div class="card" style="margin-top: 25px">
                        <div class="card-header">Article Edite</div>
                        <form:form method="post" action="${pageContext.request.contextPath}/article/save" modelAttribute="article">
                            <div class="card-body row">
                                <form:input path="id" type="hidden" />

                                <div class="form-group col-md-12 required ">
                                    <label for="title">Titre</label>
                                    <form:input path="title" cssClass="form-control"  placeholder="titre" />
                                    <form:errors path="title" cssClass="alert-danger" />
                                </div>

                                <div class="form-group col-md-12 required ">
                                    <label for="title">Writer</label>
                                   <input  style="border-radius: 150px;"  class="form-control" value="${fullName}"  placeholder="titre" disabled="true" />
                                </div>

                                <div class="form-group col-md-12 required ">
                                    <label for="body">Texte</label>
                                    <form:textarea path="body" id="editor" name="editor" cssClass="form-control" class="form-control"/>
                                    <form:errors path="body" cssClass="alert-danger" />

                                </div>

                                <div class="form-group col-sm-12 required ">
                                    <label>Image</label>
                                    <form:input path="image" type="text" name="text" value="" class="form-control is-invalid"></form:input>
                                    <form:errors path="image"  class="invalid-feedback"  cssStyle="color: red" />
                                </div>

                                <div class="form-check">
                                    <label class="form-check-label">
                                        Publier
                                    </label>
                                    <form:checkbox path="published"/>
                                </div>
                                <div class="form-check col-md-12 required">
                                    <label class="form-check-label">
                                        Tags
                                    </label>


                                    <c:forEach items="${tags}"   var="tag">
                                        <c:choose>
                                            <c:when test="${tag.used}">
                                                <form:checkbox path="tagList" value="${tag.id}" label="${tag.title}" checked="checked" />
                                            </c:when>
                                            <c:otherwise>
                                                <form:checkbox path="tagList" value="${tag.id}" label="${tag.title}"  />
                                            </c:otherwise>
                                        </c:choose>

                                    </c:forEach>
                                    <form:errors path="tagList" cssClass="alert-danger" />
                                </div>


                                <div class="form-group col-md-12">
                                    <c:choose>
                                        <c:when test="${role == 'Admin'}">
                                            <form:button class="btn btn-success btn-block">Valider</form:button>
                                        </c:when>
                                        <c:when test="${role == 'Writer'}">
                                            <form:button class="btn btn-success btn-block">Valider</form:button>
                                        </c:when>
                                    </c:choose>

                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>



        <jsp:include page="../includes/footer.jsp" />
    </div>




    <ckeditor:replace replace="editor" basePath="/resources/ckeditor/"/>
</body>
</html>
