var review = new Array();

{
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
  mapOption = { 
  center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
  level: 3 // 지도의 확대 레벨
};
var map = new kakao.maps.Map(mapContainer, mapOption);
}

{
//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();
//지도에 컨트롤을 추가해야 지도위에 표시됩니다
//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
//지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성합니다
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

$('.ui.dropdown').dropdown({
  action:'nothing'
});

$('.minus.icon').css('margin', '0px');
$('.minus.icon').css('padding-left', 'calc(100% - 144px)');
$('.item').attr('style', 'padding:11px 5px 11px 14px !important');

$('#placeAddPlusButtonIcon').on("click", function() {
  addForm();
});

$('reviewPlacePhotoArea').on("click", function() {
  addForm();
});

$('.reviewPlaceArea').on("click", '.minus.circle.icon', function(e) {
    removeForm(e);
});

$('#button_calendar')
.calendar({
  type: 'date',
  today: true,
  text: {
  days: ['일', '월', '화', '수', '목', '금', '토'],
  months: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  monthsShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  today: 'Today',
  now: 'Now',
  am: 'AM',
  pm: 'PM'
  },
  onChange: function (date, text, mode) {
    startDateChange(date);
  },
  formatter: {
    date: function (date, settings) {
    if (!date) return '';
    var day = date.getDate();
    var month = date.getMonth() + 1;
    month = month >= 10 ? month : '0' + month;
    var year = date.getFullYear();
    day = day >= 10 ? day : '0' + day;
    return year + '년 ' + month + '월 ' + day + '일';
    }
  }
});

function removeFormByIndex(index) { // index를 받으면 해당 Form을 지운다.
  if (document.querySelectorAll('.showReviewPlaceNameArea')[0].childNodes.length != 1) {
    document.querySelectorAll('.showReviewPlaceNameArea')[0].removeChild(document.querySelectorAll('.showReviewPlaceNameArea')[0].childNodes[index]);
    document.querySelectorAll('.reviewPlaceArea')[0].removeChild(document.querySelectorAll('.reviewPlaceArea')[0].childNodes[index]);
  }
}


function removeForm(event){ // minus icon 클릭시 해당 Form 삭제
  if (document.querySelectorAll('.reviewPlace').length != 1) {
  document.querySelectorAll('.showReviewPlaceNameArea')[0].removeChild(document.querySelectorAll('.showReviewPlaceNameArea')[0].childNodes[$(event.target.parentNode.parentNode.parentNode).index()]);
  document.querySelectorAll('.reviewPlaceArea')[0].removeChild(event.target.parentNode.parentNode.parentNode);
  }
}

function addForm(){ // plus icon 클릭시 해당 Form 추가
  var reviewPlaceDiv = document.createElement('div'); 
  reviewPlaceDiv.className = 'reviewPlace';
  reviewPlaceDiv.innerHTML = document.querySelectorAll('.reviewPlace')[0].innerHTML;
  document.querySelectorAll('.reviewPlaceArea')[0].appendChild(reviewPlaceDiv);
  
  var showReviewPlaceNameDiv = document.createElement('div'); 
  showReviewPlaceNameDiv.className = 'showReviewPlaceName';
  showReviewPlaceNameDiv.innerHTML =  "";
  document.querySelectorAll('.showReviewPlaceNameArea')[0].appendChild(showReviewPlaceNameDiv);
}

function matchShowReivewPlaceName() { // placeName을 Map 밑에 노출시킨다.
  for (var i = 0; i < document.querySelectorAll('.placeName').length; i++) {
    document.querySelectorAll('.showReviewPlaceName')[i].innerHTML = document.querySelectorAll('.placeName')[i].value;
  }
}

function getSelectReviewDayForm(index) { // 해당한 index의 ReviewDayForm을 만든다.
  var preDataLength = document.querySelectorAll('.placeName').length;
  var postDataLength = review[index].length;
  if (preDataLength < postDataLength) {
    for (var i = preDataLength; i < postDataLength; i++) {
      addForm();
    }
  }
  if (preDataLength > postDataLength) {
    for (var i = preDataLength; i > postDataLength; i--) {
      removeFormByIndex(i - 1);
    }
  }
}

class MyUploadAdapter { // custom UploadAdapter 작성 
  constructor( loader ) { 
    this.loader = loader; 
  } 
  upload() { 
    return this.loader.file 
    .then( file => new Promise( 
        ( resolve, reject ) => { 
        this._initRequest();
        this._initListeners( resolve, reject, file );
        this._sendRequest( file );
      }
        ) 
    );
  }
  _initRequest() { 
    const xhr = this.xhr = new XMLHttpRequest(); 
    //여기서는 POST 요청과 json으로 응답을 받지만 어떤 포맷으로 하든 너의 선택이다. 
    xhr.open( 'POST', 'http://localhost:9999/Root_Project/app/review/tempPhoto', true ); 
    xhr.responseType = 'json';

  }
  _initListeners(resolve, reject, file) {
    const xhr = this.xhr;
    const loader = this.loader;
    //const genericErrorText = '파일을 업로드 할 수 없습니다.';

    xhr.addEventListener('error', () => {reject(genericErrorText)})
    xhr.addEventListener('abort', () => reject())
    xhr.addEventListener('load', () => {
      const response = xhr.response;
      console.log(xhr);
      console.log(response);
      if(!response || response.error) {
        return reject( response && response.error ? response.error.message : genericErrorText );
      }
      resolve({
          default: response //업로드된 파일 주소
      })
    })
  }
  _sendRequest(file) {
    const data = new FormData();
    data.append('upload',file);
    this.xhr.send(data);
  }
  abort() { 
    if ( this.xhr ) { 
      this.xhr.abort();
    } 
  } 
}

function MyCustomUploadAdapterPlugin( editor ) { // Custom adaper 활성화 
  editor.plugins.get( 'FileRepository' ).createUploadAdapter = ( loader ) => {
    // Configure the URL to the upload script in your back-end here! 
    // 결국엔 내가 구현해 주어야 할 것은, 
    // FileRepository가 어떤 업로드 어댑터를 사용하게 하느냐만 설정해주면 된다. 
    // 나머지 이미지 업로드 플러그인, 파일 로더, FileRepository등등은 이미 만들어져 있다. 
    return new MyUploadAdapter( loader ); 
  };
}

function displayReviewDayByIndex(index) { // 현재 review Array에 맞는 Page를 보여준다.
  if (index != null) {
    getSelectReviewDayForm(index);
    if (review[index].title != null) {
      document.querySelectorAll('.title')[0].value = review[index].title;
      document.querySelectorAll('.mainReview')[0].value = review[index].mainReview;
      for (let i = 0; i < review[index].length; i++) {
        document.querySelectorAll('.placeName')[i].value = review[index][i].name;
        document.querySelectorAll('.basicAddr')[i].value =  review[index][i].basicAddr;
        document.querySelectorAll('.detailAddr')[i].value =  review[index][i].detailAddr;
        //document.querySelectorAll('.placeReview')[i].value = ;
        ClassicEditor
          .create( document.querySelectorAll( '.ckEditor' )[i], {
            toolbar: {
              items: [
                'heading',
                '|',
                'fontFamily',
                'fontSize',
                'fontColor',
                'bold',
                'italic',
                'link',
                'bulletedList',
                'numberedList',
                '|',
                'indent',
                'outdent',
                '|',
                'imageUpload',
                'blockQuote',
                'insertTable',
                'mediaEmbed',
                'undo',
                'redo'
              ]
            },
            language: 'ko',
            image: {
              toolbar: [
                'imageTextAlternative',
                'imageStyle:full',
                'imageStyle:side'
              ]
            },
            table: {
              contentToolbar: [
                'tableColumn',
                'tableRow',
                'mergeTableCells'
              ]
            },
            extraPlugins: [ MyCustomUploadAdapterPlugin ],
            licenseKey: '',
            
          } )
        .then( editor => {
          editor.setData(review[index][i].placeReview);
          review[index][i].editor = editor;
          console.log(review[index][i]);
          console.log(review[index][i].editor.getData());
        } )
        .catch( error => {
            console.error( error );
        } );
      }
    } else {
      document.querySelectorAll('.title')[0].value = "";
      document.querySelectorAll('.mainReview')[0].value = "";
      document.querySelectorAll('.placeName')[0].value = "";
      document.querySelectorAll('.basicAddr')[0].value =  "";
      document.querySelectorAll('.detailAddr')[0].value =  "";
      document.querySelectorAll('.placeReview')[0].value =  "";
    }
  }
  matchShowReivewPlaceName();
  getGeoLocation();
}


function removeDate(event) { // Dropdown에 Date 삭제 minus 버튼을 눌렀을 때,
  if (document.querySelectorAll('.item').length == 1) {
    console.log("마지막 하나는 지울 수 없습니다.");
  } else {
    var removeIndex = $(event.parentNode).index();
    var tmpDate = review[removeIndex].dayDate;
    
    review.splice($(event.parentNode).index(), 1);
    
    if (review.length > removeIndex) {
      var count = 0;
      for (var i = removeIndex; i < review.length; i++) {
        review[i].dayDate = calculateDate(tmpDate, count);
      }
    }
    document.querySelectorAll('.menu')[0].removeChild(event.parentNode);
    dropdownSort();
    if ((document.querySelectorAll('.dayCount')[0].innerHTML).substring(3,4) == (removeIndex + 1)) {
    var index = removeIndex;
    if (review.length == removeIndex) {
      --index;
    }
    displayReviewDayByIndex(index);
    displayDropdownDate(index);
    }
  }

}

function newReview() { // review에 새로운 Day를 추가함 dayDate 값만 넣는다.
  var newReview = new Array();
  newReview.dayDate = calculateDate(review[review.length-1].dayDate, 1)
  return newReview;
}

function dropdownSort(index) { // review dayDate에 맞춰 dropdown을 정렬한다.
  for (var i = 0; i < document.querySelectorAll('.item').length; i++) {
    var str = '<div class="innerline"><div class="innerlineDay">Day' + (i + 1) + '</div>';
    str += '<div class="innerlineDate" onclick="displaySelectReviewDateData(this);">' + review[i].dayDate + '</div></div>';
    str += '<div class="minusArea" onclick="removeDate(this)"><i class="minus icon" style="margin: 0px; padding-left: calc(100% - 144px);"></i></div>'
    document.querySelectorAll('.item')[i].innerHTML = str;
    (document.querySelectorAll('.item')[i]).setAttribute('data-text', review[i].dayDate);
  }
}

function displaySelectReviewDateData(event) { // 해당 date 선택 시 해당 Data를 보여준다.
  var index = $(event.parentNode.parentNode).index();
  displayReviewDayByIndex(index);
  displayDropdownDate(index);
}

function displayDropdownDate(index) { // dropdown에서 index에 해당하는 날짜를 보여주는 역할
  var str = 'Day' + (index + 1);
  document.querySelectorAll('.dayCount')[0].innerHTML = str;
  document.querySelectorAll('.innerDate')[0].innerHTML = '<div class="innerDate"><input type="hidden" name="dayDate" value="'+ review[0].dayDate + '">' + review[index].dayDate + '</div>';
  document.querySelectorAll('.menu.transition.visible')[0].className = 'menu transition hidden'
    $('.menu.transition.hidden').attr('style', '');
  document.getElementById('dropdown').className = 'ui selection dropdown';

}

function addDate(event) { // Dropdown에 Date 추가

  var datediv = document.querySelectorAll('.datePlus')[0];
  datediv.className = 'item';
  $('.item').attr('style', 'padding:11px 5px 11px 14px !important');
  $('.item').attr('draggable', 'true');
  $('.item').attr('ondragstart', 'courseDateDrag(event)');
  $('.item').attr('ondrop', 'courseDateDrop(event)');
  $('.item').attr('ondragover', 'allowDrop(event)');
  
  var plusdiv = document.createElement('div');
  plusdiv.className = 'datePlus';
  plusdiv.innerHTML += '<i class="plus icon" onclick="addDate(this);"></i>'
  document.querySelectorAll('.menu')[0].appendChild(plusdiv);
  if (event != null) {
    review.push(newReview());
    dropdownSort();
  }
}

function calculateDate(date, addDays) { // date에 addDays를 넣어 date string 형식으로 리턴한다.
  var dateFormData = new Date(date);
  if (typeof addDays == "number") {
    dateFormData.setDate(dateFormData.getDate() + addDays);
  }
  var day = dateFormData.getDate();
  var month = dateFormData.getMonth() + 1;
  month = month >= 10 ? month : '0' + month;
  var year = dateFormData.getFullYear();
  day = day >= 10 ? day : '0' + day;
  
  return year + '-' + month + '-' + day;
}

function dropdownInit() { // 가장 처음에 dropdown 초기화
  for (var i = 0; i < review.length; i++) {
    if (i != 0) {
    addDate();
    }
    var str = '<div class="innerline"><div class="innerlineDay">Day' + (i + 1) + '</div>';
    str += '<div class="innerlineDate" onclick="displaySelectReviewDateData(this);">' + review[i].dayDate + '</div></div>';
    str += '<div class="minusArea" onclick="removeDate(this)"><i class="minus icon" style="margin: 0px; padding-left: calc(100% - 144px);"></i></div>'
    document.querySelectorAll('.item')[i].innerHTML = str;
    (document.querySelectorAll('.item')[i]).setAttribute('data-text', review[i].dayDate);
  }
}

function startDateChange(date) { // startDate가 변동되면, Date dropdown에 적용한다.
  var newFirstdate = calculateDate(date);
  if (newFirstdate != review[0].dayDate) {
    for (var i = 0; i < review.length; i++) {
      review[i].dayDate = calculateDate(date, i);
    } 
  }
  if (typeof (document.querySelectorAll('.default.text')[0].innerHTML).substring(3, 4) != "number") { 
    document.getElementById('dropdown').childNodes[5].innerHTML = '<div class="dayCount">Day1</div>';
    document.getElementById('dropdown').childNodes[5].innerHTML += '<div class="innerDate"><input type="hidden" name="dayDate" value="'+ newFirstdate + '">' + newFirstdate + '</div>';
    document.getElementById('dropdown').className = 'ui selection dropdown';
  } else {
    document.querySelectorAll('.innerDate')[0].innerHTML = newFirstdate;
    document.getElementById('dropdown').className = 'ui selection dropdown';
  }
  dropdownInit();
}

function reviewDataInit(reviewData) { // DB로 전달받은 reviewData를 review에 저장하고 첫번째 page를 준비한다.
  if (reviewData.length != 0) {
    review = reviewData;
    $('#button_calendar').calendar('set date', new Date(review[0].dayDate));
    displayReviewDayByIndex(0);
  }
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

function getGeoLocation() {
  drawingFlag = false;
  deleteClickLine();
  deleteCircleDot();
  deleteDistnce();
  deleteMarker();
  locationArray = new Array();
  var geocoder = new kakao.maps.services.Geocoder();
  var basicAddrs = document.querySelectorAll('.basicAddr');
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
