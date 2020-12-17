<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Study_project</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <c:import url="./template/bootStrap.jsp"></c:import>
  <link href="./css/common.css" rel="stylesheet">
  <link href="./css/index.css" rel="stylesheet">
</head>

<body>
	<c:import url="./template/header.jsp"></c:import>
	
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
	
	<c:import url="./template/footer.jsp"></c:import>
</body>

</html>