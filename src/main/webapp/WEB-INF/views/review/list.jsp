<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>후기 리스트</h1>
<a href='form'>새 후기 등록</a><br>
  <table border='1'>
  <tr>
    <th>제목</th>
    <th>여행예정일</th>
    <th>코스작성일</th>
  </tr>

  <c:forEach items="${list}" var="review">
    <c:forEach items="${review.reviewDay}" var="reviewday">
      <tr>
        <td><a href='detail?no=${review.no}'>${reviewday.title}</a></td> 
        <td>${reviewday.dayDate}</td> 
        <td>${review.createdDate}</td> 
      </tr>
   </c:forEach>
  </c:forEach>
</table>

