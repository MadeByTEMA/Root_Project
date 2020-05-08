<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>게시물 상세정보</h1>

<c:if test="${not empty info}">
번호: ${info.no}<br>
제목: ${info.title}<br>
등록일: ${info.date}<br>
조회수: ${info.viewCount}<br>
</c:if>

<c:if test="${empty requestScope.board}">
<p>해당 게시물이 없습니다.</p>
</c:if>

