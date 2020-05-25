<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="../../form.css" rel="stylesheet" type="text/css">


<div class="all">
		<div>
					<h3>내 정보</h3>

					<div class="form-group" style="line-height:300%; font-size:12px; font-family:돋움;">
					<div>
					<img src='${pageContext.servletContext.contextPath}/upload/user/${loginUser.photo}' height='100' width='100' vspace=30 hspace=20 text-align:center><br>
						
						${loginUser.name} 
						<a href="../user/updateform" id="btn2" >정보수정</a><br>
						</div>
						<div>
						스크랩 : <a href="../scrap/list" id="btn2">스크랩</a><br>
						</div>
						<div>
						포인트 : <a href="../point/userlist?userNo=${loginUser.no}" id="btn2">포인트(미구현)</a><br>
						</div>
						<div>
						출금 : <a href="../point/form?userNo=${loginUser.no}" id="btn2">출금(미구현)</a>
						</div>
					</div>
				</div>
			
	</div>
	
	 <!-- 
  
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
  
  
  <div id="container" style="height: 500px;">
  <div id="content" class="section_home">
    <div class="column">
      <div class="sh_group">
                스크랩 <a href='../scrap/list' class='btn btn-success btn-sm'>스크랩</a>
        <div class="sh_header"></div>
        <div class="sh_content"></div>
        <div class="sh_footer"></div>
       </div>
       <div class="sh_group">
                포인트 <a href='../point/userlist?userNo=${user.no}' class='btn btn-success btn-sm'>포인트</a>
        <div class="sh_header"></div>
        <div class="sh_content"></div>
        <div class="sh_footer"></div>
       </div>
    </div>
    <div class="column">
      <div class="sh_group">
        <img src='${pageContext.servletContext.contextPath}/upload/user/${loginUser.photo}' width='360'> ${loginUser.name}  <a href='../user/updateform' class='btn btn-success btn-sm'>정보수정</a><br>
        <div class="sh_header"></div>
        <div class="sh_content"></div>
        <div class="sh_footer"></div>
      </div>
      <div class="sh_group">
             출금 <a href='../point/form?userNo=${user.no}' class='btn btn-success btn-sm'>출금</a>
        <div class="sh_header"></div>
        <div class="sh_content"></div>
        <div class="sh_footer"></div>
       </div>
    </div>
  </div>
</div>  

 -->