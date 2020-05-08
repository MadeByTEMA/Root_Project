<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<!--      
<script>
function checkAll(){
	var password = document.getElementById("password"); //비밀번호 id
	var password2 = document.getElementById("password2"); //비밀번호 확인 id
	var name = document.getElementById("name");//이름 id
	var birth = document.getElementById("birth");//생년월일 id
	var gender = document.getElementsByName("gender");//성별 id
	var detailAddr = document.getElementById("detailAddr");//상세주소 id
	var photoFile = document.getElementById("photoFile");//사진 id
	var nickName = document.getElementById("nickName");//별명 id
    
	if(!emailCheck()){
		return false;
	} else if(password.value!=password2.value){
		  alert("비밀번호가 다릅니다!");
		  password2.focus();
		  return false;
	} else if(name.value==""){
	    alert("이름을 입력하세요!");
	    name.focus();
	    return false;
	} else if(birth.value==""){
	    alert("생년월일을 입력하세요!");
	    birth.focus();
	    return false;
	} else if(objgender[0].checked==false&&objgender[1].checked==false){
	    alert("성별을 체크하세요!");
	    return false;
	} else if(!telCheck()){
		return false;
	} else if(!addressCheck()){
		return false;
	} else if(nickName.value==""){
		
	  alert("별명을 입력하세요!");
	  nickName.focus();
	  return false;
	}
}

	function email(){
		var email = document.getElementById("email"); //이메일 id
	  if(email.value==""){
		  alert("이메일을 입력하세요!");
		  email.focus();
		  return false;
	  }
	}
	
	function telCheck(){
		var tel = document.getElementById("tel");//전화번호 id
	  if(tel.value==""){
	    alert("전화번호를 입력하세요!");
	    tel.focus();
	    return false;
	  }
	}
	
	function addressCheck(){
		var zipCode = document.getElementById("zipCode");//우편번호 id
		var basicAddr = document.getElementById("basicAddr");//기본주소 id
		
	  if(zipCode.value==""){
	    alert("주소를 입력하세요!");
	    zipCode.focus();
	    return false;
	  }
	  
	  if(basicAddr.value==""){
	    alert("주소을 입력하세요!");
	    basicAddr.focus();
	    return false;
	  }
	}	

</script>
-->

<h1>회원가입</h1> <br>
<form action='add' method='post' enctype='multipart/form-data'>
이메일: <input type='text' name='email'  id="email"><br>
비밀번호: <input type='password' name='password' id="password" 
          placeholder="문자,숫자 조합으로 8자 이상" style="padding-right:70px;"><br>
비밀번호 확인: <input type='password' id="password2" > <br>
이름: <input type='text' name='name' id="name" ><br>
생년월일: <input type='text' name='birth' id="birth" placeholder="예)19930613"><br>
성별: &nbsp; <input type='radio' name='gender' id="gender" value="2">여자 &nbsp; 
      <input type='radio' name='gender' id="gender" value="1">남자<br>
전화번호: <input type='text'name='tel' id="tel"><br>
우편번호: <input type='text'name='zipCode' id="zipCode"><br>
기본주소: <input type='text'name='basicAddr' id="basicAddr"><br>
상세주소: <input type='text'name='detailAddr' id="detailAddr"><br>
사진: <input type='file' name='photoFile' id="photoFile"><br>
별명: <input type='text'name='nickName' id="nickName"><br><br>
<input type="button" onclick="checkAll()" value="등록">
<input type="button" onclick="reset()" value="다시입력">
</form>

