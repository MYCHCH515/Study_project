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
  		<h3>로그인</h3>
  	</div>
  	<div class="container">
  		<div class="login_box">
  			<form action="./memberLogin" method="post" id="frm">
				  <div class="form-group">
				    <input type="text" class="form-control" id="id" name="mem_id" value="${cookie.remember.value}" placeholder="아이디">
				  </div>
				  
				  <div class="form-group">
				    <input type="password" class="form-control" id="pw" name="mem_pw" placeholder="비밀번호">
				  </div>
				  
				  <div class="checkbox login_auto">
				    <label><input type="checkbox" name="remember">아이디 기억하기</label>
				    
				    <label class="info_find">
					   <a href="./memberSearchId">아이디 찾기</a>
					   <a href="./memberSearchPw">비밀번호 찾기</a>
				    </label> 
				  </div>
				 
				  <div class="login_btn_wrap">
				 	<button type="submit" class="login_btn">로그인</button>
				  </div>
				  
				  <div class="join_link">
				   	<span>아직 거북이의기적 회원이 아니신가요?</span>
				    <a href="./memberAgree">회원가입</a>
				  </div>
				  <hr>
			</form>
		</div>
  	</div>
  </div>
  
  <c:import url="../template/footer.jsp"></c:import>
</body>
</html>