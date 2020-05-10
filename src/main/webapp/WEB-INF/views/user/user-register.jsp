<%--
  Created by IntelliJ IDEA.
  User: TOSHIBA
  Date: 26/04/2020
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Register</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-6 offset-3 ">
            <div class="card" style="margin-top: 50px">
                <div class="card-header">Register</div>
                <form:form action="${pageContext.request.contextPath}/inscription" cssClass="form-horizontal" method="post" modelAttribute="user">
                    <div class="card-body row">
                        <form:input path="id" type="hidden" />

                        <div class="form-group col-md-6 required ">
                            <label>Nom</label>
                            <form:input path="nom" type="text" name="nom" value="" class="form-control is-invalid"></form:input>
                            <form:errors path="nom"  class="invalid-feedback"  cssStyle="color: red" />
                        </div>

                        <div class="form-group col-md-6 required ">
                            <label>Prenom</label>
                            <form:input path="prenom" type="text" name="prenom" value="" class="form-control is-invalid"></form:input>
                            <form:errors path="prenom"  class="invalid-feedback"  cssStyle="color: red" />
                        </div>


                        <div class="form-group col-sm-12 required  ">
                            <label>Email</label>
                            <form:input path="email" type="text" name="email" value="" class="form-control is-invalid"></form:input>
                            <form:errors path="email"  class="invalid-feedback"  cssStyle="color: red" />
                        </div>


                        <div class="form-group col-md-6 required  ">
                            <label>Mot de pass</label>
                            <form:input path="password" type="password" name="motdepasse" autocomplete="off" class="form-control is-invalid"></form:input>
                            <form:errors path="password"  class="invalid-feedback"  cssStyle="color: red" />
                        </div>


                        <div class="form-group col-md-6 required  ">
                            <label>Retaper Password</label>
                            <form:input path="confirmedPassword" type="password" name="confirmedPassword" autocomplete="off" class="form-control is-invalid"></form:input>
                            <form:errors path="confirmedPassword" class="invalid-feedback"  cssStyle="color: red" />
                        </div>

                        <div class="form-group col-sm-12 required ">
                            <label>Image</label>
                            <form:input path="image" type="text" name="text" value="" class="form-control is-invalid"></form:input>
                            <form:errors path="image"  class="invalid-feedback"  cssStyle="color: red" />
                        </div>

                        <div class="form-group col-md-12">
                            <form:button class="btn btn-success btn-block">Inscription</form:button>
                        </div>
                    </div>
                </form:form>
                <div class="text-center">
                    <a class="d-block small mt-3" href="${pageContext.request.contextPath}/">Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
