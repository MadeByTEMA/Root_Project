<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<h1>비밀번호 찾기</h1>
<form action='findPass' method='post' name="form">
이름: <input name='name' type='text' id="name"><br>
이메일: <input name='email' type='text' id="email"><br>
<input type ="button" value="전송" onClick="formCheck()">
</form>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
var enCnt = 0;

function formCheck() {
	var form = document.form;
	if(form.name.value==""){
		alert("이름을 입력해주세요!");
		form.name.focus();
		return false;
	} else if(form.email.value==""){
	    alert("이메일을 입력해주세요!");
	    form.email.focus();
	    return false;
	} else if(enSearch()==0){
	  alert("유효한 회원이 없습니다.");
	  enCnt = 0;
	  return false;
	}
	form.submit();
}

function enSearch() {
    var e = $('#email').val();
    var n = $('#name').val();
    console.log(e);
    console.log(n);
         $.ajax({
         type: 'POST',
         async: false,
         datatype: "json",
         data: { email : e, name:n},
         url: "enSearch",
         success : function(result){
        	 console.log(result);
        	 enCnt = result;
         }
      });
         console.log("enCnt" + enCnt);
         return enCnt;
     }

</script>
</html>
