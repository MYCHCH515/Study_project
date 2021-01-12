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
    	height: 1000px
    }
    
    .sidenav {
      	background-color: #f1f1f1;
      	height: 900px;
    }
    
    .mypage_contents{
    	height: 900px;
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
     
    .chkNotice1, .error{
		color: red;
	}
	
	.chkNotice2{
		color: blue;
	}
	
	.errors{
		text-align: left;
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
							<input type="text" id="name" value="${vo.mem_name}" readonly="readonly" style="height: 50px; width: 250px; border: none;" >
						</td>
					</tr>
			
					<tr class="list_tr" style="height: 60px; border: 1px solid #ddd;">
						<td class="col-sm-3" style="background:#eef1f8; font-size: 17px; padding: 20px 0; text-align: center" >아이디</td>
						<td class="col-sm-9">
							<input type="text" id="id" value="${vo.mem_id}" readonly="readonly" style="height: 50px; width: 250px; border: none;" >
						</td>
					</tr>
					
					<tr class="list_tr" style="height: 60px; border: 1px solid #ddd;">
						<td class="col-sm-3" style=" background:#eef1f8; font-size: 17px; text-align: center; vertical-align:middle; line-height: 60px;">비밀번호 변경</td>
	      			    <td class="col-sm-9">
	      			    	<table>			
								<tr class="list_tr" style="height: 60px;">
									<td class="col-sm-3" style="font-size: 15px; padding: 20px 0; text-align: center">현재 비밀번호</td>
				      			    <td class="col-sm-9"><input type="password" id="origin_pw" style="height: 35px; width: 250px;"></td>
								</tr>	
								
								<tr class="list_tr" style="height: 60px; ">
									<td class="col-sm-3" style="font-size: 15px; padding: 20px 0; text-align: center">새 비밀번호</td>
				      			    <td class="col-sm-9"><input type="password" id="new_pw" style="height: 35px; width: 250px;"></td>
								</tr>	
								
							
								<tr class="list_tr" style="height: 60px;">
									<td class="col-sm-3" style="font-size: 15px; padding: 20px 0; text-align: center">비밀번호 확인</td>
				      			    <td class="col-sm-9"><input type="password" name="mem_pw" id="new_pw_chk" style="height: 35px; width: 250px;"></td>
								</tr>
								
								<tr class="list_tr" style="height: 60px;">
									<td class="col-sm-3"></td>
				      			    <td class="col-sm-9" style="text-align: right;">
				      			    	<button type="button" style="border: 1px solid black; color:white; background-color: gray; padding: 5px;">비밀번호변경</button>
				      			    </td>
								</tr>
	      			    	</table>
	      			    </td>
					</tr>	
				
					
					<tr class="list_tr" style="height: 60px; border: 1px solid #ddd;">
						<td class="col-sm-3" style="background:#eef1f8; font-size: 17px; padding: 20px 0; text-align: center; vertical-align:middle;">전화번호</td>
						<td class="col-sm-9">
							<input type="text" id="origin_phone" value="${vo.mem_phone}" readonly="readonly" style="height: 50px; width: 265px; border: none;">
							<button type="button" id="change_phone" style="border: 1px solid black; color:white; background-color: gray; padding: 5px; display: inline-block;">전화번호변경</button>
							<button type="button" id="change_phone_cancel" style="border: 1px solid black; color:white; background-color: gray; padding: 5px; display: none;">전화번호 변경취소</button>
							<input type="text" id="new_phone" name="mem_phone" value="${vo.mem_phone}" style="height: 40px; width: 265px; display: none;">
							<button type="button" id="change_phone_submit" style="border: 1px solid black; color:white; background-color: gray; padding: 5px; display: none;">전화번호수정</button>
							<span class="phoneResult"></span>
						</td>
					</tr>
					
					<tr class="list_tr" style="height: 60px; border: 1px solid #ddd;">
						<td class="col-sm-3" style="background:#eef1f8; font-size: 17px; padding: 20px 0; text-align: center" >이메일</td>
						<td class="col-sm-9">
							<input type="text" id="origin_email" value="${vo.mem_email}" readonly="readonly" style="height: 50px; width: 265px; border: none;">
							<button type="button" id="change_email" style="border: 1px solid black; color:white; background-color: gray; padding: 5px; display: inline-block;">이메일변경</button>
							<button type="button" id="change_email_cancel" style="border: 1px solid black; color:white; background-color: gray; padding: 5px; display: none;">이메일 변경취소</button>
							<input type="text" id="new_email" value="${vo.mem_email}" style="height: 40px; width: 265px; display: none;">	
							<button type="button" id="change_email_submit" style="border: 1px solid black; color:white; background-color: gray; padding: 5px; display: none;">이메일수정</button>
							<span class="emailResult"></span>
						</td>
					</tr>
					
					<tr class="list_tr" style="height: 60px; border: 1px solid #ddd;">
						<td class="col-sm-3" style="background:#eef1f8; font-size: 17px; padding: 20px 0; text-align: center; vertical-align:middle;">가입일</td>
						<td class="col-sm-9">
							<input type="text" name="mem_regDate" id="regDate" value="${vo.mem_regDate}" readonly="readonly" style="height: 50px; width: 250px; border: none;" >
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

$("#change_phone").click(function(){
	if($("#change_phone").css("display")!="none"){
		$("#change_phone").hide();
		$("#change_phone_cancel").show();
	}
	
	if($("#new_phone").css("display")=="none"){
		$("#new_phone").show();
		$("#change_phone_submit").show();
	}
});

$("#change_phone_cancel").click(function(){
	if($("#change_phone_cancel").css("display")!="none"){
		$("#change_phone_cancel").hide();
		$("#change_phone").show();
	}
	
	if($("#new_phone").css("display")!="none"){
		$("#new_phone").hide();
		$("#change_phone_submit").hide();
	}
});

$("#change_email").click(function(){
	if($("#change_email").css("display")!="none"){
		$("#change_email").hide();
		$("#change_email_cancel").show();
	}
	
	if($("#new_email").css("display")=="none"){
		$("#new_email").show();
		$("#change_email_submit").show();
	}
});

$("#change_email_cancel").click(function(){
	if($("#change_email_cancel").css("display")!="none"){
		$("#change_email_cancel").hide();
		$("#change_email").show();
	}
	
	if($("#new_email").css("display")!="none"){
		$("#new_email").hide();
		$("#change_email_submit").hide();
	}
});

var regExpEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
$("#change_email_submit").click(function(){
	emailCheck=false;
	var email = $("#new_email").val();
	var id = $("#id").val();
	if(email !=''){
		$.get("./memberEmailCheck?mem_email="+email,function(data){
			data=data.trim();
			var str = "수정되었습니다."
			$(".emailResult").removeClass("chkNotice1").addClass("chkNotice2");
			if(data==0){
				if(!regExpEmail.test($("input[id='new_email']").val())) {
					str="형식에 맞지않는 이메일 입니다.";
					$(".emailResult").removeClass("chkNotice2").addClass("chkNotice1");
					emailCheck=false;
				}
				else{
					emailCheck=true;
				    $.post("./memberModifyEmail",
						    {"mem_email":email, "mem_id":id},
						    function(result){
						    	if(result < 1){
									alert("이메일 수정에 실패했습니다.")	
									return
						    	}
						    	else{
						    		alert("수정되었습니다.")
						    		location.reload();	
							    }
					});
				}
			}
			else{
				str = "이미 사용중인 이메일입니다."
				$(".emailResult").removeClass("chkNotice2").addClass("chkNotice1");
				
			}
			$(".emailResult").html(str);
		});
	}

	else{
		$(".emailResult").html("필수 항목입니다.")
		$(".emailResult").removeClass("chkNotice2").addClass("chkNotice1");
	}
});


</script>

</html>
