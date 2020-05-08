<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>공지 사항</h1>
<body>
  <table border='1' align="center">
  <tr align="center">
    <th>번호</th>
    <th>제목</th>
    <th>기간</th>
    <th>내용</th>
  </tr>
 <c:forEach items="${list}" var="info">
  <tr>
    <td>${info.no}</td> 
    <td><a href='detail?no=${info.no}'>=> ${info.title}</a></td> 
    <td>${info.createdDate}</td> 
    <td>${info.content}</td>
  </tr>
</c:forEach>
</table>
</body>
