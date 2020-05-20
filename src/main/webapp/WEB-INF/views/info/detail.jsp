<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h3>공지 상세정보</h3>

<c:if test="${not empty info}">
<form action='detail' method='post'>
 <div class="form-group">
    <label for="exampleFormControlInput1">번호</label>
    <input readonly type="text" class="form-control" id="exampleFormControlInput1" value='${info.no}'><br>
     <label for="exampleFormControlInput1">제목</label>
    <input readonly type="text" class="form-control" id="exampleFormControlInput1" value='${info.title}'><br>
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">내용</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"readonly="readonly" disabled>${info.content}</textarea><br>
  </div>
  <label for="exampleFormControlInput1">장소</label>
    <input readonly type="text" class="form-control" id="exampleFormControlInput1" value='${info.placeName}'><br>
    <label for="exampleFormControlInput1">시작일</label>
    <input readonly type="text" class="form-control" id="exampleFormControlInput1" value='${info.startDate}'><br>
    <label for="exampleFormControlInput1">종료일</label>
    <input readonly type="text" class="form-control" id="exampleFormControlInput1" value='${info.endDate}'><br>
    <label for="exampleFormControlInput1">기본주소</label>
    <input readonly type="text" class="form-control" id="exampleFormControlInput1" value='${info.basicAddr}'><br>
    <label for="exampleFormControlInput1">상세주소</label>
    <input readonly type="text" class="form-control" id="exampleFormControlInput1" value='${info.detailAddr}'><br>
</form>
</c:if>


<c:if test="${empty info}">
<p>공지가 없습니다.</p>
</c:if>



