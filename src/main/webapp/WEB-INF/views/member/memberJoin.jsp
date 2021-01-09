<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
  	
  	.chkNotice1, .error{
		color: red;
	}
	
	.chkNotice2{
		color: blue;
	}
	
	.errors{
		text-align: left;
	}
  	
  </style>
<body>
  <c:import url="../template/header.jsp"></c:import>
	
  <div class="join_wrap">
  	<div class="container text-center">
  		<h3>회원가입</h3>
  	</div>
  	<div class="container">
  		<div class="join_box">
  			<form:form modelAttribute="memberVO" id="frm" method="post">
				  <div class="form-group">
				  		<form:input path="mem_id" class="form-control" id="id" placeholder="아이디"/>
						<div class="errors idResult"><form:errors path="mem_id" cssClass="error" ></form:errors></div>
				  </div>
				  
				  <div class="form-group">
					    <form:password path="mem_pw" class="form-control" id="pw" placeholder="비밀번호"/>
					    <div class="errors pwResult1"><form:errors path="mem_pw" cssClass="error"></form:errors></div>
				  </div>
				  
				  <div class="form-group">
					    <form:password path="mem_pw2" class="form-control" id="pw2" placeholder="비밀번호확인"/>
					 	<div class="errors pwResult2"><form:errors path="mem_pw2" cssClass="error"></form:errors></div>
				  </div>
				  
				  <div class="form-group">
					    <form:input path="mem_name" class="form-control" id="name" placeholder="이름"/>
					  	<div class="errors nameResult"><form:errors path="mem_name" cssClass="error"></form:errors></div>
				  </div>
				  
				  <div class="form-group">
					    <form:input path="mem_phone" class="form-control confirm_form1" id="phone" placeholder="전화번호 ※특수기호없이 입력하세요※" readonly="false"/>
					  	<input type="button" class="repeat_chk" value="인증번호받기" id="phone_sms_send">	
					  	<input type="text" class="form-control empty confirm_form1" id="phone_sms_chk_input" placeholder="인증번호를 입력하세요">
					  	<input type="button" class="repeat_chk" value="인증번호확인" id="phone_sms_chk">	
					  	<div class="errors phoneResult"><form:errors path="mem_phone" cssClass="error"></form:errors></div>
				  </div>
				  
				  <div class="form-group">
					    <form:input path="mem_email" class="form-control" id="email" placeholder="이메일"/>
					 	<div class="errors emailResult"><form:errors path="mem_email" cssClass="error"></form:errors></div>
				  </div>
				  
				  <div class="login_btn_wrap">
				 	<button class="join_btn">회원가입</button>
				  </div>
			</form:form>
		</div>
  	</div>
  </div>
  
  <c:import url="../template/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	
	<!--join버튼 누를 시-->
	$(".join_btn").click(function(){
			if(idCheck && pwCheck && nameCheck && pwExpCheck && phoneCheck && emailCheck && phone_sms_checkResult)
			{
				$("#frm").submit();
			}
		});

	<!-- 중복검사, 유효성 검사 -->
	var idCheck=false;
	var pwCheck=false;
	var nameCheck = true;
	var pwExpCheck=false;
	var phoneCheck=false;
	var emailCheck=false;
	var regExpId = /^[A-Za-z0-9]{5,20}$/;
	var regExpPw = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	var regExpEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	var regExpPhone = /^\d{3}\d{3,4}\d{4}$/;

	
	$("#id").blur(function () {
		idCheck=false;
		var id = $(this).val();
		if(id !=''){
			$.get("./memberIdCheck?mem_id="+id,function(data){
				data=data.trim();
				var str = "이미 사용중인 ID입니다."
				$(".idResult").removeClass("chkNotice2").addClass("chkNotice1");
				if(data==0){
					if(!regExpId.test($("input[id='id']").val())) {
						idCheck=false;
						str="5~20자의 영 대 소문자, 숫자만 사용 가능합니다."				
						$(".idResult").removeClass("chkNotice2").addClass("chkNotice1");
					}else{
						idCheck=true;
						str="사용가능한 ID입니다.";
						$(".idResult").removeClass("chkNotice1").addClass("chkNotice2");
					}	
				}
				$(".idResult").html(str);
			});
		}
		else{
			$(".idResult").html("필수 항목입니다.")
			$(".idResult").removeClass("chkNotice2").addClass("chkNotice1");
		}
	});

	$("#pw").blur(function(){
		pwCheck=false;
		pwExpCheck=true;
		var pw = $("#pw").val();

		if(pw !=''){
			if(!regExpPw.test($("input[id='pw']").val())) {
				pwExpCheck=false;
				str="8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요."	
				$(".pwResult1").removeClass("chkNotice2").addClass("chkNotice1");
			}else{
				str=""
			}
			$(".pwResult1").html(str);
		}

		else{
			$(".pwResult1").html("필수 항목입니다.")
			$(".pwResult1").removeClass("chkNotice2").addClass("chkNotice1");
		}

	});

	$("#pw2").blur(function(){
		pwCheck=false;
		var pw = $("#pw").val();
		var pw2 = $("#pw2").val();

		if(pw2 !=''){
			if(pw == pw2){
				str = "비밀번호가 일치합니다.";
				$(".pwResult2").removeClass("chkNotice1").addClass("chkNotice2");
				pwCheck=true;
			}else{
				str= "비밀번호가 일치하지 않습니다.";
				$(".pwResult2").removeClass("chkNotice2").addClass("chkNotice1");
			}
			$(".pwResult2").html(str);
			
		}

		else{
			$(".pwResult2").html("필수 항목입니다.")
			$(".pwResult2").removeClass("chkNotice2").addClass("chkNotice1");
		}
	});

	$("#name").blur(function () {
		nameCheck=true;
		var name = $(this).val();
		if(name=''){
			nameCheck=false;
			str = "필수 항목입니다.";
			$(".nameResult").removeClass("chkNotice2").addClass("chkNotice1");
		}else{
			str = "";
		}
		$(".nameResult").html(str);
	});

	$("#phone").blur(function () {
		phoneCheck=false;
		var phone = $(this).val();
		if(phone !=''){
			$.get("./memberPhoneCheck?mem_phone="+phone,function(data){
				data=data.trim();
				var str = "이미 사용중인 전화번호 입니다."
				$(".phoneResult").removeClass("chkNotice2").addClass("chkNotice1");
				if(data==0){
					if(!regExpPhone.test($("input[id='phone']").val())) {
						str="형식에 맞지않는 전화번호 입니다.";
						$(".phoneResult").removeClass("chkNotice2").addClass("chkNotice1");
						phoneCheck=false;
					}
					else{
						phoneCheck=true;
						str="사용가능한 전화번호입니다.";
						$(".phoneResult").removeClass("chkNotice1").addClass("chkNotice2");
					}	
				}
				$(".phoneResult").html(str);
			});
		}

		else{
			$(".phoneResult").html("필수 항목입니다.")
			$(".phoneResult").removeClass("chkNotice2").addClass("chkNotice1");
		}
	});

	$("#email").blur(function () {
		emailCheck=false;
		var email = $(this).val();
		if(email !=''){
			$.get("./memberEmailCheck?mem_email="+email,function(data){
				data=data.trim();
				var str = "이미 사용중인 이메일 입니다."
				$(".emailResult").removeClass("chkNotice2").addClass("chkNotice1");
				if(data==0){
					if(!regExpEmail.test($("input[id='email']").val())) {
						str="형식에 맞지않는 이메일 입니다.";
						$(".emailResult").removeClass("chkNotice2").addClass("chkNotice1");
						emailCheck=false;
					}
					else{
						emailCheck=true;
						str="사용가능한 이메일입니다.";
						$(".emailResult").removeClass("chkNotice1").addClass("chkNotice2");
					}
				}
				$(".emailResult").html(str);
			});
		}

		else{
			$(".emailResult").html("필수 항목입니다.")
			$(".emailResult").removeClass("chkNotice2").addClass("chkNotice1");
		}
	});

	var phone_sms_checkResult = false;
	var sms_msg = "";
	$('#phone_sms_send').click(function(){
		 var phone_sms_checkResult = false;
         var phoneNumber = $('#phone').val();
         alert('인증번호 발송 완료!')

         $.ajax({
             type: "GET",
             url: "member/check/sendSMS",
             data: {
                 "phoneNumber" : phoneNumber
             },
             success: function(res){
                 $('#phone_sms_chk').click(function(){
                     if($.trim(res) ==$('#phone_sms_chk_input').val()){
                    	 phone_sms_checkResult = true;
                    	 $(".phoneResult").removeClass("chkNotice1").addClass("chkNotice2");
                    	 $(".phoneResult").html("휴대폰 인증이 정상적으로 완료되었습니다.");
                    	 $("#phone").attr("readonly",true);
                    	 sms_msg = "휴대폰 인증이 정상적으로 완료되었습니다.";
                	 }else{
                		 phone_sms_checkResult = false;
                		 $(".phoneResult").removeClass("chkNotice2").addClass("chkNotice1");
                    	 $(".phoneResult").html("인증번호가 올바르지 않습니다!");
                		 sms_msg = "인증번호가 올바르지 않습니다!";
                     }
                     alert(sms_msg);
                 })
             }
         })
     });
	
</script>


</html>