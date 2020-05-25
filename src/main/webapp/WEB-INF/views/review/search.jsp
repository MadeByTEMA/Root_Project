<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
div.Search_total {
  width :1140px;
}

div.search_repeat {
  border: 1px solid;
}

div.day_layoutCon {
  width : 1140px;
  margin-bottom: 50px;
}

div.search_repeat_place_photo {
  width :200px;
  height: 130px;
}
div.repeat_control {
  position : relative;
  width : 800px;
}

.search_repeat_place_photo, search_repeat_place_title, search_repeat_place_review {
  float: left;
}

</style>
<h1>검색 리스트</h1>
<div class="Search_total">
  <div class="day_layoutCon">
	  <div class="day_search">
	  <h1>#데이 검색 리스트</h1>
	    <c:forEach items="${searchDayList}" var="searchDay">
	      <div class="search_repeat">
	          <div class="search_repeat_place_photo">
					    메인사진 (#Detail)<br>
					    <a href='searchDayDetail?no=${searchDay.no}'><img src="" alt="${searchDay.mainPhoto}"><br>
				    </div>
				    <div class="repeat_control">
					    <div class="search_repeat_place">
							   주제 <br>  
							    <p><a href='searchDayDetail?no=${searchDay.no}'>${searchDay.title}</p> <br>
						     리뷰 <br>
						      <p><a href='searchDayDetail?no=${searchDay.no}'>${searchDay.mainReview}</p> <br>
					    </div>
			      </div>
	      </div>
	    </c:forEach>
	  </div>  
  </div>
  <div class="place_layoutCon">
    <h1>#장소 검색 리스트</h1>
	  <div class="place_search">
	     <c:forEach items="${searchPlaceList}" var="searchPlace">
	       <div class="search_repeat">
	            메인 사진 : <a href='searchPlaceDetail?no=${searchPlace.no}'><img src="" alt="${searchPlace.mainPhoto}"><br>
	            장소 : ${searchPlace.name} <br>
	            리뷰 : ${searchPlace.placeReview.substring(0,10)} <br>
	        </div>
	      </c:forEach>
	   </div>
   </div>
</div>



