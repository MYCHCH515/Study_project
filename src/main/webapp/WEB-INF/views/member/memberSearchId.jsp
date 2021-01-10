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
  		<h3>아이디 찾기</h3>
  	</div>
  	<div class="container">
  		<div class="search_box" style="padding: 50px 0;">	
			  <form action="./memberSearchId" method="post" id="frm">
				  <div class="form-group">
					    <input type="text" class="form-control empty" id="name" name="mem_name" placeholder="이름">
					  	<div class="emptyResult nameResult"></div>
				  </div>
				  
				  <div class="form-group">
					  	<input type="text" class="form-control empty" id="email" name="mem_email" placeholder="가입시 등록했던 이메일을 입력하세요">
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

	<script type="text/javascript">
	$(".search_btn").click(function(){
		var mem_name = $('#name').val();
		var mem_email = $("#email").val();

		if(mem_name != "" && mem_email !=""){
			$("#frm").submit();
		}
		else{
			if(mem_name == ""){
				alert("이름을 입력하세요");
			}
			else{
				alert("이메일을 입력하세요");
			}
		}
	});

	</script>

</html>