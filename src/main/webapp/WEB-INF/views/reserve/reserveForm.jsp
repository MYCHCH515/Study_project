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
  	.table_list_title{
  		padding: 50px 0 30px 0;
  		text-align: center;
  	}
  </style>
</head>


<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
	<h3 class="table_list_title">상품결제</h3>
		
	
  		<div class="join_box">
  			<form action="./reserveForm" method="post" id="frm">
  				  <input type="hidden" class="form-control empty" id="mem_num" name="mem_num" value="${member.mem_num}">
				   <div class="form-group">
				   		<label for="seat_num">좌석번호</label>
				  		<input type="text" class="form-control empty" id="seat_num" name="seat_num" value="${param.seat_num}" readonly="readonly">
						<div class="emptyResult idResult"></div>
				  </div>
				  
				  <div class="form-group">
				  		<label for="seat_num">회원명</label>
				  		<input type="text" class="form-control empty" id="mem_name" name="mem_name" value="${member.mem_name}" readonly="readonly">
						<div class="emptyResult idResult"></div>
				  </div>
				  
				  <div class="form-group">
				  		<label for="product_num">상품선택</label>
				  		
				  		<input type="radio" class="form-control empty" id="product_num" name="product_num" value="">
						<div class="emptyResult idResult"></div>
				  </div>
				  
	
			</form>
		</div>

		${param.seat_num}
		${member.mem_name}
	</div>
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>