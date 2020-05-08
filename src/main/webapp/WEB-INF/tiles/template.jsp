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
<title>나만의 루트를 만들다. 루트</title>
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css' integrity='sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh' crossorigin='anonymous'>
<style>
body {
  background-color: LightGray;
}
div.container {
  background: white;
  border: 1px solid gray;
  width: 1200px;
}
#categorybar {
  position:relative;
  width: 1200px;
  height: 40px;
  margin:0 auto
}
#navbarNav {
  position:relative;
  float:none;
  width: 700px;
}
#navlogo {
  font-weight: 400;
  font-size: 120%;
  color:white;
  margin: -4px;
}
.btn {
  margin-left: 5px;
}
.topline {
  background:#fff;
  border-bottom:1px solid #eee
}
.toparea {
  position:relative;
  margin:0 auto;
  width:1200px;
  height:30px
}
.loginbar{
  position:relative;
  float:right;
  height:30px;
  margin:0 auto;
  background:#fff
}
.loginbar span,.loginbar a{
  height:30px;
  line-height:30px;
  margin:0;
  padding:0 15px;
  text-align:right;
  font-size:14px;
  color:#999;
  background:0 0;
  ext-decoration:none;
  border-width: 0px;
}
</style>
</head>
<body>

<tiles:insertAttribute name="header"/>

<div class='container'>
<tiles:insertAttribute name="body"/>
</div>

<tiles:insertAttribute name="footer"/>

</body>
</html>