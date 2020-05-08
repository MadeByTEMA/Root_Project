<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
<img src='${pageContext.servletContext.contextPath}/upload/user/${loginUser.photo}' width='360'> ${loginUser.name}  <a href='../user/updateform' class='btn btn-success btn-sm'>정보수정</a><br>
</div>
<div>
  스크랩 <a href='../scrap/list' class='btn btn-success btn-sm'>스크랩(미구현)</a>
</div>
<div>
  포인트 <a href='../point/list' class='btn btn-success btn-sm'>포인트(미구현)</a>
</div>
<div>
  출금 <a href='../point/withdraw' class='btn btn-success btn-sm'>출금(미구현)</a>
</div>

