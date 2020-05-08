<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<h1>후기 추가</h1>
<form action='add' method='post' enctype='multipart/form-data'>
전체상태: <input name='status' type='text' readonly value='1'><br>

<br>
메인사진: <input name='mainPhoto' type='file'><br>
제목: <input name='title' type='text'><br>
여행일: <input name='dayDate' type='date'><br>
메인후기: <input name='mainReview' type='text'><br>
데이상태: <input name='dayStatus' type='text' readonly value='1'><br>
<br>

장소명: <input name='name' type='text'><br>
기본주소: <input name='basicAddr' type='text'><br>
상세주소: <input name='detailAddr' type='text'><br>
장소후기: <input name='placeReview' type='text'><br>
장소대표사진: <input name='mainPlacePhoto' type='file'><br>
장소상태: <input name='placeStatus' type='text' readonly value='1'><br>

메인사진: <input name='PlacePhotos' type='file'><br>
메인사진: <input name='PlacePhotos' type='file'><br>
메인사진: <input name='PlacePhotos' type='file'><br>
메인사진: <input name='PlacePhotos' type='file'><br>
메인사진: <input name='PlacePhotos' type='file'><br>
메인사진: <input name='PlacePhotos' type='file'><br>

<button>등록</button>


  <script type="text/javascript">
    document.write('Hello World!');
  </script>

</form>

