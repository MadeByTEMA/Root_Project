<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>스크랩 리스트</h1>
<h5>데이 스크랩</h5>
  <table border='1'>
  <tr>
    <th>제목</th>
    <th>여행일</th>
    <th>메인후기</th>
    <th>삭제</th>
  </tr>

  <c:forEach items="${day}" var="scrap">
      <tr>
        <td><a href='../review/detail?no=${scrap.reviewDay.no}'>${scrap.reviewDay.title}</td> 
        <td>${scrap.reviewDay.dayDate}</td> 
        <td>${scrap.reviewDay.mainReview}</td> 
        <td><a href='delete?no=${scrap.reviewDay.no}'>삭제</a></td>
      </tr>
  </c:forEach>
</table>

 <table border='1'>
  <tr>
    <th>장소</th>
    <th>메인사진</th>
    <th>리뷰</th>
    <th>기본주소</th>
    <th>상세주소</th>
    <th>삭제</th>
  </tr>
<hr>
<h5>장소 스크랩</h5>
  <c:forEach items="${place}" var="scrap">
      <tr>
        <td>${scrap.reviewPlace.name}</a></td> 
        <td>${scrap.reviewPlace.mainPhoto}</a></td> 
        <td>${scrap.reviewPlace.placeReview.substring(0,10)}</td> 
        <td>${scrap.reviewPlace.basicAddr}</td> 
        <td>${scrap.reviewPlace.detailAddr}</td> 
        <td><a href='delete?no=${scrap.reviewPlace.no}'>삭제</a></td>
      </tr>
  </c:forEach>
</table>

<jsp:include page="../footer.jsp"/>
    