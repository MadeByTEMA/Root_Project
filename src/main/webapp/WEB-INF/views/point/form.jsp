<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<h1>출금</h1>
예금주 : <input  name='name'  type="text" value='${loginUser.name}' class="search-query form-control" placeholder="예금주"/><br>
전화번호 : <input  name='tel'  type="text" value='${loginUser.tel}' class="search-query form-control" placeholder="전화번호"/><br> <!-- 인증 -->
은행명 : <input  name='bank'  type="text" value='${loginUser.bank}' class="search-query form-control" placeholder="은행명"/><br>
계좌번호 : <input  name='account'  type="text" value='${loginUser.account}' class="search-query form-control" placeholder="계좌번호"/><br>
출금 포인트 : <input id="data-price"  name='price'  type="text" class="search-query form-control" placeholder="출금 포인트"/><br>
    <input id="data-user-no" type="hidden" value="${loginUser.no}">
    <input id="data-trader-no" type="hidden" value="0">
    <input id="data-pointType" type="hidden" value="1">
    <input id="data-content" type="hidden" value="4">
     <span id="alert_withdraw" style="color:grey;">출금은 5000p 부터 가능합니다.</span><br>
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
    if (confirm(" 보유하신 포인트에서 출금을 하시겠습니까? ") == true ){
      withdrwaCheck();
     }else{ 
        alert("포인트 출금은 5000p부터 가능합니다.")
        console.log("error");
     }
}

function withdrwaCheck(){
  if( e.value >= 5000) {
    return sendPointData();
  } else ( e.value=="" || e.value < 5000)
    document.getElementById("alert_withdraw").innerHTML=('<span style="color: red;">출금은 5000p 부터 가능합니다.</span>');
  
}

function sendPointData() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
      if (xhr.readyState != 4 || xhr.status != 200){  
          console.log("withdraw send() 리턴함.");
        } else {
          console.log("withdraw 요청 완료");
        }
    };   
      xhr.open("GET", 
          "http://localhost:9999/Root_Project/app/point/add?userNo=" + a.value 
          + "&reviewUserNo=" + b.value
          + "&pointType=" + c.value
          + "&content=" + d.value
          + "&price=" + e.value, true);
      xhr.send("출금 요청에 성공했습니다.");
  }
  
</script>



