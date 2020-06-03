<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.2.4.min.js" type="application/javascript"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>

div.info {
 width : 400px;
 height: 200px;
}

div.dsk_sc {
  width :1140px;
}

div.list_point {
  border: 1px solid;
  height: 100px;
}
div.list_margin{
  margin-top: 20px;
}

div.userlist_img {
  width: 200px;
  float:left;
}

div.userlist_price {
  width: 600px;
  float:left;
}

div.userlist_item.no {
  width: 300px;
  float:left;
}

div.userlist_titleName{
  width : 100px;
  text-align: center;
  float:left;
}

div.point_no {
  width: 100px;
  float:left;
}

</style>

  <!-- Page Content -->
  <div class="wrap">

    <!-- Heading Row -->
    <div class="row align-items-center my-5">
      <div class="col-lg-7" style="height: 200px; width: 900px;">
        <c:set var = "sum1" value = "0" />
        <c:set var = "sum2" value = "0" />
        <c:set var = "sum3" value = "0" />
          <c:forEach items="${list}" var="item">
             <c:if test="${(item.pointType==0 && item.content == 1) || 
                   (item.pointType==0 && item.content == 3)}">
                 <c:set var= "sum1" value="${sum1 + item.price}"/>
                 <c:set var= "sum2" value="${sum2 + item.price}"/>
              </c:if>
              <c:if test="${(item.pointType==1 && item.content == 2) || 
                    (item.pointType==1 && item.content == 4)}">
                  <c:set var= "sum1" value="${sum1 - item.price}"/>
                  <c:set var= "sum3" value="${sum3 - item.price}"/>
              </c:if>
          </c:forEach>
      <div id="tabs">
            <ul>
              <li><a href="#tabs-1" style="width: 150px; text-align: center;">전체 </a></li>
              <li><a href="#tabs-2" style="width: 150px; text-align: center;">포인트 적립</a></li>
              <li><a href="#tabs-3" style="width: 150px; text-align: center;">포인트 사용</a></li>
            </ul>
            <div id="tabs-1" style="height: 170px">
             <div class="tab_total" style="margin-left: 100px; margin-top: 20px;">
                  <h3>총 <strong>보유</strong> 포인트</h3>
                  <span class="tab_img"><img src="${pageContext.servletContext.contextPath}/img/point/userlist/pointimg.jpg" alt="포인트이미지" style="width: 50px; height: 50px;"></span>
                  <span class="tab_sum" style="font-size: 18px;"><c:out value="${sum1}"/></span>
                  <span class="tab_won" style="font-size: 20px;">원</span>
                <!-- modal -->
                  
                 <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop"  style="float: right; margin-right: 100px;">
                  충전하기
                </button>
                
                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h3 class="modal-title" id="staticBackdropLabel">충전 하기</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                       <div class="modal-body">
                        <p><strong>카드 결제</strong>, <strong>휴대폰 결제</strong> 및 <strong>계좌 이체</strong>가 가능합니다. </p>
                        <input id="data-charge-price" type="text" placeholder="충전할 금액을 입력하세요."/>
                        <span>원</span>           
                        <hr>
                        <h5>원하는 충전 가격을 선택해주세요</h5>
                        <p>
                        <button id="choice_price_3000">+ 3000</button>
                        <button id="choice_price_5000">+ 5000</button>
                        <button id="choice_price_10000">+ 10000</button>
                        </p>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="withdraw_addform" type="button" class="btn btn-primary">충전 하기</button>
                      </div>
                    </div>
                  </div>
                </div>
                  <!-- /modal -->
             </div>
            </div>
            <div id="tabs-2" style="height: 170px">
             <div class="tab_saving" style="margin-left: 100px; margin-top: 20px;">
                  <h3>총 <strong>적립 </strong>포인트</h3>
                  <span class="tab_img"><img src="${pageContext.servletContext.contextPath}/img/point/userlist/pointimg.jpg" alt="포인트이미지" style="width: 50px; height: 50px;"></span>
                  <span class="tab_sum" style="font-size: 18px;"><c:out value="${sum2}"/></span>
                  <span class="tab_won" style="font-size: 20px;">원</span>
              </div>
            </div>
            <div id="tabs-3" style="height: 170px">
              <div class="tab_useing" style="margin-left: 100px; margin-top: 20px;">
                  <h3>총 <strong>사용</strong> 포인트</h3>
                  <span class="tab_img"><img src="${pageContext.servletContext.contextPath}/img/point/userlist/pointimg.jpg" alt="포인트이미지" style="width: 50px; height: 50px;"></span>
                  <span class="tab_sum" style="font-size: 18px;"><c:out value="${sum3}"/></span>
                  <span class="tab_won" style="font-size: 20px;">원</span>
              </div>
            </div>  
          <!-- calendar List--> 
        </div>
      </div>
    </div>
    <!-- /.row -->

    <!-- Call to Action Well -->
    <div class="card text-white bg-secondary my-5 py-4 text-center">
      <div class="card-body">

      </div>
    </div>

    <!-- Content Row -->
    <div class="row">
    <!-- 
      <form id="searchText">
        <input type="hidden" name="viewCount" id="viewCount" value="0">
        <input type="hidden" name="startCount" id="startCount" value="0">
     -->
      <div class = "dsk_sc">
        
        <table id="more_list">
          <thead>
              <c:forEach items="${list}" var="item">
                <tr>
                <div class="list_point">
                  <div class="list_margin">
                       <div class="userlist">
                          <div class="point_no">
                          <span class="state _statusName">${item.no}</span>
                          </div>
                          <div class="userlist_img">
                              <c:if test="${(item.pointType==0 && item.content == 1) || 
                                   (item.pointType==0 && item.content == 3)}">
                                   <span><img src="${pageContext.servletContext.contextPath}/img/point/userlist/savingimg.jpg" alt="적립 이미지" style="width: 70px; height: 70px;"></span>
                              </c:if>
                              <c:if test="${(item.pointType==1 && item.content == 2) || 
                                   (item.pointType==1 && item.content == 4)}">
                                    <span><img src="${pageContext.servletContext.contextPath}/img/point/userlist/useimg.jpg" alt="사용 이미지" style="width: 70px; height: 70px;"></span>    
                              </c:if>   
                          </div>
                            <div class="userlist_titleName">
                            <strong>
                                 <c:choose>
                                  <c:when test="${item.content == 1}"> 포인트 적립</c:when>
                                  <c:when test="${item.content == 2}"> 포인트 사용</c:when>
                                  <c:when test="${item.content == 3}"> 충전 결제 </c:when>
                                  <c:when test="${item.content == 4}"> 출금 </c:when>
                                </c:choose>
                            </strong>
                             </div>
                          <div class="userlist_price">
                             <a href="/point/read${pageMaker.makeQuery(pageMaker.cri.page)}&point_no=${item.no}">
                              <c:if test="${(item.pointType==0 && item.content == 1) || 
                                   (item.pointType==0 && item.content == 3)}">
                                <span class="point1">으로  <strong>${item.price}</strong>가 포인트 <strong>적립</strong>이 되었습니다.</span>
                              </c:if>
                             <c:if test="${(item.pointType==1 && item.content == 2) || 
                                   (item.pointType==1 && item.content == 4)}">
                                <span class="point2">으로  <strong>${item.price}</strong>가 포인트 <strong>사용</strong>이 되었습니다.</span>    
                              </c:if>
                              </a>
                          </div>   
                        </div>
                        <div class="amount_space">
                            <div class="amount_inner">
                                <a href='delete?no=${item.no}' class="point_delete"><button>내역삭제</button></a> 
                            </div>
                        </div>
                     </div>
                 </div>
                 </tr>
                </c:forEach>
             </table> 
                <div class="text-center">
                  <nav aria-label="pagination">
                    <ul class="pagination">
                    
                      <!-- prev 버튼 -->
                      <li id="page-prev">
                        <a href="userlist${pageMaker.makeQuery(pageMaker.startPage-1)}" aria-label="Prev">
                          <span aria-hidden="true">«</span>
                        </a>
                      </li>
                      
                      <!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
                      <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                          <li id="page${idx}">
                            <a href="userlist${pageMaker.makeQuery(idx)}">
                                <span>${idx}<span class="sr-only">(current)</span></span>
                            </a>
                          </li>
                      </c:forEach>
                      
                      <!-- next 버튼 -->
                      <li id="page-next">
                          <a href="userlist${pageMaker.makeQuery(pageMaker.endPage + 1)}" aria-label="Next">
                            <span aria-hidden="true">»</span>
                          </a>
                      </li>
                      </ul>
                    </nav>
                  </div>
                  
           </div>
    </div>
    <!-- /.row -->
  </div>
  
<!-- 유저 정보 전달 -->
<input id='data-charge-name'  type="hidden" value='${loginUser.name}'/><br>
<input id='data-charge-email'  type="hidden" value='${loginUser.email}'/><br>
<input id='data-charge-Addr'  type="hidden" value='${loginUser.basicAddr}'/><br>
<input id='data-charge-tel'  type="hidden" value='${loginUser.tel}'/><br>
<input id='data-charge-bank'  type="hidden" value='${loginUser.bank}'/><br>
<input id='data-charge-account' type="hidden" value='${loginUser.account}'/><br>

<input id="data-user-no" type="hidden" value="${loginUser.no}">
<input id="data-trader-no" type="hidden" value="0">
<input id="data-pointType" type="hidden" value="0">
<input id="data-content" type="hidden" value="3">

<script>

$( function() {
    var tabs = $( "#tabs" ).tabs();
    tabs.find( ".ui-tabs-nav" ).sortable({
      axis: "x",
      stop: function() {
        tabs.tabs( "refresh" );
      }
    });
  } );
//  충전 조회
var a = document.querySelector("#data-user-no");
var b = document.querySelector('#data-trader-no');
var c = document.querySelector('#data-pointType');
var d = document.querySelector('#data-content');

//  충전 값 입력 
var p1 = document.querySelector("#data-charge-price");

//  충전 내부  function 값 조회
var d1 =  document.querySelector("#data-charge-name");
var d2 =  document.querySelector("#data-charge-email");
var d3 =  document.querySelector("#data-charge-Addr");
var d4 =  document.querySelector("#data-charge-tel");

//충전  function
//-------------------  결제 시스템
document.querySelector("#withdraw_addform").onclick = () => {
   BootPay.request({
        price: p1.value, 
        application_id: "5eba455702f57e00291ee317",
        name: '포인트 충전 결제', //결제창에서 보여질 이름
        pg: 'inicis',
        method: '', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
        show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
        items: [
          {
              item_name: '포인트 충전 결제', //상품명
              qty: 1, //수량
              unique: '1234', //해당 상품을 구분짓는 primary key
              price: p1.value, 
              cat1: '포인트 결제 1', 
              cat2: '포인트 결제 2', 
              cat3: '포인트 결제 3', 
          }
        ],
        user_info: {
          username: d1.value,  
          email: d2.value,
          addr: d3.value,
          phone: d4.value
        },
        order_id: d2.value+'_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다. // 생성 
        params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
        account_expire_at: '2020-05-27', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
        extra: {
          start_at: '', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
          end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
          vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
          quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
        }
      }).error(function (data) {
        //결제 진행시 에러가 발생하면 수행됩니다.
        alert(data);
        console.log(data);
      }).cancel(function (data) {
        //결제가 취소되면 수행됩니다.
        console.log(data);
      }).ready(function (data) {
        // 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
        console.log(data);
      }).confirm(function (data) {
        //결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
        //주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
        console.log(data);
        var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
        if (enable) {
          BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
        } else {
          BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
        }
      }).close(function (data) {
          // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
          console.log(data);
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
                  + "&price=" + p1.value, true);
            xhr.send("충전 요청에 성공했습니다.");
      }).done(function (data) {
        //결제가 정상적으로 완료되면 수행됩니다
        //비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
        console.log(data);
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
                + "&price=" + p1.value, true);
          xhr.send("충전 요청에 성공했습니다.");
      });

}


 // -------------------  달력
  $(function(){
      $("#startDate").datepicker({
          onSelect:function(dateText, inst) {
              console.log(dateText);
          }
      });
  });
  
  $(function(){
      $("#endDate").datepicker({
          onSelect:function(dateText, inst) {
              console.log(dateText);
          }
      });
  });
  
  ( function( factory ) {
    if ( typeof define === "function" && define.amd ) {
      define( [ "../widgets/datepicker" ], factory );
    } else {
      factory( jQuery.datepicker );
    }
  }( function( datepicker ) {
  datepicker.regional.ko = {
    closeText: "닫기",
    prevText: "이전달",
    nextText: "다음달",
    currentText: "오늘",
    monthNames: [ "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월" ],
    monthNamesShort: [ "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월" ],
    dayNames: [ "일요일","월요일","화요일","수요일","목요일","금요일","토요일" ],
    dayNamesShort: [ "일","월","화","수","목","금","토" ],
    dayNamesMin: [ "일","월","화","수","목","금","토" ],
    weekHeader: "주",
    dateFormat: "yy-mm-dd", // 변경
    firstDay: 0,
    isRTL: false,
    showMonthAfterYear: true,
    yearSuffix: "년" };
  datepicker.setDefaults( datepicker.regional.ko );
  return datepicker.regional.ko;
  }));
  
  
  // paging
  $(function(){
    //perPageNum select 박스 설정
    setPerPageNumSelect();
    
    //prev 버튼 활성화, 비활성화 처리
    var canPrev = '${pageMaker.prev}';
    if(canPrev !== 'true'){
      $('#page-prev').addClass('disabled');
    }
    
    //next 버튼 활성화, 비활성화 처리
    var canNext = '${pageMaker.next}';
    if(canNext !== 'true'){
      $('#page-next').addClass('disabled');
    }
    
    //현재 페이지 파란색으로 활성화
    var thisPage = '${pageMaker.cri.page}';
    //매번 refresh 되므로 다른 페이지 removeClass 할 필요는 없음->Ajax 이용시엔 해야함
    $('#page'+thisPage).addClass('active');
  })
  
  function setPerPageNumSelect(){
    var perPageNum = "${pageMaker.cri.perPageNum}";
    var $perPageSel = $('#perPageSel');
    var thisPage = '${pageMaker.cri.page}';
    $perPageSel.val(perPageNum).prop("selected",true);
    //PerPageNum가 바뀌면 링크 이동
    $perPageSel.on('change',function(){
      //pageMarker.makeQuery 사용 못하는 이유: makeQuery는 page만을 매개변수로 받기에 변경된 perPageNum을 반영못함
      window.location.href = "userlist?page="+thisPage+"&perPageNum="+$perPageSel.val();
    })
  }
</script>
  
