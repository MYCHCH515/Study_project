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
  <link href="../css/index.css" rel="stylesheet">
  <link href="../css/member.css" rel="stylesheet">

<body>
  <c:import url="../template/header.jsp"></c:import>
	
  <div class="login_wrap">
  	<div class="container text-center">
  		<h3>아이디 찾기</h3>
  	</div>
  	<div class="container">
  		<div class="search_box">	
			  <form action="./memberSearchId" method="post" id="frm">
				  <div class="form-group">
					    <input type="text" class="form-control empty" id="name" name="mem_name" placeholder="이름">
					  	<div class="emptyResult nameResult"></div>
				  </div>
				  
				  <div class="form-group">
				  	<input type="email" class="form-control empty confirm_form1" id="email" name="mem_email" placeholder="이메일">
				  	<input type="button" class="repeat_chk" value="인증번호받기">	
				  	<input type="email" class="form-control empty confirm_form2" placeholder="인증번호를 입력하세요">
				  	<div class="emptyResult emailResult"></div>
				  </div>
				  
			  </form>
		
		     <div class="login_btn_wrap">
				<button class="search_btn">아이디 찾기</button>
		     </div>
		     
		      <div class="join_link">
				   	<span>비밀번호가 기억나지 않는다면?</span>
				    <a href="./memberSearchPw">비밀번호 찾기</a>
			 </div>
		</div>	
  	</div>
  </div>
  
  <c:import url="../template/footer.jsp"></c:import>
</body>

</html>