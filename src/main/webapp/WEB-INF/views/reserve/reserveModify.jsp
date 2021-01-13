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
 	.modify_link_wrap{
 		width: 80%;
 		height: 500px;
 		margin: 0 auto;
 	}
 	.modify_link{
 		display: inline-block;
 		width: 30%;
 		height: 300px;
 		margin: 100px 13px 0 13px;
 		border: 2px solid #ddd;
 		text-align: center;
 		padding: 60px 0 ;
 	}

 	.modify_link p{
 		margin: 10px 0 ;
 		font-size: 25px;
 	}
</style>

<body>
	<c:import url="../template/header.jsp"></c:import>
  	<div class="container" style="height: 700px;">
  	   <input type="hidden" value="">
  	
  	   <div class="modify_link_wrap">
  			
  			<div class="modify_link">
  				<a href="./extendTime?reserve_num=${reserve_num}"><img alt="" src="../images/m2.png"></a>
  				<p>시간연장</p>
  			</div>
  			
  			<div class="modify_link">
  				<a href="./changeSeat?reserve_num=${reserve_num}"><img alt="" src="../images/m3.png"></a>
  				<p>자리이동</p>
  			</div>
  			
  			<div class="modify_link">
  				<img alt="" src="../images/m1.png" id="m1">
  				<p>퇴실</p>
  			</div>
  			
  	   </div>
  	   		   
	   <div class="reserve_btn_wrap">
	 	<button type="button" class="reserve_btn go_main">메인페이지</button>
	   </div> 
	   
	</div>

	<c:import url="../template/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	$(".go_main").click(function(){
		location.href="../";
	});

	var reserve_num = "${reserve_num}";
	
	$("#m1").click(function(){
		if(reserve_num != ""){
			if(confirm("퇴실 하시겠습니까?")==true){
				
				$.post("./checkOut",{"reserve_num":reserve_num},
					function(result){
						if(result<1){
							alert("퇴실처리 실패했습니다.")	
							return
						}
						else{
				    		alert("퇴실처리 되었습니다.")
				    		location.href="../";
					    }
				});
			}
			else{
				return;
			}
		}
	});
</script>
</html>