<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>공지 상세정보</h1>

<c:if test="${not empty info}">
<form action='detail' method='post'>
번호: <input name='no' readonly type='text' value='${info.no}'><br>
제목: <input name='title' readonly type='text' value='${info.title}'><br>
내용:<br>
<textarea name=content rows='5' cols='60' readonly="readonly" disabled>${info.content}</textarea><br>
장소: <input name='placeName' readonly type='text' value='${info.placeName}'><br>
시작일: <input name='startDate' readonly type='text' value='${info.startDate}'><br>
종료일: <input name='endDate' readonly type='text' value='${info.endDate}'><br>
기본주소: <input name='basicAddr' readonly type='text' value='${info.basicAddr}'><br>
상세주소: <input name='detailAddr' readonly type='text' value='${info.detailAddr}'><br>
</form>
</c:if>


<c:if test="${empty info}">
<p>공지가 없습니다.</p>
</c:if>



