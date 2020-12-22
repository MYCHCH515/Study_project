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
  <link href="../css/index.css" rel="stylesheet">
  <link href="../css/member.css" rel="stylesheet">

  <style type="text/css">
  	
  	.chkNotice1, .error{
		color: red;
	}
	
	.chkNotice2{
		color: blue;
	}
	
	.emptyResult, .errors{
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
				  		<form:input path="mem_id" class="form-control empty" id="id" placeholder="아이디"/>
						<div class="errors"><form:errors path="mem_id" cssClass="error" ></form:errors></div>
						<div class="emptyResult idResult"></div>
				  </div>
				  
				  <div class="form-group">
				    <form:password path="mem_pw" class="form-control empty" id="pw" placeholder="비밀번호"/>
				    <div class="errors"><form:errors path="mem_pw" cssClass="error"></form:errors></div>
				    <div class="emptyResult pwResult1"></div>
				  </div>
				  
				  <div class="form-group">
				    <form:password path="mem_pw2" class="form-control empty" id="pw2" placeholder="비밀번호확인"/>
				 	<div class="errors"><form:errors path="mem_pw2" cssClass="error"></form:errors></div>
				 	<div class="emptyResult pwResult2"></div>
				  </div>
				  
				  <div class="form-group">
				    <form:input path="mem_name" class="form-control empty" id="name" placeholder="이름"/>
				  	<div class="errors"><form:errors path="mem_name" cssClass="error"></form:errors></div>
				  	<div class="emptyResult nameResult"></div>
				  </div>
				  
				  <div class="form-group">
				    <form:input path="mem_phone" class="form-control empty phone_form1" id="phone" placeholder="전화번호"/>
				  	<input type="button" class="repeat_chk" value="인증번호받기">	
				  	<input type="text" class="form-control empty phone_form2" placeholder="인증번호를 입력하세요">
				  	<div class="errors"><form:errors path="mem_phone" cssClass="error"></form:errors></div>
				  	<div class="emptyResult phoneResult"></div>
				  </div>
				  
				  <div class="form-group">
				    <form:input path="mem_email" class="form-control empty" id="email" placeholder="이메일"/>
				 	<div class="errors"><form:errors path="mem_email" cssClass="error"></form:errors></div>
				 	<div class="emptyResult emailResult"></div>
				  </div>
				  
				  <div class="agree">
					   <div class="checkbox">
					    <label><input type="checkbox" id="checkAll">아래 약관에 모두 동의합니다.</label>
					   </div>
					   <hr>
					   <div class="checkbox">
					    <label><input type="checkbox" id="check1" class="agreeChk"><a href="#" data-toggle="modal" data-target="#myModal1">서비스 이용약관(필수)</a></label>
					   </div>
					   <div class="checkbox">
					    <label><input type="checkbox" id="check2" class="agreeChk"><a href="#" data-toggle="modal" data-target="#myModal2">개인정보 처리방침(필수)</a></label>
					   </div>
					   <div class="checkbox">
					    <label><input type="checkbox" id="check3" class="agreeChk"><span>이벤트등 프로모션 알림 SMS 수신 (선택)</span></label>
					   </div>
					    <div class="checkbox">
					    <label><input type="checkbox" id="check4" class="agreeChk"><span>이벤트등 프로모션 알림 메일 수신 (선택)</span></label>
					   </div>
				   </div>
				   
				  <!-- Modal1 -->
				  <div class="modal" id="myModal1" role="dialog">
				    <div class="modal-dialog" >
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title"><strong>서비스 이용약관</strong></h4>
				        </div>
				        <div class="modal-body">
							<h4>제 1 조 (목적)</h4>
								<p>
									이 약관은 당사 스터디카페(이하 “회사”라 합니다)와 이용고객(이하 “회원”이라 합니다)간에 회사가 제공하는 
									온라인 서비스(이하 “서비스”라 합니다)의 가입조건 및 이용에 관한 제반사항과 기타 필요한 사항을 구체적으로 규정함을 그 목적으로 합니다.
								</p>
							
							<h4>제 2 조 (약관의 효력 및 변경)</h4>
								<p> ① 이 약관은 서비스 화면에 게시하거나 기타의 방법으로 공시함으로써 효력을 발생합니다. </p>
								<p>	② 회사는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제2조 제1항과 같은 방법으로 통지함으로써 효력을 발생합니다. </p>
								<p>	③ 약관의 효력발생일 이후의 계속적인 서비스 이용은 약관의 변경사항에 동의한 것으로 간주됩니다. </p>
								<p>	
									④ 약관에 동의하는 것은 정기적으로 매장을 방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다.  
									변경된 약관에 대한 정보를 알지 못해 발생하는 이용자의 피해는 회사에서 책임지지 않습니다.
								</p>
								
							
							<h4>제 3 조 (약관 이외의 준칙)</h4>
								<p> ① 이 약관에 언급되지 않은 사항이 전기통신기본법, 전기통신사업법, 기타 관계법령에 규정되어 있는 경우 그 규정에 따라 적용할 수 있습니다. </p>
								<p>	② 회사는 사이트의 조건과 조항을 항시 통고하거나 통고를 하지 않고 전부 또는 일부를 바꿀 수 있습니다. </p>
							
							
							<h4>제 4 조 (용어의 정의)</h4>
							
							<p>	① 이 약관에서 사용하는 정의는 다음과 같습니다. </p>
							<blockquote>
								<p>	1. 이용고객 : 회사에서 제공하는 서비스를 받기 위하여 회사와 이용계약을 체결한 자를 말합니다. </p>
								<p>	2. 이용계약 : 서비스 이용과 관련하여 회사와 이용고객 간에 체결하는 계약을 말합니다. </p>
								<p>	3. 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 회사가 승인하는 숫자의 조합을 말합니다. </p>
								<p>	4. 비밀번호 : 회원이 부여받은 아이디(ID)와 일치된 회원임을 확인하고 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다. </p>
							</blockquote>
							<p>	② 이 약관에서 사용하는 용어의 정의는 1항에서 정하는 것을 제외하고 관계법령 및 서비스별 안내에서 정하는 바에 의합니다. </p>
							
							<h4>제 5 조 (이용계약의 설립)</h4>
							<p> ① 이용계약은 이용고객의 본 이용약관 내용에 대한 동의와 이용신청에 대하여 회사의 이용승낙으로 성립합니다. </p>
							<p> ② 본 이용약관에 대한 동의는 이용신청 당시 해당 온라인상의 “동의” 버튼을 누름으로써 의사표시를 합니다. </p>
							
							<h4>제 6 조 (이용신청)</h4>
							<p> ① 회원으로 가입하여 본 서비스를 이용하고자 하는 이용고객은 회사에서 요청하는 제반정보(이름, 연락처 등)를 제공하여야 합니다. </p>
							<p>	② 모든 회원은 반드시 회원 본인의 이름과 핸드폰번호를 제공하여야만 서비스를 이용할 수 있으며, 실명으로 등록하지 않은 사용자는 일체의 권리를 주장할 수 없습니다. </p>
							<p>	③ 회원가입은 반드시 실명으로만 가입할 수 있으며 회사는 실명확인조치를 할 수 있습니다. </p>
							<p>	④ 타인의 명의(이름 및 핸드폰번호)를 도용하여 이용신청을 한 회원의 모든 ID는 삭제되며, 관계법령에 따라 처벌을 받을 수 있습니다. </p>
							<p>	⑤ 회사는 본 서비스를 이용하는 회원에 대하여 등급별로 구분하여 이용시간, 이용회수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다. </p>
							
							<h4>제 7 조 (개인정보의 보호 및 사용)</h4>
							<p>
								회사는 관계법령이 정하는 바에 따라 이용자 등록정보를 포함한 이용자의 개인정보를 보호하기 위해 노력합니다. 
								이용자 개인정보의 보호 및 사용에 대해서는 관련법령 및 회사의 개인정보 보호정책이 적용됩니다. 단, 회사의 공식사이트이외의 웹에서 링크된 사이트에서는 
								회사의 개인정보 보호정책이 적용되지 않습니다. 또한 회사는 이용자의 귀책사유로 인해 노출된 정보에 대해서 일체의 책임을 지지 않습니다.
							</p>
							
							<h4>제 8 조 (이용 신청의 승낙과 제한)</h4>
							<p> ① 회사는 제 6 조의 규정에 의한 이용신청고객에 대하여 업무 수행상 또는 기술상 지장이 없는 경우에 원칙적으로 접수순서에 따라 서비스 이용을 승낙합니다. </p>
							<p>	② 회사는 아래사항에 해당하는 경우에 대해서 승낙하지 아니 합니다. </p>
							<blockquote>
								<p>	가. 실명이 아니거나 타인의 명의를 이용하여 신청한 경우</p>
								<p>	나. 이용계약 신청서의 내용을 허위로 기재한 경우</p>
								<p>	다. 사회의 안녕과 질서, 미풍양속을 저해할 목적으로 신청한 경우</p>
								<p>	라. 부정한 용도로 본 서비스를 이용하고자 하는 경우</p>
								<p>	마. 영리를 추구할 목적으로 본 서비스를 이용하고자 하는 경우</p>
								<p>	바. 기타 규정한 제반사항을 위반하며 신청하는 경우</p>
							</blockquote>
							<p>③ 회사는 서비스 이용신청이 다음 각 호에 해당하는 경우에는 그 신청에 대하여 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.</p>
							<blockquote>
								<p>	가. 회사가 설비의 여유가 없는 경우</p>
								<p> 나. 회사의 기술상 지장이 있는 경우</p>
								<p>	다. 기타 회사의 귀책사유로 이용승낙이 곤란한 경우</p>
							</blockquote>
							<p>④ 회사는 이용신청고객이 관계법령에서 규정하는 미성년자일 경우에 서비스별 안내에서 정하는 바에 따라 승낙을 보류할 수 있습니다.</p>
							
							<h4>제 9 조 (이용자ID 부여 및 변경 등)</h4>
							
							<p>① 회사는 이용고객에 대하여 약관에 정하는 바에 따라 이용자 ID를 부여합니다.</p>
							<p>② 이용자ID는 원칙적으로 변경이 불가하며 부득이한 사유로 인하여 변경 하고자 하는 경우에는 해당 ID를 해지하고 재가입해야 합니다.</p>
							<p>③ 이용자ID는 다음 각 호에 해당하는 경우에는 이용고객 또는 회사의 요청으로 변경할 수 있습니다.</p>
							<blockquote>
								<p>가. 이용자ID가 이용자의 주민등록번호 등으로 등록되어 사생활침해가 우려되는 경우</p>
								<p>나. 타인에게 혐오감을 주거나 미풍양속에 어긋나는 경우</p>
								<p>다. 기타 합리적인 사유가 있는 경우</p>
							</blockquote>
							<p>④ 서비스 이용자ID 및 비밀번호의 관리책임은 이용자에게 있습니다. 이를 소홀히 관리하여 발생하는 서비스 이용 상의 손해 또는 
								제3자에 의한 부정이용 등에 대한 책임은 이용자에게 있으며 회사는 그에 대한 책임을 일절 지지 않습니다.</p>
								
							<h4>제 10 조 (이용자정보의 변경)</h4>
							<p>
								회원은 이용신청 시 기재한 이용자정보가 변경되었을 경우에는, 온라인으로 수정을 하여야 하며 미 변경으로 발생한 문제의 책임은 이용자에게 있습니다.
							</p>
							
							<br>	
							<p>[부칙] (시행일) 본 약관은 2018년 7월 1일부터 시행 합니다.</p>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
				        </div>
				      </div>
				      
				    </div>
				  </div>
				  
				  <!-- Modal2 -->
				  <div class="modal" id="myModal2" role="dialog">
				    <div class="modal-dialog " >
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title"><strong>개인정보 처리방침</strong></h4>
				        </div>
				        <div class="modal-body">
				         	<h4>1. 개인정보의 수집항목 및 이용 목적</h4>
								<p>	A. 회사는 다음과 같이 개인정보를 수집하여 이용합니다. </p>
								<blockquote>
									<p>ⅰ. 필수항목 : 이름, 휴대폰번호, 암호화된 계정정보, 생년월일, 성별 정보</p>
								</blockquote>
								
								<p>	B. 서비스 이용과정이나 사업처리과정에서 다음과 같은 정보들이 생성되어</p> <p>수집될 수 있습니다. </p>
								<blockquote>
									<p>ⅰ. 서비스 신청기록, 이용/해지 기록 등 서비스 이용 시 발생한 내역</p>
									<p>ⅱ. 서비스 이용정보</p>
								</blockquote>
								
								<p> C. 이용목적 </p>
								<blockquote>
									ⅰ. 사용자관리
									<blockquote>
										<p>가) 서비스 이용에 따른 본인확인, 개인식별</p>
										<p>나) 가입의사 확인, 가입</p>
									</blockquote>
									ⅱ. 서비스 제공에 따른 요금결제
									<blockquote>
										<p>가) 구매 및 요금결제, 거래내역 관리</p>
										<p>나) 컨텐츠 제공, 이벤트/경품당첨 결과안내</p>
									</blockquote>
									ⅲ. 마케팅 및 광고 활용
									<blockquote>
										<p>가) 가입자에게 최적화된 서비스 제공</p>
										<p>나) 서비스 이용에 대한 통계</p>
										<p>다) 서비스 및 상품 안내</p>
									</blockquote>
							    </blockquote>
								
							<h4>2. 개인정보의 수집 방법</h4>
								<p>
									A. 회사는 이동전화 기타 디지털 디바이스, 서비스 어플리케이션에서의 가입 절차, 이벤트나 경품 행사, 
									개인정보 취급업무 수탁사 또는 제휴사 등으로부터의 수집, 이동 전화 및 유,무선 인터넷 서비스 사용 시 생성정보 수집 툴을 통한 방법 등으로 
									개인 정보를 수집합니다.
								</p>
								
							<h4>3. 개인정보의 보유 및 이용기간</h4>
								<p>A. 가입자의 개인정보는 본 서비스 가입자에게 서비스를 제공하는 기간 동안에 보유 및 이용되고, 서비스 탈회 시 수집된 개인의 정보가 열람 또는 
								이용될 수 없도록 파기 처리됩니다. 다만, 관계법령의 규정에 의하여 보존할 필요성이 있는 경우에는 관계법령에 따라 보존합니다.</p>
								<p>B. 가입자의 동의를 받아 보유하고 있는 거래정보에 대해 가입자가 열람을 요구하는 경우에는 지체 없이 해당 정보를 열람/ 확인할 수 있도록 조치합니다.</p>
								<p>C. 가입자가 자발적으로 서비스를 탈회한 경우 서비스 재가입, 임의 해지 등을 반복적으로 행함으로써 본 서비스가 제공하는 할인쿠폰,
								이벤트 혜택 등의 경제상의 이익을 불법 편법적으로 수취하거나 이 과정에서 명의도용 등의 행위가 발생하는 것을 방지하기 위한 목적으로 
								서비스 탈회 후 6개월 동안 사용자의 식별정보를 보관합니다.</p>
								<p>D. 가입자가 서비스 사용을 종료하신 이후 서비스 제공과 관련된 각종 문의사항에 응대하기 위해 서비스 사용로그는 서비스 종료 후 12개월간 보관하며, 
								제공사실 확인자료는 6개월간 보관합니다.</p>
								
						   <h4>4. 개인정보 처리의 위탁</h4>
						   		<p>
								회사는 이용자에게 다양한 서비스를 제공하는 데에 반드시 필요한 업무 중 일부를 외부 업체로 하여금 수행하도록 개인정보를 위탁하고 있습니다. 그리고 위탁 받은 업체가 개인정보보호 관계 법령을 위반하지 않도록 관리·감독하고 있습니다.
								수탁업체 : 주식회사 코보시스 , 위탁업무내용 : 서비스 개발 및 운영
						   <h4>5. 개인정보의 제3자 제공</h4>
								<p>	회사는 원칙적으로 법령에 따른 동의 없이는 이용자의 개인정보를 제3자에게 제공하지 않으며 다음의 경우는 예외로 하고 있습니다. </p>
								<p>A.사전에 이용자로부터 법령에 따른 동의를 받은 경우</p>
								<p>B.다른 법령의 규정에 의한 경우</p>
							<br>	
							<p>[부칙] (시행일) 본 약관은 2018년 7월 1일부터 시행 합니다.</p>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
				        </div>
				      </div>
				      
				    </div>
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

	<!-- 약관 전체 동의 -->
	$("#checkAll").click(function(){
		if($("#checkAll").is(":checked")){
				$(".agreeChk").prop("checked",true);
			}else{
				$(".agreeChk").prop("checked",false);
			}
		});

	var checkAll = document.getElementById("checkAll");
	var agreeChk = document.getElementsByClassName("agreeChk");

	for (var i=0;i<agreeChk.length;i++){
		agreeChk[i].addEventListener('click',function(){

			var result = true;
			for(var j=0;j<agreeChk.length;j++){
				if(!agreeChk[j].checked){
					result = false;
					}
				}
				$("#checkAll").prop("checked",result);
			});
		}
	
	<!--join버튼 누를 시-->
	$(".join_btn").click(function(){
			//emptyCheck();
			agreeCheck();
			if(idCheck && pwCheck && pwExpCheck && phoneCheck && emailCheck &&emptyCheckResult && agreeCheckResult)
			//if(idCheck && pwCheck && pwExpCheck && phoneCheck  &&emptyCheckResult && agreeCheckResult)
			{
				$("#frm").submit();
			}
		});

	<!-- 공백검사 -->
	var emptyCheckResult = true;
	function emptyCheck() {
		emptyCheckResult = true;
		$(".emptyResult").removeClass("chkNotice1");
		$(".emptyResult").html('');
		$(".empty").each(function(){
			var data = $(this).val();
			if(data==''){
				emptyCheckResult=false;
				$(this).next().html("필수 항목입니다.")
				$(".emptyResult").addClass("chkNotice1");
			}

		});
	}

	<!-- 중복검사, 유효성 검사 -->
	var idCheck=false;
	var pwCheck=false;
	var pwExpCheck=false;
	var phoneCheck=false;
	var emailCheck=false;
	var regExpId = /^[A-Za-z0-9]{5,20}$/;
	var regExpPw = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;

	
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

	<!-- 약관동의 -->
	var agreeCheckResult = false;
	function agreeCheck() {
		var check1 = $("#check1").prop("checked");
		var check2 = $("#check2").prop("checked");

		agreeCheckResult = false;
		if(check1 && check2){
			agreeCheckResult=true;
		}
		else{
			agreeCheckResult=false;
			alert("필수동의항목에 체크해주세요");
		}
	}
</script>


</html>