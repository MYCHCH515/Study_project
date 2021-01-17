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
   
   .myRes{
   		background-color:#00a5bd;
   	}
   </style>
   
</head>


<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
	<h3 class="table_list_title">사물함 예약</h3>

	<ul class="color_wrap">
		<li><div class="color_type ct1"></div>이용불가</li>
		<li><div class="color_type ct2"></div>이용가능</li>
		<li><div class="color_type ct3"></div>내 예약</li>
	</ul>
	
	<div class=seat_wrap style="width: 70%; height: 700px;">
		<div class="seat_s1" style="width: 100%; height: 700px; padding: 80px 32px;">
			<c:forEach items="${list}" var="vo">
					<c:if test="${vo.locker_num /6 <= 1}">
						<div >
							<button class="btn_seat" id="${vo.locker_num}" name="${vo.locker_num}" title="${vo.locker_reserve}">${vo.locker_name}</button>
						</div>
					</c:if>
					<c:if test="${vo.locker_num/6 > 1 && vo.locker_num /6 <= 2}">
						<div>
							<button class="btn_seat" id="${vo.locker_num}" name="${vo.locker_num}"  title="${vo.locker_reserve}">${vo.locker_name}</button>
						</div>
					</c:if>
					<c:if test="${vo.locker_num/6 > 2 && vo.locker_num /6 <= 3}">
						<div >
							<button class="btn_seat" id="${vo.locker_num}" name="${vo.locker_num}"  title="${vo.locker_reserve}">${vo.locker_name}</button>
						</div>
					</c:if>
					<c:if test="${vo.locker_num/6 > 3 && vo.locker_num /6 <= 4}">
						<div >
							<button class="btn_seat" id="${vo.locker_num}" name="${vo.locker_num}"  title="${vo.locker_reserve}">${vo.locker_name}</button>
						</div>
					</c:if>
					<c:if test="${vo.locker_num/6 > 4 && vo.locker_num /6 <= 5}">
						<div >
							<button class="btn_seat" id="${vo.locker_num}" name="${vo.locker_num}"  title="${vo.locker_reserve}">${vo.locker_name}</button>
						</div>
					</c:if>
					<c:if test="${vo.locker_num/6 > 5 && vo.locker_num /6 <= 6}">
						<div>
							<button class="btn_seat" id="${vo.locker_num}" name="${vo.locker_num}"  title="${vo.locker_reserve}">${vo.locker_name}</button>
						</div>
					</c:if>
					<c:if test="${vo.locker_num/6 > 6 && vo.locker_num /6 <= 7}">
						<div>
							<button class="btn_seat" id="${vo.locker_num}" name="${vo.locker_num}"  title="${vo.locker_reserve}">${vo.locker_name}</button>
						</div>
					</c:if>
			</c:forEach>
		</div>
	</div>
	</div>
	<form id="reserveFrm" action="/locker/lockerReserveFormView" method="post">
		<input type="hidden" id="reserve_num_post" name="locker_num">
	</form>
	<c:import url="../template/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	var mem_locker = "${locker_num}";
	var reserve_num = "${lockerReserveVO.reserve_locker_num}";

	$(".btn_seat").each(function() {
		var num = $(this).attr("title"); 
		var locker_num = $(this).attr("id");

		if(num==0){
			if(mem_locker == locker_num){
				$(this).addClass("myRes");
				$(this).attr('disabled',"disabled");
			}
			else{
				$(this).addClass("resImpossible");
				$(this).attr('disabled',"disabled");
			}
		}else{
			$(this).removeClass("resImpossible");
			$(this).addClass("resPossible");
		}	
	}); 
	
	$('.btn_seat').click(function(){
		var locker_num = $(this).attr("id");
		var locker_name = $(this).text();

		if(${not empty member}){
			if(reserve_num == ""){
				if(confirm(locker_name+"번 사물함 예약을 진행하시겠습니까?")==true){
					$("#reserve_num_post").val(locker_num);
					$("#reserveFrm").submit();
				}
				else{
					return;
				}
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