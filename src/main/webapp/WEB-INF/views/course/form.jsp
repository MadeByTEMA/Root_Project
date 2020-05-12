<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
   
<form action='add' method='post' >
	<div class="titlebar">
	  <h1> <input name='title' type='text' placeholder="제목" style='width:100%;'></h1><br>
	</div>
	<div class='daybar'>
	   <div class='selectDay'>
	  여행예정일: <input class='dayDate' name='dayDate' type="date"><br>
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


