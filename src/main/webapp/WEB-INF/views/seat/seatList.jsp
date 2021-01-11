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
   <link href="../css/seat.css" rel="stylesheet">
   
   <style type="text/css">
   .resPossible{
   		background-color:  #E3F0F2;
   }  
   	.resPossible:hover{
  		background :#C0D7DA;
  	}
   .resImpossible{
   		background-color: #BAC1C2;
   } 
    .resImpossible:hover{
   		background: #BAC1C2;
   } 
   </style>
   
</head>


<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
	<h3 class="table_list_title">개인석</h3>
	<div class="leave_list" ><button>퇴실 예정석</button></div>
	<ul class="color_wrap">
		<li><div class="color_type ct1"></div>이용불가</li>
		<li><div class="color_type ct2"></div>이용가능</li>
		<li><div class="color_type ct3"></div>내 예약</li>
	</ul>
	
	<div class=seat_wrap>
		<div class="seat_s1">
			<c:forEach items="${list}" var="vo">
				<c:if test="${vo.seat_num /6 <= 1}">
					<div id="s1_${vo.seat_num}">
						<button class="btn_seat" id="${vo.seat_num}" name="${vo.seat_num}" title="${vo.seat_reserve}">${vo.seat_name}</button>
					</div>
				</c:if>
			</c:forEach>
		</div>
		
		<div class="seat_s2">
			<c:forEach items="${list}" var="vo">
				<c:if test="${vo.seat_num/6 > 1 && vo.seat_num /6 <= 2}">
					<div id="s2_${vo.seat_num}">
						<button class="btn_seat" id="${vo.seat_num}" name="${vo.seat_num}" title="${vo.seat_reserve}">${vo.seat_name}</button>
					</div>
				</c:if>	
			</c:forEach>
		</div>
		
		<div class="seat_wrap2">
			<div class="seat_s3_wrap">
				<div class="seat_s3">
					<div class="seat_s3_left">
						<c:forEach items="${list}" var="vo">
							<c:if test="${vo.seat_num/6 > 2 && vo.seat_num /6 <= 3}">
								<div id="s3_${vo.seat_num}">
									<button class="btn_seat" id="${vo.seat_num}" name="${vo.seat_num}" title="${vo.seat_reserve}">${vo.seat_name}</button>
								</div>
							</c:if>
						</c:forEach>
					</div>
					
					<div class="seat_s3_right">
						<c:forEach items="${list}" var="vo">
							<c:if test="${vo.seat_num/6 > 3 && vo.seat_num /6 <= 4}">
								<div id="s3_${vo.seat_num}">
									<button class="btn_seat" id="${vo.seat_num}" name="${vo.seat_num}" title="${vo.seat_reserve}">${vo.seat_name}</button>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			
			<div class="seat_s4_wrap">
				<div class="seat_s4">
					<div class="seat_s4_left">
						<c:forEach items="${list}" var="vo">
							<c:if test="${vo.seat_num/6 > 4 && vo.seat_num /6 <= 5}">
								<div id="s4_${vo.seat_num}">
									<button class="btn_seat" id="${vo.seat_num}" name="${vo.seat_num}" title="${vo.seat_reserve}">${vo.seat_name}</button>
								</div>
							</c:if>
						</c:forEach>
					</div>
					
					<div class="seat_s4_right">
						<c:forEach items="${list}" var="vo">
							<c:if test="${vo.seat_num/6 > 5 && vo.seat_num /6 <= 6}">
								<div id="s4_${vo.seat_num}">
									<button class="btn_seat" id="${vo.seat_num}" name="${vo.seat_num}" title="${vo.seat_reserve}">${vo.seat_name}</button>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		
		<div class="seat_s5">
			<c:forEach items="${list}" var="vo">
				<c:if test="${vo.seat_num/6 > 6 && vo.seat_num /6 <= 7}">
					<div id="s5_${vo.seat_num}">
						<button class="btn_seat" id="${vo.seat_num}" name="${vo.seat_num}" title="${vo.seat_reserve}">${vo.seat_name}</button>
					</div>
				</c:if>
			</c:forEach>
		</div>
		
		<div class="facility">
			<div id="f1_wrap">
				<div id="f1">
					<span>Locker</span>
				</div>
			</div>
			
			<div id="f2_wrap">
				<div id="f2">
					<span>출입문</span>
				</div>
			</div>
			
			<div id="f3_wrap">
				<div id="f3">
					<span>Rest Area</span>
				</div>
			</div>
			
		</div>
	</div>
	</div>
	<c:import url="../template/footer.jsp"></c:import>
</body>

<script type="text/javascript">

	$(".btn_seat").each(function() {
		var num = $(this).attr("title"); 
		if(num==0){
			$(this).addClass("resImpossible");
			$(this).attr('disabled',"disabled");
		}else{
			$(this).removeClass("resImpossible");
			$(this).addClass("resPossible");
		}	
	});
	
	$('.btn_seat').click(function(){
		var seat_num = $(this).attr("id");

		if(${not empty member}){
			if(confirm(seat_num+"번 자리 예약을 진행하시겠습니까?")==true){
				location.href="../reserve/reserveForm?seat_num="+seat_num
			}
			else{
				return;
			}
		}
		else{
			if(confirm("로그인이 필요한 서비스 입니다.") == true){
				location.href="../member/memberLogin";
			}
			else{
				return;
			}
		}
	});
</script>
</html>