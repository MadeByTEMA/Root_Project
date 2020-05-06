<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>Detail</h1>
<c:if test="${point.userNo == point.traderNo}">
  <p> error : 유저와 상대 번호가 동일하여 에러!!! </p><br>
</c:if>
포인트 번호 : ${point.no} <br>
유저 번호 : ${point.userNo} <br>
상대 번호 : ${point.traderNo} <br>
포인트 타입 : ${point.pointType} <br>
분류 : ${point.content} <br>

<c:choose>
  <c:when test="${point.content == 1}">
    <p> content 1 입니다.</p>
  </c:when>
  <c:when test="${point.content == 2}">
    <p> content 2 입니다.</p>
  </c:when>
  <c:otherwise>
    <p> content 3 입니다.</p> 
  </c:otherwise>
</c:choose>



<jsp:include page="../footer.jsp"/>
    