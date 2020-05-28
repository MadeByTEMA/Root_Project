<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h3>후기 리스트</h3>
<a href='form?no=newForm'>새 후기 등록</a><br>
<body>
  <table class="table table-hover" >
  <thead>
  <tr align="center">
    <th>제목</th>
    <th>여행예정일</th>
    <th>코스작성일</th>
    <th>삭제</th>
  </tr>
    </thead>
  <tbody>
  <c:forEach items="${list}" var="review">
    <c:forEach items="${review.reviewDay}" var="reviewday">
      <tr align="center">
        <td><a href='form?no=${review.no}'>${reviewday.title}</a></td> 
        <td>${reviewday.dayDate}</td> 
        <td>${review.createdDate}</td> 
        <td><a href='delete?no=${course.no}'>삭제</a></td>
      </tr>
   </c:forEach>
  </c:forEach>
    </tbody>
</table>
</body>

