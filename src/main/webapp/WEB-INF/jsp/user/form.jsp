<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>회원가입</h1>
<form action='add' method='post' enctype='multipart/form-data'>
이메일: <input name='email' type='text'><br>
비밀번호: <input name='password' type='text'><br>
이름: <input name='name' type='text'><br>
생일: <input name='birth' type='text'><br>
성별: <input name='gender' type='text'><br>
전화번호: <input name='tel' type='text'><br>
우편번호: <input name='zipCode' type='text'><br>
기본주소: <input name='basicAddr' type='text'><br>
상세주소: <input name='detailAddr' type='text'><br>
사진: <input name='photoFile' type='file'><br>
별명: <input name='nickName' type='text'><br>
<button>등록</button>
</form>

<jsp:include page="../footer.jsp"/>
    