<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="addForm" action='add' method='post'>
	<div class="reviewAddForm">
		<div class="topAreaDiv">
		  <div class="topStatusbar">
		    <div class="topStatusLeftStatusbar">
	         <div class="ui calendar" id="button_calendar">
	     <i class="fa fa-calendar-check-o" aria-hidden="true"></i>
	          <div class="ui button"><small>여행시작일</small></div>
	        </div>
	        
	
           
		      <div id="dropdown" class="ui disabled dropdown">
		        <input type="hidden" name="selectDate">
		        <i class="dropdown icon"></i>
		        <div class="default text">Day<div class="innerDate"></div></div>
		          <div class="menu">
		            <div class="item" draggable="true" ondragstart="courseDateDrag(event)" ondrop="courseDateDrop(event)" ondragover="allowDrop(event)" data-text="2020-05-02">
		              <div class="innerline">
		                <div class="innerlineDay">Day1</div><div class="innerlineDate" onclick="displaySelectReviewDateData(this);">2020-05-04</div></div>
		              <div class="minusArea">
		                <i class="minus icon"></i>
		              </div>
		            </div>
		            <div class="datePlus">
		              <i class="plus icon" onclick="addDate(this);"></i>
		            </div>
		        </div>
		      </div>
		    </div>
		    <div class="topStatusRightStatusbar">
		      <div class="myCourseLoadDiv">
		        <i class="fa fa-arrow-circle-o-down" aria-hidden="true"></i>
		        <div class="myCourseLoadText"><small>내 코스 불러오기</small></div>
		      </div>
		      <div class="mainPictureUploadDiv">
		       <i class="fa fa-camera" aria-hidden="true fa-5x"></i>
		          <input class="reviewDayMainPhoto" name="reviewDayMainPhotos" type="file" style="display:none"/>
		      </div>
		    </div>
		  </div>
		  
		  <div class="mb-4">
					<input name="titles" type="text" placeholder="제목">
					<span id="alert_nickName" style="color:grey;"></span><br>
					<!-- Solid divider -->
					<hr class="solid">
				</div>
		  <div class='topMainReviewbar'> 
		    <p> <input class="mainReview" name="mainReviews" type="text" placeholder="메인 후기"></p>
		  </div>
		</div>
		<div class='courseNameDiv'>
		  <h3>Course</h3>
		</div>
		<div id="map" style="width:100%; height:350px;"></div>
		<div class="reviewPlaceNamebar">
		  <div class="showReviewPlaceNameArea"><div class="showReviewPlaceName">1</div></div>
		</div>
		<div class="mainContentArea"> 
		  <div class="reviewPlaceArea"><div class="reviewPlace">
			    <div class="placeBasicbar">
				    <div class="revicePlaceName">
					<input name="placeName" name="names" type="text" onchange="matchShowReivewPlaceName();" value="" placeholder="장소명">
					<!-- Solid divider -->
				    <div class="placeRemove">
				      <i id="placeRemoveMinusButtonIcon" class="fa fa-minus-square-o" aria-hidden="true"></i>
				    </div>
					<hr class="solid">
				</div>
				
				    
				    <div class="reviewPlacePhotoArea">
				      <i id="placeMainPhoto" class="fa fa-camera" aria-hidden="true"></i>
				      <input class="reviewPlaceMainPhoto" name="reviewPlaceMainPhotos" type="file" style="display:none"/>
				    </div>
			    </div>
				  <div class="placeAddrbar">
				    <div class="reviceBasicAddr">
		          <input class="basicAddr" name="basicAddrs" onChange="getGeoLocation();" type="text" value="" placeholder="주소검색">
		          <div class="reviewAddrSearchIcon" onClick="openDaumZipAddress(this);">
		            <i id="placeRemoveMinusButtonIcon" class="fa fa-search" aria-hidden="true"></i>
		          </div>
		        </div>
		        <div class="reviceDetailAddr">
		          <input class="detailAddr" name="detailAddrs" type="text" value="">
		        </div>
		      </div>
	        <div class="reviewPlaceReview">
	           <div id="editor" class="ckEditor">
	           <input class="placeReview" name="placeReviews" type="text" value="">
	           </div>
	        </div>
	      </div></div>
		  <script>
      window.onload = function () {
        var reviewData = new Array();
        <c:forEach items="${review.reviewDay}" var="reviewDay" varStatus="dayStatus">
          var reviewDay = new Array();
          <c:forEach items="${reviewDay.reviewPlace}" var="reviewPlace" varStatus="placeStatus">
	          var reviewPlace = new Array();
	          <c:forEach items="${reviewPlace.reviewPlacePhotos}" var="reviewPlacePhoto" varStatus="placePhotoStatus">
	            var reviewPlacePhoto = new Object();
	            reviewPlacePhoto.photo = '${reviewPlacePhoto.photo}'
	            reviewPlace.push(reviewPlacePhoto);
	          </c:forEach>
	          reviewPlace.name = '${reviewPlace.name}'
	          reviewPlace.basicAddr = '${reviewPlace.basicAddr}'
	          reviewPlace.detailAddr = '${reviewPlace.detailAddr}'
            reviewPlace.placeReview = '${reviewPlace.placeReview}'
            reviewPlace.mainPhoto = '${reviewPlace.mainPhoto}'
            reviewDay.push(reviewPlace);
          </c:forEach>
          reviewDay.title = '${reviewDay.title}'
          reviewDay.dayDate = '${reviewDay.dayDate}'
          reviewDay.mainReview = '${reviewDay.mainReview}'
          reviewDay.mainPhoto = '${reviewDay.mainPhoto}'
          reviewData.push(reviewDay);
        </c:forEach>
        reviewData.no = ${review.no}
        reviewData.createdDate = '${review.createdDate}'
        reviewData.status = ${review.status}
        reviewDataInit(reviewData);
        }
      </script>
		  <div class="reviewPlacePlusArea">
		    <div class="placePlus">
		      <i id="placeAddPlusButtonIcon"class="fa fa-plus-square-o" aria-hidden="true"></i>
		    </div>
		  </div>
			<div class="buttonArea">
			  <button id="btn2" type="button" onclick="submitForm(2)">저장하기</button>
			  <button id="btn2" type="button" onclick="submitForm(1)">게시하기</button>
			</div>
		</div>
	</div>
</form>

<div class="ui basic modal">
  <div class="ui icon header">
    <i class="archive icon"></i>
    저장하시겠습니까 ?
  </div>
  <div class="actions">
    <div class="ui red basic cancel inverted button">
      <i class="remove icon"></i>
      No
    </div>
    <div class="ui green ok inverted button">
      <i class="checkmark icon"></i>
      Yes
    </div>
  </div>
</div>

<div id="loadCourseModal" class="ui longer modal">
  <i class="close icon"></i>
  <div class="header">
    내 코스 불러오기
  </div>
  <div class="mainContent">
    <div class="myCourseContent">
    <c:forEach items="${list}" var="course" varStatus="courseStatus">
    <c:forEach items="${course.courseDay}" var="courseDay" varStatus="dayStatus">
	    <div class="dayContent">
	      <div class="dayTopbar">
	        <div class="dayLeftTopbar">
	        <c:if test="${empty list }">
	          <div class="myCourseTitle">내 코스가 없습니다. 코스를 작성해주세요.</div>
	        </c:if>
	        <c:if test="${not empty list}">
	         <div class="myCourseTitle">${courseDay.title}</div>
	        </c:if>
	        </div>
	        <div class="dayRightTopbar">
	          <div class="myCourseDayDate">${courseDay.dayDate}</div>
	          <div class="myCourseSelect">
	            <div class="ui red rating" data-icon="heart"><i class="red big heart icon"></i></div>
	          </div>
	        </div>
	      </div>
	      <c:forEach items="${courseDay.coursePlace}" var="coursePlace" varStatus="placeStatus">
	      <div class="dayMainContent">
	        <div class="myCoursePlaceName">${coursePlace.placeName}</div>
	        <div class="myCoursePlaceAddr">
		        <div class="myCoursePlaceBasicAddr">${coursePlace.basicAddr}</div>
		        <div class="myCoursePlaceDetailAddr">${coursePlace.detailAddr}</div>
	        </div>
	      </div>
	      </c:forEach>
	    </div>
	    </c:forEach>
	    </c:forEach>
    </div>
   </div>
   <div class="footerButton">
    <div id="exitButton" class="ui positive right labeled icon button">
	     적용완료
	     <i class="checkmark icon"></i>
    </div>
  </div>
</div>
<script>


</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24cdf736c8b9797f29a0e35af3b6773a&libraries=services,clusterer,drawing"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src='${pageContext.getServletContext().getContextPath()}/ckeditor5/build/ckeditor.js'></script>
<script type="text/JavaScript" src="../../js/review/form.js"></script>
