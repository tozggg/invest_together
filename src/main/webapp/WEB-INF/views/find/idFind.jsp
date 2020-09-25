<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
		<link href="resources/find.css" rel="stylesheet" type="text/css">
		
		<style type="text/css">
		.auth_form span.error {color:red;} 
		.verify_form span.error {color:red;} 
		</style>
		
	</head>
	<body>
	${authKey}
	${memberDTO.name}
	${memberDTO.email}
		<div class="wrapper">
			<header class="header-pw">
			</header>			
			<!-- body -->
			<section class="content content--login">
				<div class="content__body">
					<div class="content__body__page">
						<h2>아이디 찾기</h2>
						<section class="login">
							<article class="notification">
								<div class="notification_pic">
									<img src=" //d2h5doj4xlbun0.cloudfront.net/member-0.0.1367/
									images/member/member_status_img3.jpg">	
								</div>								
								<dl class="notification__txt">
									<dt></dt>
									<dt>
										아이디 찾기를 위한
										<br>
										<span class="color-blue">이름,이메일 주소를</span>
										입력해주세요.
									</dt>
								</dl>
							</article>
							<article class="user-area">
								<div class="user-area_content">
									<span class="input-state input-state--success is-block" id="user_id_box">
										<form:form class="auth_form" action="${pageContext.request.contextPath}/idEmailSend" method="POST">
											이름: <input type="text" id="name" name="name" maxlength="40"><br><br>
											이메일 주소: <input type="text" id="email" name="email" maxlength="100"><br><br>
											</span><input id="authKey-submit" type="submit" value="인증번호 받기"><br><br>
										</form:form>
										<form:form class="verify_form" action="${pageContext.request.contextPath}/verifyId" method="POST">
											<input type="hidden" name="email" value="${memberDTO.email}">
											<input type="hidden" id="authKey" value="${authKey}" />
											<input type="password" name="verifyNumber" placeholder="인증번호 6자리 숫자 입력" maxlength="6"><br><br>
											<input id="verifyNumber-submit" type="submit" value="확인">
										</form:form>
									</span>		
								</div>
							</article>
						</section>
					</div>	
				</div>		
			</section>
		</div>
	
	 <script type="text/javascript">	
		 
			$(document).ready(function (){
				$(".auth_form").validate({
					//규칙
					rules:{
						name:{
							required : true, //필수입력여부
							minlength : 2 	//최소 입력 글자수
						},
						email:{
							required : true, //필수입력여부
							email : true 	//이메일형식
						},
						
						verifyNumber:{
							required : true, //필수입력여부
						},
					},

					//메시지
					messages:{
						name:{
							required : "이름을 입력해주세요.",
							minlength : "최소 2글자 이상 입력해주세요."
						},
						email: {
							required : "이메일을 입력해주세요.",
							email : "이메일 형식을 지켜주세요." 
						},
						
						verifyNumber: {
							required : "인증번호를 입력해주세요."
						},
					},

					//메시지 태그
					errorElement : 'span', 	//태그
					errorClass: 'error',	//클래스 이름
					validClass:'vaild' 
				});
				
				$(".verify_form").validate({
					//규칙
					rules:{	
						verifyNumber:{
							required : true, //필수입력여부
							equalTo : "#authKey"
						},
					},

					//메시지
					messages:{		
						verifyNumber: {
							required : "인증번호를 입력해주세요.",
							equalTo : "인증번호가 틀렸습니다."
						},
					},

					//메시지 태그
					errorElement : 'span', 	//태그
					errorClass: 'error',	//클래스 이름
					validClass:'vaild' 
				});
			});
	
	</script> 	
	</body>
</html>