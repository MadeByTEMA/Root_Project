<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<c:if test="${not empty refreshUrl}">
<meta http-equiv="Refresh" content="${refreshUrl}">
</c:if>


<link rel='stylesheet' href='${pageContext.getServletContext().getContextPath()}/semantic/dist/semantic.min.css'>
<link rel='stylesheet' href='${pageContext.getServletContext().getContextPath()}/node_modules/bootstrap/dist/css/bootstrap.min.css'>
<link rel='stylesheet' href='<tiles:getAsString name="css.common"/>'>
<link rel='stylesheet' href='<tiles:getAsString name="css.page"/>'>

<script src='${pageContext.getServletContext().getContextPath()}/node_modules/jquery/dist/jquery.min.js'></script>
<script src='${pageContext.getServletContext().getContextPath()}/node_modules/bootstrap/dist/js/bootstrap.min.js'></script>
<script src='${pageContext.getServletContext().getContextPath()}/node_modules//@popperjs/core/dist/umd/popper.min.js'></script>
<script src='${pageContext.getServletContext().getContextPath()}/node_modules/sweetalert/dist/sweetalert.min.js'></script>
<script src='${pageContext.getServletContext().getContextPath()}/semantic/dist/semantic.min.js'></script>

<title>나만의 루트를 만들다. 루트</title>
</head>
<body>

<div class='header'>
<tiles:insertAttribute name="header"/>
</div>

<div class='container'>
<tiles:insertAttribute name="body"/>
</div>

<div class='footer'>
<tiles:insertAttribute name="footer"/>
</div>

    


</body>
</html>