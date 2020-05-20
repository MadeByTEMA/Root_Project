<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h3>공지 사항</h3>
<ul class="nav justify-content-center">
  <li class="nav-item">
    <a class="nav-link active" onclick="test(this)">공지</a>
  <li class="nav-item">
    <a class="nav-link" href="category?no=3">이벤트</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="category?no=2">기타</a>
  </li>
  
</ul>

<script>
 $('#test').css('display', 'none');
</script>
<body>
  <table class="table table-hover" >
  <thead>
  <tr align="center">
    <th>#</th>
    <th>제목</th>
    <th>기간</th>
    <th>내용</th>
  </tr>
  </thead>
  <tbody>
  <div id='test'>
 <c:forEach items="${list}" var="info">
 <tr align="center">
    <td>${info.no}</td> 
    <td><a href='detail?no=${info.no}'>${info.title}</a></td> 
    <td>${info.createdDate}</td> 
    <td>${info.content}</td>
  </tr>
</c:forEach>
</div>
  </tbody>
</table>
</body>
