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
  
  <style type="text/css">
  
 	 .table_list_title{
  		padding: 50px 0 30px 0;
  		text-align: center;
  	}
  	
  	.seat_wrap{
  		margin: 0 auto;
  		width: 80%;
  		height: 800px;
  		margin-bottom: 100px;
  		background-color: #F6F6F6;
  		border: 5px solid gray;
  		box-sizing: content-box;
  		font-size: 18px;
  		font-weight: bold;
  	}
  	
  	.seat_wrap button{
  		background: #E3F0F2;
  		border: 1px solid #F6F6F6;
  	}
  	
  	.seat_wrap button:hover{
  		background :#C0D7DA;
  		border: 1px solid #F6F6F6;
  	}
  	
  	.color_wrap, .color_wrap div{
  		float: left;
  	}
  	
  	.color_wrap div{
  		margin: 5px;
  	}
  
  	.color_type {
  		width: 10px;
  		height: 10px;
  	}
  	
  	.ct1{
  		background-color: #BAC1C2;
  	}
  	
  	.ct2{
  		background-color:  #E3F0F2;
  	}
  	
  	.ct3{
  		background-color: #00a5bd;
  	}
  	
  	.leave_list{
  		width: 80%;
  		margin: 0 auto;
  		text-align: right;
  	}
  	
  	.leave_list button{
  		
  		margin: 10px 0 ;
  		width: 100px;
  		height: 30px;
  		
  	}
  	
  	.seat_s1{
  		margin: 0 auto;
  		width: 80%;
  		height: 90px;
  		padding: 0 50px;
  	}
  	
  	.seat_s1 button{
  		margin: 0 2px;
  	}
  	
  	.seat_s2{
		float:left;
  		width: 100px;
  		height: 600px;
  	}
  	
  	.seat_wrap2{
  		float: left;
  		width: 78%;
  		height: 600px;
  	}
  	
  	.seat_s3_wrap, .seat_s4_wrap{
  		width: 100%;
  		height: 300px;
		padding: 50px;
  	}
  	
  	.seat_s3_left, .seat_s3_right, .seat_s4_left, .seat_s4_right{
  		float: left;
  		width: 50%;
  		height:200px;
  		padding: 10px 0;
  	}
  	
  	.seat_s3, .seat_s4{
  		height: 200px;
  	}
  	
  	.seat_s5{
		float: right;
  		width: 100px;
  		height: 600px;
  	}
  	
  	.facility{
  		clear:both;
  		width: 100%;
  		height: 110px;
  	}
  	
  	.facility span{
  		margin: 0 auto;
  	}
  	
  	#f1_wrap, #f3_wrap{
  		float:left;
  		width: 20%;
  		height: 110px;
  		padding: 20px 0;
  	}
  	
  	#f1, #f3{
  		text-align: center;
  		width: 100%;
  		height: 70px;
  		border: 5px solid gray;
  		color: #00a5bd;
  	}
  	
  	#f1 span, #f3 span{
  		line-height: 60px;
  	}
  	
  	#f1{
  		border-left: none;
  	}
  	
  	#f3{
  		border-right: none;
  	}
  	
  	#f2_wrap{
  		float:left;
  		width: 60%;
  		height: 110px;
  		padding-top: 80px;
  	}
  	
  	#f2{
  		margin: 0 auto;
  		text-align: center;
  		width: 80%;
  		height: 30px;
  		color: #00a5bd;
  		border: 5px solid gray;
  		border-bottom: none;
  	}
  	
  	.btn_seat{
  		width:100px;
  		height:90px;
  		float:left;
  		
  	}	
  	
  	.seat_s2 button, .seat_s5 button{
  		margin-bottom: 7px;
  	}
  	
  	.seat_s3_left button, .seat_s4_left button{
  		float:left;	
  	}
  	
  	.seat_s3_right button, .seat_s4_right button{
  		float:right;	
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
			<div id="s1_1">
				<button class="btn_seat" id="1" name=1>1</button>
			</div>
			<div id="s1_2">
				<button class="btn_seat" id="2" name=2>2</button>
			</div>
			<div id="s1_3">
				<button class="btn_seat" id="3" name=3>3</button>
			</div>
			<div id="s1_4">
				<button class="btn_seat" id="4" name=4>4</button>
			</div>
			<div id="s1_5">
				<button class="btn_seat" id="5" name=5>5</button>
			</div>
			<div id="s1_6">
				<button class="btn_seat" id="6" name=6>6</button>
			</div>
		</div>
		
		<div class="seat_s2">
			<div id="s2_1">
				<button class="btn_seat" id="7" name=7>7</button>
			</div>
			<div id="s2_2">
				<button class="btn_seat" id="8" name=8>8</button>
			</div>
			<div id="s2_3">
				<button class="btn_seat" id="9" name=9>9</button>
			</div>
			<div id="s2_4">
				<button class="btn_seat" id="10" name=10>10</button>
			</div>
			<div id="s2_5">
				<button class="btn_seat" id="11" name=11>11</button>
			</div>
			<div id="s2_6">
				<button class="btn_seat" id="12" name=12>12</button>
			</div>
		</div>
		
		<div class="seat_wrap2">
		
			<div class="seat_s3_wrap">
				<div class="seat_s3">
					<div class="seat_s3_left">
						<div id="s3_1">
							<button class="btn_seat" id="13" name=13>13</button>
						</div>
						<div id="s3_2">
							<button class="btn_seat" id="14" name=14>14</button>
						</div>
						<div id="s3_3">
							<button class="btn_seat" id="15" name=15>15</button>
						</div>
						<div id="s3_4">
							<button class="btn_seat" id="16" name=16>16</button>
						</div>
						<div id="s3_5">
							<button class="btn_seat" id="17" name=17>17</button>
						</div>
						<div id="s3_6">
							<button class="btn_seat" id="18" name=18>18</button>
						</div>
					</div>
					
					<div class="seat_s3_right">
						<div id="s3_7">
							<button class="btn_seat" id="19" name=19>19</button>
						</div>
						<div id="s3_8">
							<button class="btn_seat" id="20" name=20>20</button>
						</div>
						<div id="s3_9">
							<button class="btn_seat" id="21" name=21>21</button>
						</div>
						<div id="s3_10">
							<button class="btn_seat" id="22" name=22>22</button>
						</div>
						<div id="s3_11">
							<button class="btn_seat" id="23" name=23>23</button>
						</div>
						<div id="s3_12">
							<button class="btn_seat" id="24" name=24>24</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="seat_s4_wrap">
				<div class="seat_s4">
					<div class="seat_s4_left">
						<div id="s4_1">
							<button class="btn_seat" id="25" name=25>25</button>
						</div>
						<div id="s4_2">
							<button class="btn_seat" id="26" name=26>26</button>
						</div>
						<div id="s4_3">
							<button class="btn_seat" id="27" name=27>27</button>
						</div>
						<div id="s4_4">
							<button class="btn_seat" id="28" name=28>28</button>
						</div>
						<div id="s4_5">
							<button class="btn_seat" id="29" name=29>29</button>
						</div>
						<div id="s4_6">
							<button class="btn_seat" id="30" name=30>30</button>
						</div>
					</div>
					
					<div class="seat_s4_right">
						<div id="s4_7">
							<button class="btn_seat" id="31" name=31>31</button>
						</div>
						<div id="s4_8">
							<button class="btn_seat" id="32" name=32>32</button>
						</div>
						<div id="s4_9">
							<button class="btn_seat" id="33" name=33>33</button>
						</div>
						<div id="s4_10">
							<button class="btn_seat" id="34" name=34>34</button>
						</div>
						<div id="s4_11">
							<button class="btn_seat" id="35" name=35>35</button>
						</div>
						<div id="s4_12">
							<button class="btn_seat" id="36" name=36>36</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="seat_s5">
			<div id="s5_1">
				<button class="btn_seat" id="37" name=37>37</button>
			</div>
			<div id="s5_2">
				<button class="btn_seat" id="38" name=38>38</button>
			</div>
			<div id="s5_3">
				<button class="btn_seat" id="39" name=39>39</button>
			</div>
			<div id="s5_4">
				<button class="btn_seat" id="40" name=40>40</button>
			</div>
			<div id="s5_5">
				<button class="btn_seat" id="41" name=41>41</button>
			</div>
			<div id="s5_6">
				<button class="btn_seat" id="42" name=42>42</button>
			</div>
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

	$('.btn_seat').click(function(){
		var seat_num = $(this).attr("id");

		if(${not empty member}){
			if(confirm(seat_num+"번 자리 예약을 진행하시겠습니까?")==true){
				location.href="./seatReserve?seat_num="+seat_num
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