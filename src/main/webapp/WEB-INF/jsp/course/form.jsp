<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>코스 추가</h1>
<form action='add' method='post' >
제목: <input name='title' type='text'><br>
여행일: <input name='dayDate' type='text'><br>
장소명: <input name='placeName' type='text'><br>
기본주소: <input name='basicAddr' type='text'><br>
상세주소: <input name='detailAddr' type='text'><br>
비고: <input name='etc' type='text'><br>
<button>등록</button>

  <script type="text/javascript">
    document.write('Hello World!');
  </script>

</form>

<jsp:include page="../footer.jsp"/>
    