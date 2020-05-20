<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="../../form.css" rel="stylesheet" type="text/css">


<div class="all">
		<div>
					<h3>내 정보</h3>

					<div class="form-group" style="line-height:300%; font-size:12px; font-family:돋움;">
					<div>
					<img src='${pageContext.servletContext.contextPath}/upload/user/${loginUser.photo}' height='100' width='100' vspace=30 hspace=20 text-align:center><br>
						
						${loginUser.name} 
						<a href="../user/updateform" id="btn2" >정보수정</a><br>
						</div>
						<div>
						스크랩 : <a href="../scrap/list" id="btn2">스크랩</a><br>
						</div>
						<div>
						포인트 : <a href="../point/userlist?userNo=${loginUser.no}" id="btn2">포인트(미구현)</a><br>
						</div>
						<div>
						출금 : <a href="../point/form?userNo=${loginUser.no}" id="btn2">출금(미구현)</a>
						</div>
					</div>
				</div>
			
	</div>