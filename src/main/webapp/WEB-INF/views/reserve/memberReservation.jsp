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
    	height: 800px
    }
    
    .sidenav {
      	background-color: #f1f1f1;
      	height: 700px;
    }
    
    .mypage_contents{
    	height: 700px;
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
     
     .pagination{
  		margin: 10px;
  	}
 
  	.pagination>li>a, .pagination>li>span {
	    position: relative;
	    float: left;
	    padding: 6px 12px;
	    margin-left: -1px;		
	    line-height: 1.42857143;
	    color: #333;
	    text-decoration: none;
	    border: none;
	    font-size: 15px;
    }
    
    .pagination>li>a:hover , .pagination>li>span:hover {
    	background: none;
    	font-weight: bold;
	}
	
	.list_none_wrap{
		padding: 50px 0;
	}
	
	.list_none{
		font-size: 17px;
		opacity: 50%;
		text-align: center;
	}
	
	.list_form .table td{
  		height: 65px;
  		vertical-align: middle;
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
	      </ul><br>
	    </div>
	
	    <div class="col-sm-10 mypage_contents">
	      <h3><strong>예약정보확인</strong></h3>
	      <hr>
	      <input type="hidden" name="curPage" id="curPage" value="1">

	      <c:choose>
		  <c:when test="${pager.totalCount ne 0}">
	      <!-- list -->
		  <div class="list_form">
				<table class="table">
					<tr class="list_tr">
						<td class="col-sm-2">예약번호</td>
						<td class="col-sm-2">예약좌석</td>
						<td class="col-sm-5">사용기간</td>
						<td class="col-sm-3">퇴실시간</td>
					</tr>
					
					<c:forEach items="${list}" var="vo">
				      <tr class="list_tr">
					        <td>${vo.reserve_num}</td>
					  		<td>${vo.seat_num}번좌석</td>
					        <td>${vo.reserve_strt_tm} ~ ${vo.reserve_end_tm}</td>
					        <td>${vo.check_out_tm}</td>
				      </tr>
			    	</c:forEach>
				</table>
		  </div>
	      
	        <!-- Page -->
		   <div class="col-sm-12" style="text-align: center;">
	 		  <ul class="pagination">	
		 		  		<c:if test="${pager.before}">
		  	   				<li><a href="#" class="list" title="${pager.startNum-1}">&lt;</a></li>
		  	   			</c:if>
		  	   
					    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					  		<li><a href="#" class="list" title="${i}">${i}</a></li>
					    </c:forEach>
				  
					    <c:if test="${pager.after}">
			  	   			<li><a href="#" class="list" title="${pager.lastNum+1}">&gt;</a></li>
			  	   		</c:if>
	  		  </ul>
		   </div>
		   
		    </c:when>
	 
			 <c:otherwise>
			 	<div class="list_form">
			 		<div class="list_none_wrap" style="text-align: center;">
			 			<img alt="" src="../images/list_none.jpg">
			 			<p class="list_none">예약내역이 없습니다.</p>
			 		</div>
			 		
			 	</div>
			 </c:otherwise>
	
		 </c:choose>	  
	    </div>
	  </div>
</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
