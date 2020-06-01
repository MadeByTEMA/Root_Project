	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



	<!-- For Demo Purpose -->
	<header class="py-5">
		<h3>정보수정</h3>
	</header>


	<div class="row">
		<div class="col-lg-8 mx-auto">
			<form action='update' method='post' enctype='multipart/form-data'>
			
				<img
					src='${pageContext.servletContext.contextPath}/upload/user/${loginUser.photo}'
					height='100' width='100' vspace=30 hspace=20>

				<!--사진파일-->
				<div class="mb-4">
					<input name='photoFile' type='file'><br>
				</div>
				<!--번호-->
				<label>번호</label>
				<div class="mb-4">
					<input name='no' value='${loginUser.no}' readonly/>
					<!-- Solid divider -->
					<hr class="solid">
				</div>
				<!--닉네임-->
				<label>닉네임</label>
				<div class="mb-4">
					<input name='nickName' type="text" value='${loginUser.nickName}'/>
					<!-- Solid divider -->
					<hr class="solid">
				</div>
				<!--이메일-->
				<label>이메일</label>
				<div class="mb-4">
					<input name='email' type="text" readonly value='${loginUser.email}' />
					<!-- Solid divider -->
					<hr class="solid">
				</div>
				<!--비밀번호-->
				<label>비밀번호</label>
				<div class="mb-4">
					<input name='password' type="password"/>
					<!-- Solid divider -->
					<hr class="solid">
				</div>
				<!--이름-->
				<label>이름</label>
				<div class="mb-4">
					<input name='name' type="text" value='${loginUser.name}' />
					<!-- Solid divider -->
					<hr class="solid">
				</div>
				<!--생일-->
				<label>생년월일</label>
				<div class="mb-4">
					<input name='birth' type="date" value='${loginUser.birth}'/>
					<!-- Solid divider -->
					<hr class="solid">
				</div>
				
				<!--성별-->
				<div class="mb-4">
					<c:choose>
						<c:when test="${loginUser.gender == 1}">
					남 <input name='gender' type='radio' value=1 checked> 여 <input
								name='gender' type='radio' value=2>
							<br>
						</c:when>
						<c:when test="${loginUser.gender == 2}">
					남 <input name='gender' type='radio' value=1> 여 <input
								name='gender' type='radio' value=2 checked>
							<br>
						</c:when>
					</c:choose>
					<!-- Solid divider -->
					<hr class="solid">
				</div>
				<!--전화번호-->
				<label>전화번호</label>
				<div class="mb-4">
					<input name='tel' type="tel" value='${loginUser.tel}'/>
					<!-- Solid divider -->
					<hr class="solid">
				</div>

				<!--우편번호-->
				<label>우편번호</label>
				<div class="mb-4">
					<input name='zipCode' type="text" value='${loginUser.zipCode}'/>
					<!-- Solid divider -->
					<hr class="solid">
				</div>


				<!--기본주소-->
				<label>기본주소</label>
				<div class="mb-4">
					<input name='basicAddr' type="text" value='${loginUser.basicAddr}'>
					<!-- Solid divider -->
					<hr class="solid">
				</div>


				<!--상세주소-->
				<label>상세주소</label>
				<div class="mb-4">
					<input name='detailAddr' type="text"
						value='${loginUser.detailAddr}'/>
					<!-- Solid divider -->
					<hr class="solid">
				</div>

			</form>
<button id="btn2" onclick="alert()">등록</button>
<script> 
function alert(){
	alert("등록되었습니다.");
}
</script>

		</div>
	</div>






