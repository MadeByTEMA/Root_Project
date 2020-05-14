<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<!-- 
- 자바스크립트로 addForm으로 입력을 받고 session에 저장한다. (price만 업데이트)
- 각 해당 입력 받은 값을 통해서 결과 페이지까지 출력 (list 저장 가능>?)
  // 포인트에서 출력
  // 보유포인트 : 포인트 price 
  // 출금 금액 : [add] 입력값 , 초과시 에러 발생, 

  // 유저에서 출력
  // 예금주, 
  // 전화번호, : 인증 절차
  //  (전화번호를 통해서 은행명, 계좌번호에 대한 조회 가능)
  // 은행명, : 인증 가능
  // 계좌번호, : 인증 가능 
  // 유저번호 : 유저 정보 확인
  // 
  // 본인 인증 API
  // - 부트페이, 아임포트, 이니시스
  // unique ( 사용자 고유 식별자 )  와  di ( 가맹점 SITE별 고유 식별자 )  값을 전달
  // - 핸드폰 번호를 통해 인증? 이름, 성별, 생년월일, 고유키 (아임포트)
  //
  // 결제 시스템 연동 API
  // - 아임포트, 부트페이, 이니시스 
 -->
<p> ${user.name} 의 보유 포인트는 ${point.price} 포인트 입니다.  </p>

예금주 : <input name="name" type="text" value="${user.name}" > <br> 
전화번호 : <input name="tel" type="text" value='${user.tel}' > <br> <!-- 인증 -->
은행명 : <input name="bank" type="text" value="${user.bank}" > <br>
계좌번호 : <input name="account" type="text" value="${user.account}" > <br>
출금 포인트 : <input name="price" type="text"><br>
 
<form action='add' method='post'>
<script type="text/javascript">
 <input name="userNo" type="text" value='${point.userNo}' readonly}><br>\
<!-- 유저 번호 : users에 no값과 비교  -->
상대 번호 : <input name="traderNo" type="text"><br>
<!-- 
- 스크랩시 카운팅된 번호일때는 상대방 번호를 사용하고, 
- price 값이 증가되지 않을 때는 0을 만든다.
-->
입출금 분류 : <input name="pointType" type="text" > <br>

입출금 내용 : <input name="content" type="text"> <br>
출금 포인트 : <input name="price" type="text"><br>
</script>
</form>
<button type="button" onclick="location.href='payment.jsp' ">충전하기</button>
<!-- 충전을 취소했을 때 되돌아가기(미구현) -->


