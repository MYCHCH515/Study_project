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

    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
    	background-color:white;
        height:80px;
        margin-bottom: 0;
        border-radius: 0;
        border: none;
    }
     
    .affix {
	    top: 0;
	    width: 100%;
	    z-index: 9999 !important;
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

	<header class="navbar navbar-inverse" data-spy="affix" data-offset-top="0">
	   <div class="container" id="myNavbar">
	      <a href="${pageContext.request.contextPath}"><img alt="" src="./images/logo.png" id="logo"></a>
	      
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#">개인석</a></li>
	        <li><a href="#">스터디룸</a></li>
	        <li><a href="#">사물함</a></li>
	        <li><a href="#">이용가이드</a></li>
	        <li><a href="#">공지사항</a></li>
	        <li class="Login_link"><a href="#" style="color:#00a5bd;">로그인</a></li>
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
	  <div class="container inner_width">
	  	<div class="top_area">
	  		<a href="#" class="footer_logo">
	  			<span class="sp_icon logo_footer">거북이의 기적</span>
	  		</a> 
	  		<ul class="bar_list link_info">
	  			<li><a href="https://blog.naver.com/spacecloud" title="새창열림" target="_blank">블로그</a></li> 
	  			<li><a href="/agreement" class="">이용약관</a></li> 
	  			<li><a href="/policyPerson" class="">개인정보처리방침</a></li> 
	  			<li><a href="/policyOperate" class="">운영정책</a></li> 
	  			<li><a href="javascript:;" title="새창열림">고객 문의</a></li>
	  		</ul> 
	  		
	  		<a class="btn_toggle">
	  			<span class="btn_inner">(주)NSPACE 사업자정보 및 통신판매업자 신원정보</span></a>
	  	</div> 
	  	
	  	<div class="bottom_area">
	  		<ul class="bar_list company_info">
	  			<li class="first">상호명: 주식회사 앤스페이스</li> 
	  			<li>대표: 정수현</li> <li>사업자등록번호: 230-81-03117</li> 
	  			<li>통신판매업신고번호: 2018-서울강남-04590</li> 
	  			<li class="business_info"><a href="http://www.ftc.go.kr/www/bizCommView.do?key=232&amp;apv_perm_no=2018301013030200778&amp;pageUnit=10&amp;searchCnd=wrkr_no&amp;searchKrwd=2308103117&amp;pageIndex=1" target="_blank" title="새창열림">사업자등록정보</a></li> 
	  			<li>영업소재지: 서울특별시 강남구 삼성로 414</li> <li>
         		이메일:<a href="mailto:office@spacecloud.kr">office@spacecloud.kr</a></li> 
         		<li>대표전화: 1599-4312(평일 오후 2시 ~ 오후 6시)</li> 
         		<li><a href="javascript:;" title="새창열림" class="link">온라인 1:1 문의 바로가기</a>(평일 오전 10시 ~ 오후 6시) </li> 
       			<li class="first">* 공간에 대한 문의사항은 해당 공간 호스트에게 직접 문의해주세요.</li>
       		</ul> 
       		
       		<p class="p_caution">스페이스클라우드는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 스페이스클라우드는 공간 거래정보 및 거래에 대해 책임지지 않습니다.</p>
       	 </div> 
       	 
       	 <div class="policy_area">
       	 	<div class="sns_list">
       	 		<a href="http://blog.naver.com/spacecloud" title="새창열림" target="_blank" class="sp_icon ico_blog">블로그</a> 
       	 		<a href="http://post.naver.com/spacecloud" title="새창열림" target="_blank" class="sp_icon ico_post">포스트</a> 
       	 		<a href="https://www.facebook.com/spaceclouding" title="새창열림" target="_blank" class="sp_icon ico_facebook">페이스북</a> 
       	 		<a href="https://twitter.com/spacecloud_kr" title="새창열림" target="_blank" class="sp_icon ico_tweeter">트위터</a> 
       	 		<a href="https://www.instagram.com/spacecloud.kr" title="새창열림" target="_blank" class="sp_icon ico_instagram">인스타그램</a>
       	 	</div> 
       	 	
       	 	<ul class="bar_list">
       	 	    <li><a href="/agreement" class="">이용약관</a></li> 
       	 	    <li><a href="/policyPerson" class="">개인정보처리방침</a></li> 
       	 	    <li><a href="/policyOperate" class="">운영정책</a></li>
       	 	</ul>
       	 </div> 
       	 
       	 <p class="copyright">
       	 	<a href="http://www.nspace.co/" target="_blank" title="새창열림" class="copy_mobile">ⓒNSPACE Corp.</a> 
       	 	<span class="copy_pc">
       			Copyright
            <a href="http://www.nspace.co/" target="_blank" title="새창열림">NSPACE Corp.</a> All Rights Reserved.
           </span>
         </p>
         
       </div>
	</footer>
</body>
</html>