<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <div class="ui sidebar inverted vertical menu ">
	  <div id="accordionArea" class="ui styled accordion">
		  <div id="DayScrapArea" class="active title">
		    <i class="dropdown icon"></i>
		    DayScrap
		  </div>
	      <div class="active content">
	        <div class="accordion">
		        <c:forEach items="${scrapDays}" var="scrapDay" varStatus="status">
		          <c:if test="${status.first}">
		            <div class="active title">
                  <i class="dropdown icon"></i>
                  ${scrapDay.reviewDay.title}
                </div>
              </c:if>
		          <c:if test="${!status.first}">
		            <div class="title">
		              <i class="dropdown icon"></i>
                  ${scrapDay.reviewDay.title}
                </div>
		          </c:if>
              <div class="active content">
                <div class="accordion">
                  <c:forEach items="${scrapDay.reviewDay.reviewPlace}" var="scrapPlace" varStatus="placeStatus">
                    <div class="title">
                      <i class="dropdown icon"></i>
                      ${scrapPlace.name}
                    </div>
                    <div class="content">
                      ${scrapPlace.basicAddr}<br>
                      ${scrapPlace.detailAddr}
                    <div class="ui heart rating"></div>
                    </div>
                  </c:forEach>
                </div>
              </div>
		        </c:forEach>
	        </div>
	      </div>
		  <div id="PlaceScrapArea" class="title">
		    <i class="dropdown icon"></i>
		    PlaceScrap
		  </div>
		  <div class="content">
		    <div class="accordion">
		      <c:forEach items="${scrapPlaces}" var="scrapPlace" varStatus="status">
            <c:if test="${status.first}">
              <div class="active title">
                <i class="dropdown icon"></i>
                ${scrapPlace.reviewPlace.name}
              </div>
              <div class="content">
                ${scrapPlace.reviewPlace.basicAddr}<br>
                ${scrapPlace.reviewPlace.detailAddr}
                <div class="ui heart rating"></div>
              </div>
            </c:if>
            <c:if test="${!status.first}">
                <div class="title">
                <i class="dropdown icon"></i>
                ${scrapPlace.reviewPlace.name}
              </div>
              <div class="content">
                ${scrapPlace.reviewPlace.basicAddr}<br>
                ${scrapPlace.reviewPlace.detailAddr}
                <div class="ui heart rating"></div>
              </div>
            </c:if>
		      </c:forEach>
		    </div>
		  </div>
		</div>
  </div>
  <div class="pusher"></div>
  


<form action='add' method='post' >
	<div class="titlebar">
	  <h1> <input name='title' type='text' placeholder="제목" style='width:100%;'></h1><br>
	</div>
  <div class='statebar'>
    <div class='leftStatebar'>
      <input type="button" onClick="sidebarToggle();" id="menu" class="ui button" value="Scrap">
    </div>
		<div class='rightStatebar'>
		  <div class='selectDay'>
		  여행예정일: <input class='dayDate' name='dayDate' type="date"><br>
		  </div>
		  <div id='dropdown' class="ui selection dropdown">
			  <input type="hidden" name="gender">
			  <i class="dropdown icon"></i>
			  <div class="default text">Day</div>
				  <div class="menu">
				    <div class="item" data-text="2020-05-02">2020-05-04
				      <i class="minus icon"></i>
				    </div>
				    <div class="plus">
				      <i class="plus icon"></i>
				    </div>
			  </div>
	    </div>
		</div>
	</div>
	<div class='content'>
		<div class='leftContent'>
		  <div id="placeForm">
			  장소명: <input class='placeName'  onchange="input(this);" name='placeNames' type='text'><br>
			  기본주소:<input type="text" class="basicAddr" name='basicAddrs' style='width:240px;' readonly/> 
			  <input type="button" onChange="getGeoLocation();" onClick="openDaumZipAddress(this);" value = "주소 찾기" /><br/>
			  상세주소:<input type="text" class="detailAddr" name='detailAddrs' style="width:240px;"/> <br/>
			  비고: <input class='etc' name='etcs' type='text'><br>
		  </div>
		  <div id="leftField"></div>
				<button type="button" onclick="addForm()"> 코스 추가</button> <br>
				<button>등록</button> <br>
		  </div>
		<div class=rightContent> 
			<div id="map" style="width:100%; height:350px;"></div>
			  <input class='showPlaceName' id='showPlaceName' draggable="true" ondragstart="drag(event)" ondrop="drop(event)" ondragover="allowDrop(event)" type='text' readonly>
			<div id="rightField" ></div>
		</div>
	</div>
</form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24cdf736c8b9797f29a0e35af3b6773a&libraries=services,clusterer,drawing"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/JavaScript" src="../../js/course/form.js">  </script>





