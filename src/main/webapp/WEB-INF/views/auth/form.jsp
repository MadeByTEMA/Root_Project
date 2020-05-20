<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<link href="../../form.css" rel="stylesheet" type="text/css">
<div class="all">
	<div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch"
		data-aos="fade-up" data-aos-delay="200">
		<form action='login' method='post'>
			<div class="total">
				<div class="content">
					<h3>LOGIN</h3>

					<div class="form-group">
						<label for="name"></label> <input type="email"
							class="form-control" name="email" id="subject"
							data-rule="minlen:4" value='${cookie.email.value}'
							placeholder="email" />
						<div class="validate"></div>
					</div>
					<div class="form-group">
						<label for="name"></label> <input type='password'
							placeholder="password" class="form-control" name="password"
							id="subject" />
						<div class="validate"></div>
					</div>
				</div>
			</div>
			<input type='checkbox' name='saveEmail' class="context-text"
				style="margin-bottom: 10px; text-algin: center;"> 이메일 저장해두기<br>
			<div class="total">
				<button id="btn">로그인</button>
				<br>
			</div>
			<div class="etc">
				<a href='../user/findinfoform' class="search">이메일/비밀번호 찾기</a> <a
					href='../user/form'>회원가입</a><br>
			</div>
		</form>
	</div>
	</div>