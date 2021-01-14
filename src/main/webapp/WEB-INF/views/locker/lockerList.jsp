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
	<h3 class="table_list_title">사물함</h3>

	<ul class="color_wrap">
		<li><div class="color_type ct1"></div>이용불가</li>
		<li><div class="color_type ct2"></div>이용가능</li>
		<li><div class="color_type ct3"></div>내 예약</li>
	</ul>
	
	<div class=seat_wrap>
		<div class="seat_s1">
			<c:forEach items="${list}" var="vo">
				<c:if test="${vo.seat_num}">
					<div id="s1_${vo.seat_num}">
						<button class="btn_seat" id="${vo.seat_num}" name="${vo.seat_num}" title="${vo.seat_reserve}">${vo.seat_name}</button>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	</div>
	<c:import url="../template/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	var mem_seat = "${seat_num}";
	var reserve_num = "${reserveVO.reserve_num}";

	
	$(".btn_seat").each(function() {
		var num = $(this).attr("title"); 
		var seat_num = $(this).attr("id");
		if(num==0){
			if(mem_seat == seat_num){
				$(this).addClass("myRes");
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
		var seat_num = $(this).attr("id");

		if(${not empty member}){
			if(reserve_num != ""){
				if(mem_seat == seat_num){
					location.href="../reserve/reserveModify?reserve_num="+reserve_num;
				}else{
					if(confirm("예약내역이 존재합니다. 기존 예약내역을 수정하시겠습니까?")==true){
						location.href="../reserve/reserveModify?reserve_num="+reserve_num;
					}
					else{
						return;
					}
				}
			}
			else{
				if(confirm(seat_num+"번 자리 예약을 진행하시겠습니까?")==true){
					location.href="../reserve/reserveForm?seat_num="+seat_num
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