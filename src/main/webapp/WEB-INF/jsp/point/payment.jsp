<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="../header.jsp"/>
<!-- 
  // 
  // 본인 인증 API
  // - 부트페이, 아임포트, 이니시스
  // unique ( 사용자 고유 식별자 )  와  di ( 가맹점 SITE별 고유 식별자 )  값을 전달
  // - 핸드폰 번호를 통해 인증? 이름, 성별, 생년월일, 고유키 (아임포트)
  //
  // 결제 시스템 연동 API
  // - 아임포트, 부트페이, 이니시스 
 -->

<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript">
</script>
<script>
//실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
BootPay.request({
  price: '1000', //실제 결제되는 가격
  application_id: "5eba455702f57e00291ee317",
  name: '블링블링 마스카라', //결제창에서 보여질 이름
  pg: 'inicis',
  method: '', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
  show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
  items: [
    {
      item_name: '나는 아이템', //상품명
      qty: 1, //수량
      unique: '123', //해당 상품을 구분짓는 primary key
      price: 1000, //상품 단가
      cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
      cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
      cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
    }
  ],
  user_info: {
    username: 'user1',
    email: 'user1@gmail.com',
    addr: '사용자 주소',
    phone: '010-1234-4567'
  },
  order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
  params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
  account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
  extra: {
      start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
    end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
  }
}).error(function (data) {
  //결제 진행시 에러가 발생하면 수행됩니다.
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
}).done(function (data) {
  //결제가 정상적으로 완료되면 수행됩니다
  //비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
  console.log(data);
});
</script>

<!-- 출금할 수 있는 보유 잔량(유저 번호를 통해서 모든 값을 더한다.)  -->
<!-- 입출금 분류, 입출금 내용 제어문-->
<!-- 출금 가능한 default 값 -->

<jsp:include page="../footer.jsp"/>