<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <h3>사용자별 포인트 리스트</h3>
  <td>${user.name} 의 출금 리스트 </td>
  
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

  
<c:forEach items="${userlist}" var="item">
  <tr>
    <td>${item.no}</td> 
    <td>${item.userNo}</td> 
    <td>${item.traderNo}</td> 
    <td>${item.pointType}</td>
    <td><a href='detail?no=${item.no}'>${item.content}</td>
    <td>${item.price}</td>
  </tr>
</c:forEach>

<%--
<c:if test="${userNo == traderNo}">
  <p>해당번호가 동일할 수 없습니다.</p>
</c:if>
 --%>
</table>

