<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <h3>리스트</h3>
  <body>
  <table class="table table-hover" >
  <thead>
  <tr align="center">
    <th>포인트 번호</th>
    <th>유저 번호</th>
    <th>상대 번호</th>
    <th>포인트 분류</th>
    <th>입출금 내용</th>
    <th>포인트 금액</th>
  </tr> 
  </thead>
    <tbody>
  
<c:forEach items="${list}" var="item">
   <tr align="center">
  <!-- <a href='output?no=${item.no}'> -->
    <td>${item.no}</td> 
    <td>${item.userNo}</td> 
    <td>${item.traderNo}</td> 
    <td>${item.pointType}</td>
    <td><a href='detail?no=${item.no}'>${item.content}</td>
    <td>${item.price}</td>
  </tr>
</c:forEach>
  </tbody>

<%--
<c:if test="${userNo == traderNo}">
  <p>해당번호가 동일할 수 없습니다.</p>
</c:if>
 --%>
 
 <%-- --%>
</table>
</body>

