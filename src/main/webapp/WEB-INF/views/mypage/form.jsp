<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="../../form.css" rel="stylesheet" type="text/css">

<style>
#container {
    position: relative;
    z-index: 20;
    max-width: 954px;
    height: 100%;
    margin: 0 auto;
}

#content {
    position: relative;
    padding: 32px 51px 95px;
    margin-top: 100px;
}
.section_home{
    line-height: 14px;
    zoom: 1;
    padding: 16px 12px 94px;
}

.section_home .column {
    float: left;
    width: 50%;
}

.sh_group, .sh_group2, .sh_group3, .sh_group4 {
    margin: 16px 8px 0;
    padding: 32px 29px 30px;
    text-align: left;
    border: 1px solid #dadada;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    background: #fff;
}

.sh_group {
    min-height: 185px;
}
</style>

  
 <div id="container" style="height: 500px;">
  <div id="content" class="section_home">
    <div class="column">
      <div class="sh_group">
        <div class="sh_header"></div>
          <h3>스크랩</h3>
        <div class="sh_content"></div>
          <p>"스크랩 리스트"를 확인하고, 코스에 적용해보세요</p>
        <div class="sh_footer">
           <a href='../scrap/list' class='btn btn-success btn-sm'><strong>스크랩</strong></a>
         </div>
       </div>
       <div class="sh_group">
        <div class="sh_header"></div>
         <h3>포인트</h3>  
        <div class="sh_content"></div>
           <p>적립 및 사용한 포인트를 확인해보세요</p>
        <div class="sh_footer">
           <a href='../point/userlist?userNo=${loginUser.no}&page=1&perPageNum=8' class='btn btn-success btn-sm'><strong>포인트</strong></a>
         </div>
       </div>
    </div>
    <div class="column">
      <div class="sh_group">
        <div class="sh_header"></div>
        <h3>정보수정</h3>  
        <div class="sh_content"></div>
          <p>${loginUser.name} 의 정보 수정 및 확인이 가능합니다.</p>
        <div class="sh_footer">

<a href="#" class='btn btn-success btn-sm' onclick="window.open('../user/passCheck?userEmail=${loginUser.email}', 'passCheck', 'left= 100px, top=100px, height=400px, width=500px, scrollbars=0, toolbar=no, location=no, resizable=no')">
         정보 수정</a> 
         </div>
      </div>
      <div class="sh_group">
        <div class="sh_header"></div>
        <h3>출금</h3> 
        <div class="sh_content"></div>
          <p>모은 포인트는 출금이 가능합니다</p>
        <div class="sh_footer">
           <a href='../point/form?userNo=${loginUser.no}' class='btn btn-success btn-sm'><strong>출금 하기</strong></a>
        </div>
       </div>
    </div>
  </div>
</div>  
  

  