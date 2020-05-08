<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<form action='add' method='post' >
<h1> 제목: <input name='title' type='text'></h1><br>
여행예정일: <input name='dayDate' type="date"><br>

  <div id="placeForm">
  장소명: <input class='placeName' name='placeNames' type='text'><br>
  기본주소:<input type="text" class="basicAddr" name='basicAddrs' value="" style="width:240px;" readonly/> 
  <input type="button" onClick="openDaumZipAddress(this);" value = "주소 찾기" /><br/>
  상세주소:<input type="text" class="detailAddr" name='detailAddrs' value="" style="width:200px;"/> <br/>
    비고: <input class='etc' name='etcs' type='text'><br>
  </div>
  
  <div id="field"></div>
  
<button type="button" onclick="addForm()"> 코스 추가</button>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24cdf736c8b9797f29a0e35af3b6773a"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript">
    function openDaumZipAddress(btn) {
    	console.log($(btn.parentNode).find('.basicAddr'));
      new daum.Postcode({
        oncomplete:function(data) {
        	$(btn.parentNode).find('.basicAddr').val(data.address);
        	$(btn.parentNode).find('.detailAddr').focus();
          console.log(data);
        }
      }).open();
    }
    
  </script>

  <script>
  function addForm(){
  var div = document.createElement('div');
  var str = document.getElementById('placeForm').innerHTML;
  str +=  '<button type="button" onclick="remove_div(this)"> 코스 삭제</button>';
  div.innerHTML = str;
  document.getElementById('field').appendChild(div);
  }
  function remove_div(obj){
  document.getElementById('field').removeChild(obj.parentNode);
  }
  </script>
  
  
  
 <br>
<button>등록</button> <br>
</form>

