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
	        <li><a href="memberPage">나의정보</a></li>
	        <li><a href="memberReservation">예약내역</a></li>
	        <li><a href="memberInquiry">문의내역</a></li>
	      </ul><br>
	    </div>
	
	    <div class="col-sm-10 mypage_contents">
	      <h3><strong>예약정보확인</strong></h3>
	      <hr>
	       <input type="hidden" name="curPage" id="curPage" value="1">
	      <p style="margin: 20px 0;"><span style="color:blue;">${member.mem_name}</span>님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</p>
	    
	      <!-- list -->
		  <div class="list_form">
				<table class="table">
					<tr class="list_tr">
						<td class="col-sm-1">글 번호</td>
						<td class="col-sm-8">제목</td>
						<td class="col-sm-2">날짜</td>
						<td class="col-sm-1">조회</td>
					</tr>
					
					<c:forEach items="${list}" var="vo">
				      <tr class="list_tr">
					        <td>${vo.board_num}</td>
					        <td><a href="${board}Select?board_num=${vo.board_num}">${vo.board_title}</a></td> 
					        <td>${vo.regDate}</td>
					        <td>${vo.hit}</td>
				      </tr>
			    	</c:forEach>
				</table>
		  </div>
	      
	        <!-- Page -->
		   <div class="col-sm-12">
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
		  
	    </div>
	  </div>
</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
