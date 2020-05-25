<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

div.info {
 background-color: lightgray;
 width : 400px;
 height: 400px;
}

div.info_lao {
  margin-top: 180px;
  margin-left: 100px;
}
div.dsk_sc {
  width :1140px;
}

div.list_point {
  border: 1px solid;
  height: 50px;
}
div.list_margin{
  margin-top: 10px;
  
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
      <div class="col-lg-7">
         <table border='1'>
            <tr>
              <th scope="col">포인트 번호</th>
              <th scope="col">유저 번호</th>
              <th scope="col">상대 번호</th>
              <th scope="col">포인트 분류</th>
              <th scope="col">입출금 내용</th>
              <th scope="col">포인트 금액</th>
            </tr>
          <c:set var = "sum" value = "0" />
          <c:forEach items="${userlist}" var="item">
            <tr>
              <td>${item.no}</td> 
              <td>${item.userNo}</td> 
              <td>${item.traderNo}</td> 
              <td>
                <c:if test="${item.pointType==0}">입금</c:if>
                <c:if test="${item.pointType==1}">출금</c:if>
              </td>
              <td><a href='detail?no=${item.no}'>
                <c:choose>
                  <c:when test="${item.content == 1}"> 포인트 적립</c:when>
                  <c:when test="${item.content == 2}"> 포인트 사용</c:when>
                  <c:when test="${item.content == 3}"> 충전 결제 </c:when>
                  <c:otherwise> 출금 </c:otherwise>
                </c:choose>
              </td>
              <td>${item.price}</td>
              <c:set var= "sum" value="${sum + item.price}"/>
          </c:forEach>
                 
          </table>
      </div>
      <!-- /.col-lg-8 -->
      <div class="info">
        <div class="info_lao">
         <img src="" alt="기본 이미지"><br>
                 현재 총 포인트는 <c:out value="${sum}"/> 입니다. <br>
        <a class="btn btn-primary" href="#">충전하기</a>
        </div>
      </div>
    </div>
    <!-- /.row -->

    <!-- Call to Action Well -->
    <div class="card text-white bg-secondary my-5 py-4 text-center">
      <div class="card-body">
        <p class="text-white m-0">기간 조회</p>
      </div>
    </div>

    <!-- Content Row -->
    <div class="row">
      <div class = "dsk_sc">
              <c:forEach items="${userlist}" var="item">
                <div class="list_point">
                  <div class="list_margin">
                       <div class="userlist">
                          <div class="point_no">
                          <span class="state _statusName">${item.no}</span>
                          </div>
                          <div class="userlist_img">
                           <span><img src="img1.jpg" alt="해당 이미지"></span>
                          </div>
                            <div class="userlist_titleName">
                                 <c:choose>
								                  <c:when test="${item.content == 1}"> 포인트 적립</c:when>
								                  <c:when test="${item.content == 2}"> 포인트 사용</c:when>
								                  <c:when test="${item.content == 3}"> 충전 결제 </c:when>
								                  <c:otherwise> 출금 </c:otherwise>
								                </c:choose>
                             </div>
                          <div class="userlist_price">
                             <a href="#" class="item_content">
                                <span class="point">으로 ${item.price}가 포인트 변경이 되었습니다.</span>
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
                </c:forEach>
           </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Footer -->
