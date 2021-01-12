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
  <style>
  
  	.table_list_title{
  		padding: 50px 0 30px 0;
  		text-align: center;
  	}
    .row.content {
    	width: 90%;
    	margin: 0 auto;
    	height: 900px
    }
    
    .sidenav {
      	background-color: #f1f1f1;
      	height: 800px;
    }
    
    .mypage_contents{
    	height: 800px;
    	border: 1px solid #f1f1f1;
    }
    
    .mypage_li li{
    	text-align: center;
    	margin: 25px 0;
    }
    
     .mypage_li li a{
     	color: black;
     	font-size: 18px;
     }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {
      	height: auto;
      }
   	}
  </style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	
  <div class="container">
  <h3 class="table_list_title">마이페이지</h3>
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	      <ul class="nav nav-pills nav-stacked mypage_li">
	        <li><a href="/member/memberPage">나의정보</a></li>
	        <li><a href="/reserve/memberReservation">예약내역</a></li>
	        <li><a href="/member/memberInquiry">문의내역</a></li>
	      </ul><br>
	    </div>
	
	    <div class="col-sm-10 mypage_contents">
	      <h3><strong>회원정보수정</strong></h3>
	      <hr>
	      <form action="./memberModify" method="post" id="mem_form">
	      <div class="list_form">
			<table class="table">
					<tr class="list_tr" style="height: 60px; border: 1px solid #ddd;">
						<td class="col-sm-3" style="background:#eef1f8; font-size: 17px; padding: 20px 0; text-align: center" >이름</td>
						<td class="col-sm-9">
							<input type="text" name="mem_id" id="id" value="${vo.mem_name}" readonly="readonly" style="height: 50px; width: 250px; border: none;" >
						</td>
					</tr>
			
					<tr class="list_tr" style="height: 60px; border: 1px solid #ddd;">
						<td class="col-sm-3" style="background:#eef1f8; font-size: 17px; padding: 20px 0; text-align: center" >아이디</td>
						<td class="col-sm-9">
							<input type="text" name="mem_id" id="id" value="${vo.mem_id}" readonly="readonly" style="height: 50px; width: 250px; border: none;" >
						</td>
					</tr>
					
					<tr class="list_tr" style="height: 60px; border: 1px solid #ddd;">
						<td class="col-sm-3" style=" background:#eef1f8; font-size: 17px; padding: 20px 0; text-align: center">현재 비밀번호</td>
	      			    <td class="col-sm-9"><input type="password" id="origin_pw" style="height: 50px; width: 250px;"></td>
					</tr>	
					
					<tr class="list_tr" style="height: 60px; border: 1px solid #ddd;">
						<td class="col-sm-3" style=" background:#eef1f8; font-size: 17px; padding: 20px 0; text-align: center">새 비밀번호</td>
	      			    <td class="col-sm-9"><input type="password" id="new_pw" style="height: 50px; width: 250px;"></td>
					</tr>	
					
					<tr class="list_tr" style="height: 60px; border: 1px solid #ddd;">
						<td class="col-sm-3" style=" background:#eef1f8; font-size: 17px; padding: 20px 0; text-align: center">비밀번호 확인</td>
	      			    <td class="col-sm-9"><input type="password" name="mem_pw" id="new_pw_chk" style="height: 50px; width: 250px;"></td>
					</tr>	
					
					<tr class="list_tr" style="height: 60px; border: 1px solid #ddd;">
						<td class="col-sm-3" style="background:#eef1f8; font-size: 17px; padding: 20px 0; text-align: center" >전화번호</td>
						<td class="col-sm-9">
							<input type="text" name="mem_id" id="id" value="${vo.mem_phone}" readonly="readonly" style="height: 50px; width: 250px; border: none;" >
						</td>
					</tr>
					
					<tr class="list_tr" style="height: 60px; border: 1px solid #ddd;">
						<td class="col-sm-3" style="background:#eef1f8; font-size: 17px; padding: 20px 0; text-align: center" >이메일</td>
						<td class="col-sm-9">
							<input type="text" name="mem_id" id="id" value="${vo.mem_email}" readonly="readonly" style="height: 50px; width: 250px; border: none;" >
						</td>
					</tr>
					
					<tr class="list_tr" style="height: 60px; border: 1px solid #ddd;">
						<td class="col-sm-3" style="background:#eef1f8; font-size: 17px; padding: 20px 0; text-align: center" >가입일</td>
						<td class="col-sm-9">
							<input type="text" name="mem_id" id="id" value="${vo.mem_regDate}" readonly="readonly" style="height: 50px; width: 250px; border: none;" >
						</td>
					</tr>
			</table>
		</div>
		</form>
		<p style="margin: 20px 0; text-align: right;">탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요. 
			<a href="./memberSecession" style="border: 1px solid black; color:white; background-color: gray; padding: 5px;">회원탈퇴</a> 
		</p> 

		<div class="login_btn_wrap">
			<button type="button" class="chk_btn">수정</button>
			<button type="button" class="cancel_btn"  onclick="history.go(-1)">취소</button>
		</div>
	    </div>
	  </div>
</div>
<c:import url="../template/footer.jsp"></c:import>
</body>

<script type="text/javascript">

$('origin_pw').blur(function(){
	var origin_pw = $("#origin_pw").val();
	$.post("./originPwCheck",{origin_pw:origin_pw},function(data){
	
	});
});

$("#faq_result").on("click",".faq_del_btn", function(){
	var board_num = $(this).attr("title");
	var check= confirm("정말로 삭제하겠습니까?");
	
	if(check){
		$.post("./faqDelete",{board_num:board_num}, function(data){
			data=data.trim();
			if(data>0){		
				alert("삭제 성공했습니다.");
				location.reload();
			}
			else{
				alert("삭제 실패했습니다.");
			}
		});
	}
	else{
		return false;
	}
	
});








var mem_pw = ${vo.mem_pw}
$(".chk_btn").click(function(){
	var originPwCheck = false;
	var origin_pw = $("#origin_pw").val();

	if(mem_pw==origin_pw){
		originPwCheck = true;	
	}
	else{
		originPwCheck = false;	
	}

	console.log(originPwCheck);			
});


$(".cancel.btn").click(function(){
	
})

</script>

</html>
