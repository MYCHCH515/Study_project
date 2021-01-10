<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Study_project</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <c:import url="../template/bootStrap.jsp"></c:import>
  <link href="../css/common.css" rel="stylesheet">
  <link href="../css/member.css" rel="stylesheet">

<body>
  <c:import url="../template/header.jsp"></c:import>
	
  <div class="login_wrap">
  	<div class="container text-center">
  		<h3>비밀번호 찾기</h3>
  	</div>
  	 	<div class="container">
  		<div class="search_box">
			 <div class="form-group">
		  		<input type="text" class="form-control empty" id="id" name="mem_id" placeholder="아이디 입력">
				<div class="emptyResult idResult"></div>
			 </div>
			  
			 <div class="form-group">
			  	<input type="email" class="form-control empty" id="email" name="mem_email" placeholder="회원가입시 이메일 입력">
			  	<div class="emptyResult emailResult"></div>
			 </div>
 
		     <div class="login_btn_wrap">
				<button class="search_btn">비밀번호 찾기</button>
		     </div>
		     
		     <div class="join_link">
				   	<span>아이디가 기억나지 않는다면?</span>
				    <a href="./memberSearchId">아이디 찾기</a>
			 </div>
		</div>	
  	</div>
  </div>
  
  <c:import url="../template/footer.jsp"></c:import>
</body>

<script>
	
	$(".search_btn").click(function(){
		$.ajax({
			url : "/member/memberSearchPw",
			type : "POST",
			data : {
				mem_id : $("#id").val(),
				mem_email : $("#email").val()
			},
			success : function(result) {
				alert(result);
			},
		})
	});
	
</script>

</html>