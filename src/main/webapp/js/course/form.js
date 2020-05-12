  {
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
  mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
  };
  var map = new kakao.maps.Map(mapContainer, mapOption);
  }
  {
  // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
  var mapTypeControl = new kakao.maps.MapTypeControl();
  // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
  // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
  map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
  // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
  var zoomControl = new kakao.maps.ZoomControl();
  map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
  }
  
  var locationArray = new Array();
  var markerArray = new Array();
  var distanceArray = new Array();
  
  {
    var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
    var clickLine; // 마우스로 클릭한 좌표로 그려질 선 객체입니다
    var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
    var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
  }
  
  {
  var dragDropData = new Object();
  }
  
  function input(obj) {
    if (obj.parentNode.id=="placeForm") {
      document.getElementById("showPlaceName").value = (obj.value);
      /*
      console.log($(obj.parentNode).index());
      console.log(obj.value);
      console.log(obj.parentNode.parentNode.parentNode);
      console.log($(obj.parentNode).children('.placeName').value);
      */
    } else if (obj.parentNode.id==""){
      var rightFieldDiv = document.getElementById("rightField");
      var rightFieldChildDiv = null;
      for (var i = 0; i < rightFieldDiv.childNodes.length; i++) {
        if (i == $(obj.parentNode).index()) {
          $(rightFieldDiv.childNodes[i]).find('.showPlaceName').val(obj.value);
          break;
        }
      }
    }
  }
  
  function allowDrop(ev) {
    ev.preventDefault();
  }

  function drag(ev) {
    dragEvent = ev.target;
    if (ev.target.parentNode.parentNode.id == "rightField") {
      dragDropData.index = $(ev.target.parentNode).index();
      var leftFieldDiv = document.getElementById("leftField");
      for (var i = 0; i < leftFieldDiv.childNodes.length; i++) {
        if (i == dragDropData.index) {
          dragDropData.placeName = $(leftFieldDiv.childNodes[dragDropData.index]).find('.placeName').val();
          dragDropData.basicAddr = $(leftFieldDiv.childNodes[dragDropData.index]).find('.basicAddr').val();
          dragDropData.detailAddr = $(leftFieldDiv.childNodes[dragDropData.index]).find('.detailAddr').val();
          dragDropData.etc = $(leftFieldDiv.childNodes[dragDropData.index]).find('.etc').val();
          break;
        }
      }
    } else { // 가장 첫번째 place
      dragDropData.index = "first";
      var placeFormDiv = document.getElementById("placeForm");
      dragDropData.placeName = $(placeFormDiv).find('.placeName').val();
      dragDropData.basicAddr = $(placeFormDiv).find('.basicAddr').val();
      dragDropData.detailAddr = $(placeFormDiv).find('.detailAddr').val();
      dragDropData.etc = $(placeFormDiv).find('.etc').val();
    }
  }

  function drop(ev) {
    ev.preventDefault();
    var tempData = new Object();
    tempData.index = $(ev.target.parentNode).index();
    drawingFlag = false;
    if (dragDropData.index == "first") { // drag가 가장 첫번째 place인지 확인
      var leftFieldDiv = document.getElementById("leftField");
      tempData.placeName = $(leftFieldDiv.childNodes[tempData.index]).find('.placeName').val();
      tempData.basicAddr = $(leftFieldDiv.childNodes[tempData.index]).find('.basicAddr').val();
      tempData.detailAddr = $(leftFieldDiv.childNodes[tempData.index]).find('.detailAddr').val();
      tempData.etc = $(leftFieldDiv.childNodes[tempData.index]).find('.etc').val();
      
      $(leftFieldDiv.childNodes[tempData.index]).find('.placeName').val(dragDropData.placeName);
      $(leftFieldDiv.childNodes[tempData.index]).find('.basicAddr').val(dragDropData.basicAddr);
      $(leftFieldDiv.childNodes[tempData.index]).find('.detailAddr').val(dragDropData.detailAddr);
      $(leftFieldDiv.childNodes[tempData.index]).find('.etc').val(dragDropData.etc);
      
      var placeFormDiv = document.getElementById("placeForm");
      $(placeFormDiv).find('.placeName').val(tempData.placeName);
      $(placeFormDiv).find('.basicAddr').val(tempData.basicAddr);
      $(placeFormDiv).find('.detailAddr').val(tempData.detailAddr);
      $(placeFormDiv).find('.etc').val(tempData.etc);
      
      input(placeFormDiv.childNodes[1]);
      input(leftFieldDiv.childNodes[tempData.index].childNodes[1]);
      
    } else if (ev.target.parentNode.parentNode.id == "rightField") { // drag & drop 둘다 first place 아님.
      var leftFieldDiv = document.getElementById("leftField");
      tempData.placeName = $(leftFieldDiv.childNodes[tempData.index]).find('.placeName').val();
      tempData.basicAddr = $(leftFieldDiv.childNodes[tempData.index]).find('.basicAddr').val();
      tempData.detailAddr = $(leftFieldDiv.childNodes[tempData.index]).find('.detailAddr').val();
      tempData.etc = $(leftFieldDiv.childNodes[tempData.index]).find('.etc').val();
      
      $(leftFieldDiv.childNodes[tempData.index]).find('.placeName').val(dragDropData.placeName);
      $(leftFieldDiv.childNodes[tempData.index]).find('.basicAddr').val(dragDropData.basicAddr);
      $(leftFieldDiv.childNodes[tempData.index]).find('.detailAddr').val(dragDropData.detailAddr);
      $(leftFieldDiv.childNodes[tempData.index]).find('.etc').val(dragDropData.etc);
      
      $(leftFieldDiv.childNodes[dragDropData.index]).find('.placeName').val(tempData.placeName);
      $(leftFieldDiv.childNodes[dragDropData.index]).find('.basicAddr').val(tempData.basicAddr);
      $(leftFieldDiv.childNodes[dragDropData.index]).find('.detailAddr').val(tempData.detailAddr);
      $(leftFieldDiv.childNodes[dragDropData.index]).find('.etc').val(tempData.etc);
      
      input(leftFieldDiv.childNodes[tempData.index].childNodes[1]);
      input(leftFieldDiv.childNodes[dragDropData.index].childNodes[1]);
      
    } else { // drop이 first place.
      var placeFormDiv = document.getElementById("placeForm");
      tempData.placeName = $(placeFormDiv).find('.placeName').val();
      tempData.basicAddr = $(placeFormDiv).find('.basicAddr').val();
      tempData.detailAddr = $(placeFormDiv).find('.detailAddr').val();
      tempData.etc = $(placeFormDiv).find('.etc').val();
      
      $(placeFormDiv).find('.placeName').val(dragDropData.placeName);
      $(placeFormDiv).find('.basicAddr').val(dragDropData.basicAddr);
      $(placeFormDiv).find('.detailAddr').val(dragDropData.detailAddr);
      $(placeFormDiv).find('.etc').val(dragDropData.etc);
      
      var leftFieldDiv = document.getElementById("leftField");
      $(leftFieldDiv.childNodes[dragDropData.index]).find('.placeName').val(tempData.placeName);
      $(leftFieldDiv.childNodes[dragDropData.index]).find('.basicAddr').val(tempData.basicAddr);
      $(leftFieldDiv.childNodes[dragDropData.index]).find('.detailAddr').val(tempData.detailAddr);
      $(leftFieldDiv.childNodes[dragDropData.index]).find('.etc').val(tempData.etc);
      
      input(leftFieldDiv.childNodes[dragDropData.index].childNodes[1]);
      input(placeFormDiv.childNodes[1]);
      
    }
    
    getGeoLocation();
  }
  
  function getGeoLocation() {
    drawingFlag = false;
    deleteClickLine();
    deleteCircleDot();
    deleteDistnce();
    deleteMarker();
    locationArray = new Array();
    var geocoder = new kakao.maps.services.Geocoder();
    var basicAddrs = document.querySelectorAll('.basicAddr');
    console.log(basicAddrs.length);
    for (let i = 0; i < basicAddrs.length; i++) {
      geocoder.addressSearch(basicAddrs[i].value, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
          locationArray[i] = {x:result[0].x, y:result[0].y};
        }
      });
    }
    
    setTimeout(() => {
      displayMarkers(locationArray);      
    }, 1000);
  }
  
  function displayMarkers(geoLocations) {
    var bounds = new kakao.maps.LatLngBounds();

    for (var i = 0; i < geoLocations.length; i++) {
      var geoLocation = geoLocations[i];
      var markerPosition = new kakao.maps.LatLng(geoLocation.y, geoLocation.x);
      var marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(map);
      markerArray.push(marker);
      // LatLngBounds 객체에 좌표를 추가합니다
      bounds.extend(markerPosition);
      mapDrawingStart(i);
    }
    
    if (geoLocations.length == 1) {
      map.panTo(markerPosition);
    }
    map.setBounds(bounds);
  }
  
  function addForm(){
    var div = document.createElement('div');
    var str = document.getElementById('placeForm').innerHTML;
    str +=  '<button type="button" onclick="remove_div(this)"> 코스 삭제</button>';
    div.innerHTML = str;
    document.getElementById('leftField').appendChild(div);
    
    var div2 = document.createElement('div');
    var str2 = '<input class="showPlaceName" draggable="true" ondragstart="drag(event)" ondrop="drop(event)" ondragover="allowDrop(event)" type="text" readonly>';
    div2.innerHTML = str2;
    document.getElementById('rightField').appendChild(div2);
  }
  
  function remove_div(obj){
    document.getElementById('rightField').removeChild(document.getElementById("rightField").childNodes[$(obj.parentNode).index()]);
    document.getElementById('leftField').removeChild(obj.parentNode);
    getGeoLocation();
  }
  
  function openDaumZipAddress(btn) { // 주소 API 연결
    new daum.Postcode({
      oncomplete:function(data) {
        $(btn.parentNode).find('.basicAddr').val(data.address);
        $(btn.parentNode).find('.detailAddr').focus(); // 상세주소에 focus 주기
        getGeoLocation();
      }
    }).open();
  }
  
  function getLocation(address) {
    var geocoder = new kakao.maps.services.Geocoder();
    var location = new Object();
    var markerPosition = "";
    var callback = function(result, status) {
      if (status === kakao.maps.services.Status.OK) {
        location.x = result[0].x;
        location.y = result[0].y;
        locationArray.push(location);
        if (locationArray.length == 1) {
          deleteClickLine();
          deleteCircleDot();
          deleteDistnce();
          deleteMarker();
          markerPosition = new kakao.maps.LatLng(location.y, location.x);
          var marker = new kakao.maps.Marker({
            position: markerPosition
          });
          marker.setMap(map);
          markerArray.push(marker);
          map.panTo(markerPosition);
        } else {
          mapReMapping();
        }
      }
    };
    geocoder.addressSearch(address, callback);
  }
  
  
  function mapReMapping() {
  var bounds = new kakao.maps.LatLngBounds();
  var marker;
  drawingFlag = false;
  for (var i = 0; i < locationArray.length; i++) {
      // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
      var points = new kakao.maps.LatLng(locationArray[i].y, locationArray[i].x);
      marker = new kakao.maps.Marker({ position : points });
      marker.setMap(map);
      markerArray.push(marker);
      // LatLngBounds 객체에 좌표를 추가합니다
      bounds.extend(points);
      mapDrawingStart(i);
    }
    map.setBounds(bounds);
  }
  
  function mapDrawingStart(i) {
    var points = new kakao.maps.LatLng(locationArray[i].y, locationArray[i].x);
    if (!drawingFlag) {
      drawingFlag = true;
      deleteClickLine();
      deleteCircleDot();
      deleteDistnce();
      clickLine = new kakao.maps.Polyline({
        map: map, // 선을 표시할 지도입니다 
        path: [points], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
        strokeWeight: 3, // 선의 두께입니다 
        strokeColor: '#db4040', // 선의 색깔입니다
        strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
        strokeStyle: 'solid' // 선의 스타일입니다
      });
    } else {
      var preDistance = Math.round(clickLine.getLength());
      var path = clickLine.getPath();
      path.push(points);
      clickLine.setPath(path);
      var totalDistance = Math.round(clickLine.getLength());
      content = getTimeHTML(totalDistance - preDistance);
      showDistance(content, points);
    }
  }
  
  function deleteClickLine() {
    if (clickLine) {
        clickLine.setMap(null);    
        clickLine = null;        
    }
  }
  
  function deleteDistnce() {
    for (var i = 0; i < distanceArray.length; i++) {
      if (distanceArray[i]) {
      (distanceArray[i]).setMap(null);
      distanceArray[i] = null;
      delete distanceArray[i];
      }
    }
  }
  
  function deleteMarker() {
    for (var i = 0; i < markerArray.length; i++) {
      if (markerArray[i]) {
      (markerArray[i]).setMap(null);
      markerArray[i] = null;
      delete markerArray[i];
      }
    }
  }
  
  function deleteCircleDot() {
    var i;
    for ( i = 0; i < dots.length; i++ ){
        if (dots[i].distance) {
            dots[i].distance.setMap(null);
        }
    }

    dots = [];
}
  
  function showDistance(content, position) {
    distanceOverlay = new kakao.maps.CustomOverlay({
      map: map, // 커스텀오버레이를 표시할 지도입니다
      content: content,  // 커스텀오버레이에 표시할 내용입니다
      position: position, // 커스텀오버레이를 표시할 위치입니다.
      xAnchor: 0,
      yAnchor: 0,
      zIndex: 3  
  });
    distanceArray.push(distanceOverlay);
}

  function getTimeHTML(distance) {

    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
    var walkkTime = distance / 67 | 0;
    var walkHour = '', walkMin = '';

    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
    if (walkkTime > 60) {
        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
    }
    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
    var bycicleTime = distance / 227 | 0;
    var bycicleHour = '', bycicleMin = '';

    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
    if (bycicleTime > 60) {
        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
    }
    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
    var content = '<ul class="dotOverlay distanceInfo">';
    content += '    <li>';
    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
    content += '    </li>';
    content += '    <li>';
    content += '        <span class="label">도보</span>' + walkHour + walkMin;
    content += '    </li>';
    content += '    <li>';
    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
    content += '    </li>';
    content += '</ul>'

    return content;
}