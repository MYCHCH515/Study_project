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
	
  <div class="join_wrap">
  	<div class="container text-center">
  		<h3>회원가입</h3>
  	</div>
  	<div class="container">
  		<div class="join_box">
  			<form action="./memberJoin" method="post" id="frm">
				  <div class="form-group">
				    <input type="text" class="form-control" id="id" name="id" placeholder="아이디">
				  </div>
				  
				  <div class="form-group">
				    <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
				  </div>
				  
				  <div class="form-group">
				    <input type="password" class="form-control" id="pw2" name="pw2" placeholder="비밀번호확인">
				  </div>
				  
				  <div class="form-group">
				    <input type="text" class="form-control" id="name" name="name" placeholder="이름">
				  </div>
				  
				  <div class="form-group">
				    <input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호">
				  </div>
				  
				  <div class="form-group">
				    <input type="email" class="form-control" id="email" name="email" placeholder="이메일">
				  </div>
				  
				  <div class="agree">
					   <div class="checkbox">
					    <label><input type="checkbox">아래 약관에 모두 동의합니다.</label>
					   </div>
					   <hr>
					   <div class="checkbox">
					    <label><input type="checkbox"><a href="#" data-toggle="modal" data-target="#myModal">서비스 이용약관(필수)</a></label>
					   </div>
					   <div class="checkbox">
					    <label><input type="checkbox"><a href="#">개인정보 처리방침(필수)</a></label>
					   </div>
					   <div class="checkbox">
					    <label><input type="checkbox"><a href="#">이벤트등 프로모션 알림 SMS 수신(선택)</a></label>
					   </div>
					    <div class="checkbox">
					    <label><input type="checkbox"><a href="#">이벤트등 프로모션 알림 메일 수신(선택)</a></label>
					   </div>
				   </div>
				   
				    <!-- Modal -->
				  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Modal Header</h4>
				        </div>
				        <div class="modal-body">
				          <p>Some text in the modal.</p>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
				        </div>
				      </div>
				      
				    </div>
				  </div>
				   
				   
				  <div class="login_btn_wrap">
				 	<button type="submit" class="login_btn">회원가입</button>
				  </div>
			</form>
		</div>
  	</div>
  </div>
  
  <c:import url="../template/footer.jsp"></c:import>
</body>
</html>