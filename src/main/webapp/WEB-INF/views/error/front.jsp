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
  <style type="text/css">
  	
  	.list_form{
  		margin: 0 auto;
  		height: 450px;
  		width: 90%;
  		padding: 30px 0;
  		text-align: center;
  	}
	.list_none_wrap{
		padding: 50px 0;
	}
	
	.list_none{
		text-align: center;
		opacity: 70%;
		font-size: 60px;
		color: #00a5bd;
	}
	
	.msg{
		width: 200px;
		height: 50px;
		background-color: #00a5bd;
		line-height: 50px;
		font-size: 18px;
		margin:  0 auto;
	}
	
	.msg a{
		color: white;
	}
  </style>
</head>

<body>
	<div class="container">
	 	<div class="list_form">
	 		<div class="list_none_wrap">
	 			<h1 class="list_none"><strong>${code}</strong></h1>
	 			<h1 class="list_none">${msg}</h1>
	 			<h2>페이지를 찾을 수 없습니다.</h2>
				<p>방문하신 페이지의 주소가 잘못되었거나 삭제된 페이지입니다.</p>
				<br>
				<div class="msg">
					 <a href="/">홈으로</a>
				 </div>
	 		</div>	
	 	</div>
	</div>
</body>

</html>