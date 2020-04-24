<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>후기 상세</h1>

<c:if test="${not empty review}">

  <table border='1'>
  <tr>
    <th>제목</th>
    <th>여행일</th>
    <th>후기</th>
    <th>장소명</th>
    <th>기본주소</th>
    <th>상세주소</th>
    <th>장소후기</th>
    
  </tr>
  
  <c:forEach items="${reviewday}" var="reviewDay">
    <c:forEach items="${reviewDay.reviewPlace}" var="place">
      <tr>
        <td>${reviewDay.title}</td> 
        <td>${reviewDay.dayDate}</td>
        <td>${reviewDay.mainReview}</td>  
        <td>${place.name}</td> 
        <td>${place.basicAddr}</td> 
        <td>${place.detailAddr}</td> 
        <td>${place.placeReview}</td> 
      </tr>
   </c:forEach>
  </c:forEach>
</table>

  <a href='delete?no=${review.no}&userNo=${review.user.no}'>삭제</a>
</c:if>

<c:if test="${empty review}">
<p>해당 후기가 없습니다.</p>
</c:if>

<jsp:include page="../footer.jsp"/>
    