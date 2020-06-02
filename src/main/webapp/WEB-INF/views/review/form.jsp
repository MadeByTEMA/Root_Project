<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action='add' method='post' enctype='multipart/form-data'>
	<div class="reviewAddForm">
		<div class="topAreaDiv">
		  <div class="topStatusbar">
		    <div class="topStatusLeftStatusbar">
	        <div class="ui calendar" id="button_calendar">
	          <div class="ui button">여행시작일</div>
	        </div>
		      <div id="dropdown" class="ui disabled dropdown">
		        <input type="hidden" name="selectDate">
		        <i class="dropdown icon"></i>
		        <div class="default text">Day<div class="innerDate">2020-05-04</div></div>
		          <div class="menu">
		            <div class="item" draggable="true" ondragstart="courseDateDrag(event)" ondrop="courseDateDrop(event)" ondragover="allowDrop(event)" data-text="2020-05-02">
		              <div class="innerline">
		                <div class="innerlineDay">Day1</div><div class="innerlineDate" onclick="displaySelectReviewDateData(this);">2020-05-04</div></div>
		              <div class="minusArea">
		                <i class="minus icon"></i>
		              </div>
		            </div>
		            <div class="datePlus">
		              <i class="plus icon"></i>
		            </div>
		        </div>
		      </div>
		    </div>
		    <div class="topStatusRightStatusbar">
		      <div class="myCourseLoadDiv">
		        <i class="big cloud download alternate icon"></i>
		        <div class="myCourseLoadText">내 코스 불러오기</div>
		      </div>
		      <div class="MainPictureUploadDiv">
		        <i class="big camera retro icon"></i>
		      </div>
		    </div>
		  </div>
		  <div class='topTitlebar'> 
		    <h1> <input class="title" name="title" type="text" placeholder="제목"></h1>
		  </div>
		  <div class='topMainReviewbar'> 
		    <p> <input class="mainReview" name="mainReview" type="text" placeholder="메인 후기"></p>
		  </div>
		</div>
		<div class='courseNameDiv'>
		  <h1>Course</h1>
		</div>
		<div id="map" style="width:100%; height:350px;"></div>
		<div class="reviewPlaceNamebar">
		  <div class="showReviewPlaceNameArea"><div class="showReviewPlaceName">1</div></div>
		</div>
		<div class="mainContentArea"> 
		  <div class="reviewPlaceArea"><div class="reviewPlace">
			    <div class="placeBasicbar">
				    <div class="revicePlaceName">
				      <input class="placeName" name="placeNames" type="text" onchange="matchShowReivewPlaceName();" value="" placeholder="장소명">
				    </div>
				    <div class="placeRemove">
				      <i id="placeRemoveMinusButtonIcon" class="big minus circle icon"></i>
				    </div>
				    <div class="reviewPlacePhotoArea">
				      <i id="placeMainPhoto" class="big camera icon"></i>
				    </div>
			    </div>
				  <div class="placeAddrbar">
				    <div class="reviceBasicAddr">
		          <input class="basicAddr" name="basicAddrs" onChange="getGeoLocation();" type="text" value="">
		          <div class="reviewAddrSearchIcon" onClick="openDaumZipAddress(this);">
		            <i id="placeRemoveMinusButtonIcon" class="big search icon"></i>
		          </div>
		        </div>
		        <div class="reviceDetailAddr">
		          <input class="detailAddr" name="detailAddrs" type="text" value="">
		        </div>
		      </div>
	        <div class="reviewPlaceReview">
	           <div id="editor" class="toastEditor">
	           <input class="placeReview" name="placeReviews" type="text" value="">
	           </div>
	        </div>
	      </div></div>
		  <script>
      window.onload = function () {
        var reviewData = new Array();
        <c:forEach items="${review.reviewDay}" var="reviewDay" varStatus="dayStatus">
          var reviewDays = new Array();
          <c:forEach items="${reviewDay.reviewPlace}" var="reviewPlace" varStatus="placeStatus">
	          var reviewPlaces = new Array();
	          <c:forEach items="${reviewPlace.reviewPlacePhotos}" var="reviewPlacePhoto" varStatus="placePhotoStatus">
	            var reviewPlacePhoto = new Object();
	            reviewPlacePhoto.photo = '${reviewPlacePhoto.photo}'
	            reviewPlaces.push(reviewPlacePhoto);
	          </c:forEach>
	          reviewPlaces.name = '${reviewPlace.name}'
	          reviewPlaces.basicAddr = '${reviewPlace.basicAddr}'
            reviewPlaces.detailAddr = '${reviewPlace.detailAddr}'
            reviewPlaces.placeReview = '${reviewPlace.placeReview}'
            reviewPlaces.mainPhoto = '${reviewPlace.mainPhoto}'
            reviewPlaces.status = ${reviewPlace.status};
            reviewDays.push(reviewPlaces);
          </c:forEach>
          reviewDays.title = '${reviewDay.title}'
          reviewDays.dayDate = '${reviewDay.dayDate}'
          reviewDays.mainReview = '${reviewDay.mainReview}'
          reviewDays.mainPhoto = '${reviewDay.mainPhoto}'
          reviewDays.status = ${reviewDay.status};
          reviewData.push(reviewDays);
        </c:forEach>
        reviewData.no = ${review.no};
        reviewData.createdDate = '${review.createdDate}'
        reviewData.status = ${review.status}
        reviewDataInit(reviewData);
        }
      </script>
		  <div class="reviewPlacePlusArea">
		    <div class="placePlus">
		      <i id="placeAddPlusButtonIcon" class="big plus circle icon"></i>
		    </div>
		  </div>
			<div class="buttonArea">
			  <button type="button" onclick="addForm()">임시저장</button>
			  <button type="button" onclick="addForm()">게시하기</button>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24cdf736c8b9797f29a0e35af3b6773a&libraries=services,clusterer,drawing"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/JavaScript" src="../../js/review/form.js"></script>
