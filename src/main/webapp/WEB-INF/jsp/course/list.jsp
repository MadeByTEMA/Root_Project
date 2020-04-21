<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>코스 리스트</h1>
<a href='form'>새 코스 등록</a><br>
  <table border='1'>
  <tr>
    <th>제목</th>
    <th>여행예정일</th>
    <th>코스작성일</th>
  </tr>

  <c:forEach items="${list}" var="courselist">
    <c:forEach items="${courselist.courseDay}" var="daylist">
      <tr>
        <td>${daylist.title}</td> 
        <td>${daylist.dayDate}</td> 
        <td>${courselist.createdDate}</td> 
      </tr>
   </c:forEach>
  </c:forEach>
</table>

<jsp:include page="../footer.jsp"/>
    