<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>로그인</h1>
<form action='login' method='post'>
이메일: <input name='email' type='email' value='${cookie.email.value}'><br>
암호: <input name='password' type='password'><button>로그인</button><br>
<input type='checkbox' name='saveEmail'> 이메일 저장해두기<br>

</form>
  <a href='../user/findinfoform'>이메일/비밀번호 찾기</a><br>
  <a href='../user/form'>회원가입</a><br>

<jsp:include page="../footer.jsp"/>
    