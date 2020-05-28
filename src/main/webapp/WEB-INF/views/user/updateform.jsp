<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="all">
<h3>정보수정</h3>
<form action='update' method='post' enctype='multipart/form-data'>
<div class="form-group" style="line-height:170%; font-size:12px; font-family:돋움;">
<img src='${pageContext.servletContext.contextPath}/upload/user/${loginUser.photo}' height='100' width='100' vspace=30 hspace=20 >
<input name='no' hidden value='${loginUser.no}'>
<input  name='photoFile' type='file'><br>
<input  name='nickName'  type="text" value='${loginUser.nickName}' class="search-query form-control" placeholder="별명" />
<input  name='email'  type="text" readonly value='${loginUser.email}' class="search-query form-control" placeholder="이메일" />
<input  name='password'  type="password" class="search-query form-control" placeholder="비밀번호" />
<input  name='name'  type="text" value='${loginUser.name}' class="search-query form-control" placeholder="이름" />
<input  name='birth'  type="date" value='${loginUser.birth}' class="search-query form-control" placeholder="생일" />
<c:choose>
  <c:when test="${loginUser.gender == 1}">
성별: 남 <input name='gender' type='radio' value=1 checked> 여 <input name='gender' type='radio' value=2><br>
  </c:when>
  <c:when test="${loginUser.gender == 2}">
성별: 남 <input name='gender' type='radio' value=1> 여 <input name='gender' type='radio' value=2 checked><br>
  </c:when>
</c:choose>
<input  name='tel'  type="tel" value='${loginUser.tel}' class="search-query form-control" placeholder="전화번호" />
<input  name='zipCode'  type="text" value='${loginUser.zipCode}' class="search-query form-control" placeholder="우편번호" />
<input  name='basicAddr'  type="text" value='${loginUser.basicAddr}' class="search-query form-control" placeholder="기본주소" />
<input  name='detailAddr'  type="text" value='${loginUser.detailAddr}' class="search-query form-control" placeholder="상세주소" />
<button id="btn2">등록</button>
</div>
</form>
</div>
