<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
    
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>

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
<p> ${loginUser.name} 의 보유 포인트는 ${point.price} 포인트 입니다.  </p>
예금주 : <input  name='name'  type="text" value='${loginUser.name}' class="search-query form-control" placeholder="예금주"/><br>
전화번호 : <input  name='tel'  type="text" value='${loginUser.tel}' class="search-query form-control" placeholder="전화번호"/><br> <!-- 인증 -->
은행명 : <input  name='bank'  type="text" value='${loginUser.bank}' class="search-query form-control" placeholder="은행명"/><br>
계좌번호 : <input  name='account'  type="text" value='${loginUser.account}' class="search-query form-control" placeholder="계좌번호"/><br>
출금 포인트 : <input id="data-price"  name='price'  type="text" class="search-query form-control" placeholder="출금 포인트"/><br>
    <input id="data-user-no" type="hidden" value="${loginUser.no}">
    <input id="data-trader-no" type="hidden" value="0">
    <!-- 출금시에는 사용하지 않는 0번을 사용하여 출금했는지 알수 있도록 한다 -->
    <input id="data-pointType" type="hidden" value="1">
    <input id="data-content" type="hidden" value="4">
    <button id='point_withdraw_button'>출금하기</button>
    
<script>
"use strict"
var a = document.querySelector("#data-user-no");
var b = document.querySelector('#data-trader-no');
var c = document.querySelector('#data-pointType');
var d = document.querySelector('#data-content');
var e = document.querySelector('#data-price');
console.log(a);
console.log(b);
console.log(c);
console.log(d);
console.log(e);

document.querySelector("#point_withdraw_button").onclick = () => {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", 
        "http://localhost:9999/Root_Project/app/point/add?userNo=" + a.value 
        + "&reviewUserNo=" + b.value
        + "&pointType=" + c.value
        + "&content=" + d.value
        + "&price=" + e.value, true);
    xhr.send();
    console.log("send() 리턴함.");
    console.log(xhr);
    console.log(e.value);
};
</script>

<!-- 
1.port번호

<script type="text/JavaScript" src="../../js/point/form.js"></script>
충전을 취소했을 때 되돌아가기(미구현) 

-->



