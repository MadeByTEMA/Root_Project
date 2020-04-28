<%@ page import="com.keep.root.domain.Course,com.keep.root.domain.CourseDay,com.keep.root.domain.CoursePlace,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>코스 상세</h1>

<c:if test="${not empty course}">

  <table border='1'>
  <tr>
    <th>제목</th>
    <th>여행일</th>
    <th>장소명</th>
    <th>기본주소</th>
    <th>상세주소</th>
    <th>비고</th>
    
  </tr>
  <c:forEach items="${course.courseDay}" var="courseDay">
    <c:forEach items="${courseDay.coursePlace}" var="courseplace">
      <tr>
        <td>${courseDay.title}</td> 
        <td>${courseDay.dayDate}</td> 
        <td>${courseplace.placeName}</td> 
        <td>${courseplace.basicAddr}</td> 
        <td>${courseplace.detailAddr}</td> 
        <td>${courseplace.etc}</td> 
      </tr>
   </c:forEach>
  </c:forEach>
</table>

  <a href='delete?no=${course.no}&userNo=${course.user.no}'>삭제</a>
</c:if>

<c:if test="${empty course}">
<p>해당 코스가 없습니다.</p>
</c:if>

<jsp:include page="../footer.jsp"/>
    