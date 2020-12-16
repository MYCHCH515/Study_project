<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <c:import url="./template/bootStrap.jsp"></c:import>
  <style>
  	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&family=Roboto:wght@300;400;500;700;900&display=swap');  
  	
  	* {		
  		margin: 0px;
		padding: 0px;
    	box-sizing: border-box;
    	font-family: 'Noto Sans KR','Roboto', sans-serif;
	  }
	  
	 body {
 	 	padding-top: 80px;
	}
	  
	ol, ul {
    	list-style: none;
	}
		
	a:-webkit-any-link {
   		text-decoration: none;
    	cursor: pointer;
	}

	.nav>li>a {
   		 padding: 0 20px;
   		 font-size: 17px;
   		 color: #9d9d9d;
	}
	
	.nav{
		 padding: 30px 0;
	}
	
	#logo{
		float: left;
		width: 100px;
		height: 60px;
		margin: 10px 0;
	}

	#myNavbar{
		height: 80px;
	}

    .navbar {
    	background-color:white;
        height:80px;
        margin-bottom: 0;
        border-radius: 0;
        border: none;
        position: fixed; 
		top: 0; 
		width: 100%;
		z-index: 9999; 
    }
  
 	.con1{
 		margin-top: 60px;
 	}
 	
 	.con1_1{
 		font-size: 30px;
 		font-weight: bold;
 		padding-right: 10px;
 	
 	}

 	.con1_2{
 		margin-top: 30px;
 	}

	.con2{
		margin-top: 30px;
		overflow: hidden;	
	} 	
 	.con2 img{
 	    width: 100%;
 		height: 320px;
 		object-fit: cover;  
 		/* 마우스가 이미지를 벗어 났을 때도 자연스럽게 크기가 줄어들기 위함 */   
	    transform: scale(1.0);        
        transition: transform .5s; 
 	}
 	
 	.con2 img:hover{
 	    transform: scale(1.03);       /* 이미지 확대 */
        transition: transform .5s; 	/* 시간 설정  */
 	}
    
    /* Add a gray background color and some padding to the footer */
    footer {
        height: 300px;
        background-color: #ebebeb;
        padding: 25px;
    }
    
    .ft_txt1{
    	font-size: 20px;
    }
    
    .ft_txt2{
    	padding-top: 2px;
    	padding-left:20px;
    	float: right;
    }
    
    .top_area{
    	padding: 20px 0;
    	border-bottom: 1px solid #e0e0e0;
    }
    
    .sns_list ul li{
    	float: right;
    	padding-top: 20px;
    	padding-left: 10px;
    }
    
    .copy_area {
    	padding-top: 30px;
    }
    
    .copy_txt{
    	color: #949494;
    	padding-top: 40px;
    }
    
    .carousel-inner img {
        width: 100%; /* Set width to 100% */
        margin: auto;
        min-height:200px;
    }

    /* Hide the carousel text when the screen is less than 600 pixels wide */
    @media (max-width: 600px) {
    .carousel-caption {
        display: none; 
    }
  }
  </style>
</head>

<body>

	<header class="navbar navbar-inverse lnb" >
	   <div class="container" id="myNavbar">
	      <a href="${pageContext.request.contextPath}"><img alt="" src="./images/logo.png" id="logo"></a>
	      
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#">개인석</a></li>
	        <li><a href="#">스터디룸</a></li>
	        <li><a href="#">사물함</a></li>
	        <li><a href="#">이용가이드</a></li>
	        <li><a href="#">공지사항</a></li>
	        <li class="Login_link"><a href="#" style="color:#00a5bd; font-weight: bold;">로그인</a></li>
	      </ul>
	    </div>
	</header>
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox">
	      <div class="item active">
	        <img src="https://placehold.it/1200x400?text=IMAGE" alt="Image">      
	      </div>
	
	      <div class="item">
	        <img src="https://placehold.it/1200x400?text=Another Image Maybe" alt="Image">      
	      </div>
	    </div>
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	    </a>
	</div>
	  
	<div class="container">    
	  <div class="row">
	    <div class="col-sm-12 con1">
	     <span class="con1_1">카페 공간</span>
	     <span>CAFE ZONE</span>
		     <div class="con1_2">
		     <p>전문 바리스타급 매니저가 커피 및 음료를 제조하며 정성껏 서비스해드립니다.</p>
		     <p>거북이의 기적을 이용하시는 고객들은 누구나 편안하게 다양한 차와 커피, 음료등을 즐길 수 있습니다.</p>
		     </div>
	    </div>

	    <div class="col-sm-6 con2">
	      <img src="./images/info1.jpg" class="img-rounded" alt="Image">
	    </div>
	    
	    <div class="col-sm-6 con2"> 
	      <img src="./images/info2.jpg" class="img-rounded" alt="Image">
	    </div>
	    
	     <div class="col-sm-6 con2">
		   <span class="con1_1">스터디 공간</span>
	       <span>STUDY ZONE</span>
			 <div class="con1_2">
			   <p>대형테이블, 개별 테이블, 1인석, 2인석 등 다양한 형태의 좌석을 자유롭게 이용할 수 있는</p>
			   <p>학습공간입니다. 편안한 조명과 아늑한 실내 분위기가 최적화된 학습공간을 제공합니다.</p>
			 </div>
	     </div>
	     
	     <div class="col-sm-6 con2">
		    <span class="con1_1">소모임 공간</span>
	        <span>STUDY ROOM</span>
		     <div class="con1_2">
			    <p>모임, 회의, 셀프 티칭이나 개별 스터디에 최적화된 룸 형태의 공간입니다.</p>
			    <p>누구에게도 방해받지 않는 독립적인 공간을 원하시는 분들에게 편안한 공간을 제공합니다.</p>
		     </div>
	     </div>
	     
	     <div class="col-sm-6 con2">
	       <img src="./images/info3.jpg" class="img-rounded" alt="Image">
	     </div>
	
	     <div class="col-sm-6 con2">
	        <img src="./images/info5.jpg" class="img-rounded" alt="Image">
	     </div>
	  </div>
	</div><br>
	

	<footer class="container-fluid">
	  <div class="container">
	  	<div class="top_area">
			<span class="ft ft_txt1">(주)거북이의 기적</span>
			
	      	<a href="#"><span class="ft ft_txt2">고객문의</span></a>
	       	<a href="#"><span class="ft ft_txt2">이용약관</span></a>
	        <a href="#"><span class="ft ft_txt2">개인정보처리방침</span></a>
	       	<a href="https://blog.naver.com/turtlesmiracle"><span class="ft ft_txt2">블로그</span></a>
       	</div>
       	
	    <div class="policy_area">
     		<div class="sns_list">
     	 		<ul>
     	 			<li><a href="https://www.instagram.com/turtles_miracle/" target="_blank" ><img alt="" src="./images/insta.png"></a></li>
		      		<li><a href="https://www.facebook.com/turtlesmiracle1/" target="_blank" ><img alt="" src="./images/facebook.png"></a></li>
		       		<li><a href="https://blog.naver.com/turtlesmiracle" target="_blank" ><img alt="" src="./images/blog.png"></a></li>
	      		</ul>
      	    </div> 	
	    </div> 
       	 
    	
    	<div class="copy_area">
	      	<p>
	      		<span>상호명: (주)거북이의 기적</span> 
	      		<span>|</span>
	      		<span>대표: 박병진 양형석</span>  
	      		<span>|</span>
	      		<span>사업자등록번호: 219-88-00897</span>
	      	</p>
	       
	        <p>
		        <span>영업소재지: 서울시 서대문구 명물길 21,3층</span> 
		        <span>|</span>
		        <span>이메일: sweetjinnycho@gmail.com</span> 
		        <span>|</span>
		        <span>가맹문의 : 1670 - 7929 </span>
	        </p>
	        
	        <p class="copy_txt">
	       		<span>Copyright © 2019 (주)거북이의기적. All rights reserved.</span>
	        </p>
       	</div>
      </div>
	</footer>
</body>

</html>