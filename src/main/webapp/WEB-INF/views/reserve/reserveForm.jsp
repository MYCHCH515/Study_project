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
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   
  <style type="text/css">
  .form-group{
  	text-align: left;
  }
  
  .reserve_box label{
  	font-size: 18px;
  }
  
  .reserve_box li{
  	margin: 3px 0;
  }
  
  .reserve_box li span{
  	margin: 0 10px;
  }
  </style>
  
</head>

<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="reserve_wrap">
  	
  	<div class="container text-center">
  		<h3>상품결제</h3>
  	</div>
  	<div class="container">
  		<div class="reserve_box">
  			<form action="./reserveForm" method="post" id="frm">
  				  <input type="hidden" id="mem_num" name="mem_num" value="${member.mem_num}">
				   <div class="form-group">
				   		<label for="seat_num">좌석번호</label>
				  		<input type="text" class="form-control empty" id="seat_num" name="seat_num" value="${param.seat_num}" readonly="readonly">
				  </div>
				  
				   <div class="form-group">
				  		<label for="seat_num">회원명</label>
				  		<input type="text" class="form-control empty" id="mem_name" name="mem_name" value="${member.mem_name}" readonly="readonly">
				  </div>
				  
				  <div class="form-group">
				  		<label for="product_num">상품선택</label>
				  		<ul>
				  			<c:forEach items="${list}" var="pd">
				  				<li>
				  					<input type="radio" class="product" id="product_num${pd.product_num}" title="${pd.product_num}" name="product_num" value="${pd.product_num}">
				  					<span id="product_time${pd.product_num}">${pd.product_time}시간</span>
				  					<span id="product_price${pd.product_num}">${pd.product_price}원</span>
				  				</li>
				  			</c:forEach>
				  		</ul>
				  </div>
				 
				  <div class="form-group" style="padding-right: 0">
				  		<label for="reserve_info">좌석 이용권 구매정보</label>
				  		<div>
				  			<input type="hidden" id="reserve_strt_tm" name="reserve_strt_tm">
				  			<input type="hidden" id="reserve_end_tm" name="reserve_end_tm">
				  			<ul>
				  				<li id="reserve_info1">상품:<span id="reserve_info_time"></span></li>
				  				<li id="reserve_info2">가격:<span id="reserve_info_price"></span></li>
				  				<li id="reserve_info3">사용기간:<span id="reserve_info_date"></span></li>
				  		
				  			</ul>
				  		</div>
				  </div>  
				
				  <div class="form-group">
				  		<label for="payment_option">결제수단 선택</label>
				  		<ul>
				  			<li><input type="radio" class=payment name="payment_option" value="카카오페이"><span>카카오페이</span></li>
				  			<li><input type="radio" class=payment name="payment_option"  value="계좌이체"><span>계좌이체</span></li>
				  		</ul>
				  </div> 
				  <hr>
				  <div class="reserve_btn_wrap">
				 	<button type="button" class="reserve_btn">결제하기</button>
				  </div>
			</form>
		</div>
	
	</div>
	</div>
	<c:import url="../template/footer.jsp"></c:import>
</body>

<!-- 
<script type="text/javascript">
function selectReservEnd(){ 
  var rs = $("#reservS").val(); 
  var re = $("#reservE").val(); 
  var ra; 
  // ajax 부분은 조건에 맞게 수정하세요. 
  $.ajax({ 
    type:"POST", 
    url:"", 
    dataType:"json", 
    data:{ rs:rs, re:re }, 
    success:function(data){ 
      if(data == "true"){ 
        $("#form").submit();   
        }else{ 
        alert("중복된 예약이 있습니다."); 
     } 
  } 
});     
} 
</script> -->

<script type="text/javascript">

	$(".product").click(function(){
		var pd_num = $(this).attr("title");
	
		var pd_time=$("#product_time"+pd_num).text()
		var pd_price=$("#product_price"+pd_num).text()
		
		$("#reserve_info_time").text(pd_time);
		$("#reserve_info_price").text(pd_price);

		var pd_time = parseInt(pd_time);
		showTime(pd_time);

	});

	function showTime(pd_time){
	    var now = new Date();
	    var year = now.getFullYear();
		var month = now.getMonth()+1
		var date = now.getDate()
		var hours = now.getHours()
		var minutes = now.getMinutes()
		var seconds = now.getSeconds()
	
		var msg = year+ "-" + month.toString().padStart(2,'0') + "-" + date.toString().padStart(2,'0')+ " ";
		msg += hours.toString().padStart(2,'0') + ":" + minutes.toString().padStart(2,'0') + ":" + seconds.toString().padStart(2,'0');

		var endHours = hours+pd_time;
		var endDate = date;

		if(endHours>=24){
			endDate ++;
			endHours = endHours-24
		}

		var msg2 = year+ "-" + month.toString().padStart(2,'0') + "-" + endDate.toString().padStart(2,'0')+ " ";
		msg2 += endHours.toString().padStart(2,'0') + ":" + minutes.toString().padStart(2,'0')+ ":" + seconds.toString().padStart(2,'0');

		console.log(msg);
		console.log(msg2);
	    
	    $("#reserve_info_date").text(msg+" ~ "+msg2);	  
	    $("#reserve_strt_tm").val(msg);
	    $("#reserve_end_tm").val(msg2);

	    return msg;
	}

	$(".reserve_btn").click(function(){
		productCheck();

		var paymentCheck = $('input[name="payment_option"]:checked').val();
		if (paymentCheck == '카카오페이'){
			 $(function(){
			        var IMP = window.IMP; 
			        var pd_num = $('input[name="product_num"]:checked').val();
					var pd_price=$("#product_price"+pd_num).text();
					var totalPrice = pd_price.substr(0, pd_price.length-1);
					totalPrice = parseInt(totalPrice);
	        
			        IMP.init('imp25357816'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			       
			        IMP.request_pay({
			            pg : 'kakaopay',
			            pay_method : 'card',
			            merchant_uid : 'merchant_' + new Date().getTime(),
			            name : '거북이의기적: 상품결제',
			            amount : totalPrice,
			            buyer_email : '${member.mem_email}',
			            buyer_name : '${member.mem_name}',
			            buyer_tel : '${member.mem_phone}',

			        }, function(rsp) {
			            if ( rsp.success ) {
		                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		                    
			                 var msg = '결제가 완료되었습니다.';
			                      msg += '\n고유ID : ' + rsp.imp_uid;
			                      msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			                      msg += '\n결제 금액 : ' + rsp.paid_amount +"원";
			                      alert(msg);  

		                      if(productCheckResult&&paymentCheckResult){
			        				$("#frm").submit();		
			        			} 
			                      
		                    }else {	
		                        var msg = '결제에 실패하였습니다.';
		                        msg += '에러내용 : ' + rsp.error_msg;
		                        alert(msg);  
		                    }
			            }); 
			        });
				}
		else if(paymentCheck == '계좌이체'){
			alert("결제 준비중입니다");
			$("#frm").submit();		
		}
	});

	<!--라디오버튼 공백검사-->
	var productCheckResult = true;
	function productCheck() {
		productCheckResult = true;
		if($(".product").is(":checked") == false){
			 productCheckResult = false;
	         alert("상품을 선택해주세요");
	         return false;
		}
		else{
			paymentCheck();
		}
	}

	var paymentCheckResult = true;
	function paymentCheck() {
		paymentCheckResult = true;
		if($(".payment").is(":checked") == false){
			 paymentCheckResult = false;
	         alert("결제수단을 선택해주세요");
	         return false;
			}
	}

	 
	 

</script>

</html>