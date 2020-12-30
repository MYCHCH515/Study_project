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
  	
  	.write_form{
  		margin: 0 auto;
  		height: 1000px;
  		width: 90%;
  	}
  	
  	.list_form{
  		margin: 0 auto;
  		height: 450px;
  		width: 90%;
  		padding: 30px 0;
  		text-align: center;
  	}
  	.list_footer{
  		text-align: center;
  	}
  	
  	.list_form .table td{
  		height: 65px;
  		vertical-align: middle;
  	}
  	
  	.write_control input {
  		border: none;
 		width: 90px;
 		height: 40px;
  		float: right;
  		background-color: #00a5bd;
  		color: white;
  	}
  	
  	#bw_btn_wrap{
  		padding-bottom: 20px;
  	}
  	
  	.search_wrap{
  		margin: 0 auto;
  		text-align: center;
  		width: 453px;
  		height: 53px;
  	}
  	
  	#kind{
  		width: 100px; 
  		height: 50px; 
  		border-color: #ddd; 
  		background-color: white;	
  	}
  	
  	#search{
  		width: 300px; 
  		height: 50px; 
  		border: 1px solid #ddd;
  	}
  	
  	#search_btn{
  		background-color: #111; 
  		opacity: 70%;
  		border: none;
  		width: 50px; 
  		height: 50px;
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
    
  </style>
  
  
 <!-- <script type="text/javascript">
  $(document).ready(function(){
	  	$("#search").val('${param.search}');
	
		var kind = '$(param.kind)'; 

		if(kind == '' || 'title'){
			$("#k_title").attr("selected","selected")
		} 
		else if(kind == 'writer'){
			$("#k_writer").attr("selected","selected")
		}
		else if(kind == 'contents'){
			$("#k_contents").attr("selected","selected")
		}
  </script>  -->
  
</head>

<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
	<h3 class="table_list_title">뉴스&amp;이벤트</h3>

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
	
	<div class="list_footer">	
	   <!-- search -->
	   <div class="col-sm-12">
			  <form action="./${board}List" id="frm">
			    <input type="hidden" name="curPage" id="curPage" value="1">
			    
				    <div class="input-group search_wrap">
					  	<div>
						  <select class="form-control" id="kind" name="kind">
						    <option value="all" id="k_all">전체</option>
						    <option value="title" id="k_title">제목</option>
						    <option value="contents" id="k_contents">내용</option>
						  </select>
						</div>
						
						<div>
						    <input type="text" class="form-control" id="search" placeholder="Search" name="search">
							    <div class="form-item">
								    <button type="submit" id="search_btn">
								        <img alt="" src="../images/srch.png">
								    </button>
					    		</div>
						</div>
					</div>       
			 </form>
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
	   
	   <div class="col-sm-12" id="bw_btn_wrap">
			<c:if test="${not empty member and member.mem_type eq '1'}">
				<div id="board_write_btn" class="write_control">
					<input type="button" value="글작성">
				</div>
			</c:if>
		</div>
	
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
</body>

	<script>
		$("#search").val('${param.search}');
	
		var kind = '$(param.kind)'; //코드에 헛점있음 
		if(kind != '')
		{
			$("#kind").val('${param.kind}');
		}
	
		$(".list").click(function(){
			var curPage = ($(this).attr("title"));
			$("#curPage").val(curPage);
			
			$("#frm").submit();
		});
		
		$("#board_write_btn").click(function(){
			location.href="/${board}/${board}Write"
		});
	</script>

</html>