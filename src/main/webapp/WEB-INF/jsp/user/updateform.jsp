<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>정보수정</h1>
<form action='update' method='post' enctype='multipart/form-data'>
<img src='${pageContext.servletContext.contextPath}/upload/user/${loginUser.photo}' width='360'>
<input name='no' hidden value='${loginUser.no}'><br>
사진: <input name='photoFile' type='file' ><br>
별명: <input name='nickName' type='text' value='${loginUser.nickName}'><br>  
이메일: <input name='email' type='text' readonly value='${loginUser.email}'><br>
비밀번호: <input name='password' type="password"><br>
이름: <input name='name' type='text' value='${loginUser.name}'><br>
생일: <input name='birth' type="date" value='${loginUser.birth}'><br>
<c:choose>
  <c:when test="${loginUser.gender == 1}">
성별: 남 <input name='gender' type='radio' value=1 checked> 여 <input name='gender' type='radio' value=2><br>
  </c:when>
  <c:when test="${loginUser.gender == 2}">
성별: 남 <input name='gender' type='radio' value=1> 여 <input name='gender' type='radio' value=2 checked><br>
  </c:when>
</c:choose>
전화번호: <input name='tel' type="tel" value='${loginUser.tel}'><br>
우편번호: <input name='zipCode' type='text' value='${loginUser.zipCode}'><br>
기본주소: <input name='basicAddr' type='text' value='${loginUser.basicAddr}'><br>
상세주소: <input name='detailAddr' type='text' value='${loginUser.detailAddr}'><br>
<button>등록</button>
</form>

<jsp:include page="../footer.jsp"/>
    