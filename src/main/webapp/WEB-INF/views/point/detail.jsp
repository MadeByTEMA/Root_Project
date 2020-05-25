<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>Detail</h1>
<c:if test="${point.userNo == point.traderNo}">
  <p> error : 유저와 상대 번호가 동일하여 에러</p><br>
</c:if>
포인트 번호 : ${point.no} <br>
유저 번호 : ${point.userNo} <br>
상대 번호 : ${point.traderNo} <br>
포인트 타입 : ${point.pointType} <br>
분류 : ${point.content} <br>

<c:choose>
  <c:when test="${point.content == 1}">
    <p> 포인트 적립</p>
  </c:when>
  <c:when test="${point.content == 2}">
    <p> 포인트 사용 </p>
  </c:when>
  <c:when test="${point.content == 3}">
    <p> 충전 결제</p>
  </c:when>
  <c:otherwise>
    <p> 출금 (계좌 출금)</p> 
  </c:otherwise>
</c:choose>
