<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
    
 <link href="../../style.css" rel="stylesheet" type="text/css">
<div class="all">
<h1>LOGIN</h1>
<form action='login' method='post'>
<div class="total">
<div class="content">
  <input name='email' type='email' value='${cookie.email.value}' placeholder="아아디" class="context-box" style="margin-bottom:30px;"><br>
  <input name='password' type='password' placeholder="비밀번호" class="context-box" style="margin-bottom:20px;">
</div>
</div>
  <input type='checkbox' name='saveEmail' class="context-text" style="margin-bottom:10px; text-algin:center;"> 이메일 저장해두기<br>
  <div class="total">
<button id="btn">로그인</button><br>
</div>
</form>
<div class="etc">
  <a href='../user/findinfoform' class="search">이메일/비밀번호 찾기</a>
  <a href='../user/form'>회원가입</a><br>
</div>
</div>
