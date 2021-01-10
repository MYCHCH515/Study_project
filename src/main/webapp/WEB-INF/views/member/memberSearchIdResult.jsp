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

  <style type="text/css">
  	.srch_id p{
  		font-size: 17px;
  		text-align: left;
  	}
  	
  	.srch_id p strong{
  		font-size: 22px;
  	}
  </style>
<body>
  <c:import url="../template/header.jsp"></c:import>
	
  <div class="login_wrap">
  	<div class="container text-center">
  		<h3>아이디 찾기</h3>
  	</div>
  	<div class="container">
  		<div class="search_box" style="padding: 50px 0;">	
			  <form id="frm">
				  <div class="form-group srch_id">
				   	   <p>${vo.mem_name}님의 아이디는 : <strong> ${vo.mem_id} </strong></p>
					   <p>가입일 : <strong> ${vo.mem_regDate} </strong></p>
				  </div>
				
			  </form>
		
		     <div class="login_btn_wrap">
				<button class="search_btn">로그인</button>
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
	$(.search_btn).click(function(){
		location.href="/member/memberLogin";
	});

	</script>

</html>