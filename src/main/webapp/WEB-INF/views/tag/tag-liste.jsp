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
                Tags List
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <input type="button" style="float: left; border-radius: 50px;" value="Nouveau Tag"
                       onclick="window.location.href='${pageContext.request.contextPath}/tag/add'; return false;"
                       class="btn btn-primary" />

                <input type="button" style="text-align: center; border-radius: 50px;" value="Liste Users"
                       onclick="window.location.href='${pageContext.request.contextPath}/user/list'; return false;"
                       class="btn btn-primary" />

                <input type="button" style="float: right;border-radius: 50px;" value="Liste Articles"
                       onclick="window.location.href='${pageContext.request.contextPath}/article/'; return false;"
                       class="btn btn-primary" />
                <br/><br/>

                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div style="color: black" class="panel-title">Tag Lists</div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover  ">
                            <tr>
                                <th>title</th>
                                <th>created</th>
                                <th>modified</th>
                                <th>Action</th>
                            </tr>
                            <c:forEach items="${pageable.content}" var="item">
                                <tr>
                                    <td>${item.title}</td>
                                    <td>${item.created}</td>
                                    <td>${item.modified} </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/tag/delete/${pageable.number}/${item.id}" class="btn btn-danger"
                                           onclick="if (!(confirm('Voulez vous vraiment supprimer ce Tag?'))) return false">Delete</a>
                                        <a href="${pageContext.request.contextPath}/tag/add/${item.id}" class="btn btn-success">Modifier</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>

                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <c:choose>
                                    <c:when test="${pageable.number !=0 }">
                                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/tag/page/${pageable.number-1 }">Previous</a></li>
                                    </c:when>
                                </c:choose>
                                <c:forEach begin="0"   end="${pageable.totalPages -1}" var="i">
                                    <c:choose>
                                        <c:when test="${pageable.number ==i }">
                                            <li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/tag/page/${i}">${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/tag/page/${i}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${pageable.number <pageable.totalPages-1 }">
                                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/tag/page/${pageable.number+1 }">Next</a></li>
                                    </c:when>
                                </c:choose>
                            </ul>
                        </nav>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:directive.include file="../includes/footer.jsp"/>
</div>
</body>
</html>
