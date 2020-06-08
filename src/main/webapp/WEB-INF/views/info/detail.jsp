<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>공지 상세정보</h3>

<c:if test="${not empty info}">
	<form action='detail' method='post'>
		<div class="form-group">
			<div class="topAreaDiv">
				<div class="topStatusbar">
					<div class="topStatusLeftStatusbar">
						<div class="mb-4">
							no <input readonly type="text" value='${info.no}'
								id="exampleFormControlInput1">
						</div>

					</div>
				</div>
				<div class="mb-4">
					제목  <input name="titles" type="text" value='${info.title}'>
					<span id="alert_nickName" style="color: grey;"></span><br>
					<!-- Solid divider -->
					<hr class="solid">
				</div>
				<div class="mb-4">
					<input readonly type="text" value='${info.content}'>
				</div>
			</div>
			<div class="mb-4">
				장소  <input readonly type="text" value='${info.placeName}'>
				<!-- Solid divider -->
				<hr class="solid">
			</div>

			<div class="mb-4">
				시작일  <input readonly type="text" value='${info.startDate}'>
				<!-- Solid divider -->
				<hr class="solid">
			</div>
			<div class="mb-4">
				종료일  <input readonly type="text" value='${info.endDate}'>
				<!-- Solid divider -->
				<hr class="solid">
			</div>
			<div class="mb-4">
				기본주소  <input readonly type="text" value='${info.basicAddr}'>
				<!-- Solid divider -->
				<hr class="solid">
			</div>
			<div class="mb-4">
				상세주소  <input readonly type="text" value='${info.detailAddr}'>
				<!-- Solid divider -->
				<hr class="solid">
			</div>

		</div>
	</form>


</c:if>


<c:if test="${empty info}">
	<p>공지가 없습니다.</p>
</c:if>



