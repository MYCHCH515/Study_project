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
</head>

<style type="text/css">
  	.table_list_title{
  		padding: 50px 0 30px 0;
  		text-align: center;
  	}
  	
    .form-group{
  	 	text-align: left;
  	}
  
  	.reserve_chk_box label{
  		font-size: 18px;
  	}
  	
  	.reserve_chk_box p{
  		height: 40px;
  		line-height: 40px;
  		padding: 0 20px;
  		border: 1px solid #EBEBEB;
  	}
</style>


<body>

	<c:import url="../template/header.jsp"></c:import>
	
	<div class="reserve_chk_wrap">
	
	<div class="container text-center">
  		<h3>예약 내역 확인</h3>
  	</div>
  	<div class="container">
  		<div class="reserve_chk_box">
  				   <input type="hidden" id="mem_num" name="mem_num" value="${member.mem_num}">
				  
				   <div class="form-group">
				  		<label for="mem_name">회원명</label>
				  		<p>${member.mem_name}</p>
				   </div>
				      
				   <div class="form-group">
				  		<label for="reserve_name">예약번호</label>
				  		<p>${vo.reserve_num}</p>
				   </div>
				   
				     
				   <div class="form-group">
				  		<label for="seat_num">좌석번호</label>
				  		<p>${vo.seat_num}</p>
				   </div>
				   
				    <div class="form-group">
				  		<label for="product_price">결제내역</label>
				  		<p>${vo.productVOs.product_time}시간권 - ${vo.productVOs.product_price}원</p>
				   </div>
				   
				   <div class="form-group">
				  		<label for="reserve_tm">이용시간</label>
				  		<p>${vo.reserve_strt_tm} ~ ${vo.reserve_end_tm} </p>
				   </div>

				   <div class="form-group">
				  		<label for="payment_option">결제유형</label>
				  		<p>${vo.payment_option}</p>
				   </div>	
				   
				   <div class="reserve_btn_wrap">
				 	<button type="button" class="reserve_btn go_main">메인페이지</button>
				  </div> 
			</div>
		</div>	
	</div>

	<c:import url="../template/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	$(".go_main").click(function(){
		location.href="../";
	});

</script>




</html>