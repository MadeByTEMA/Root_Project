<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h3>스크랩 리스트</h3>
<h5>데이 스크랩</h5>
<body>
  <table class="table table-hover" >
  <thead>
  <tr align="center">
    <th>제목</th>
    <th>여행일</th>
    <th>메인후기</th>
    <th>삭제</th>
  </tr>

  <c:forEach items="${day}" var="scrap">
      <tr>
        <td><a href='../review/detail?no=${scrap.review.no}'>${scrap.reviewDay.title}</td> 
        <td>${scrap.reviewDay.dayDate}</td> 
        <td>${scrap.reviewDay.mainReview}</td> 
        <td><button type="button" onclick="location.href='delete?no=${scrap.reviewDay.no}'">삭제</button></td>
      </tr>
  </c:forEach>
   </thead>
</table>

<table class="table table-hover" >
 <thead>
 <tr align="center">
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
        <td>${scrap.reviewPlace.name}</td> 
        <td>${scrap.reviewPlace.mainPhoto}</td> 
        <td>${scrap.reviewPlace.placeReview.substring(0,10)}</td> 
        <td>${scrap.reviewPlace.basicAddr}</td> 
        <td>${scrap.reviewPlace.detailAddr}</td> 
        <td><button type="button" onclick="location.href='delete?no=${scrap.reviewPlace.no}'">삭제</button></td>
      </tr>
  </c:forEach>
   </thead>
</table>

