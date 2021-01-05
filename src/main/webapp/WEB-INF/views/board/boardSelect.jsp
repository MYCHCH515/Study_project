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
  	
  	.board_wrap{
  		margin: 0 auto;
  		width: 90%;
  		
  	}
  	
  	.btn_control_wrap{
  		margin: 0 auto;
  		width: 90%;
  	}
  	
  	.board_header strong{
  		font-size: 20px;
  	}
  	
  	.board_content{
  		padding: 15px 0; 
  		border-bottom: 1px solid #ddd;
  	}
  	
  	#b_hit{
  		float: right;
  	}
  	
  	.btn_control button{
  		height: 50px;
  		border-radius: 0;
  		border: none;
  		text-align: center;
  		line-height: 50px;
  		color: white;
  	}
  	
 	#board_list {
 		margin: 10px 0;
 		text-align: center;
 	}
 
  	#board_list button{
  		background-color: #00a5bd;
    	width:200px;
    }
     
    #board_del button, #board_upd button{
    	background-color: gray;
    	margin-left: 10px;
    	margin-bottom: 10px;
    	float: right;
    	width:100px;
    }
    
    #board_del button{
    	background-color: #e65c53;
    }
    
    .board_files{
    	margin: 10px 0;
    }
    
    .b_files{
    	margin: 0 5px;
    }
   </style> 
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
	<h3 class="table_list_title">뉴스&amp;이벤트</h3>
	
	<form action="" id="frm">
		<input type="hidden" value="${vo.board_num}" name="board_num">
	</form>
	
	<div class="board_wrap">
		<div class="board_header">
			<p><strong>[${vo.regDate}] ${vo.board_title}</strong></p>
			<span>뉴스&amp;이벤트</span>
			<span id="b_hit">조회${vo.hit}</span>
			
		</div>
		<hr>
		<div class="board_content">
				${vo.board_contents}	
		</div>
		<div class="board_files">
			<c:forEach items="${vo.files}" var="bfile">
			 	<span class="b_files"><a href="${board}FileDown?fileNum=${bfile.fileNum}">${bfile.oriName}</a></span>
			</c:forEach> 
		</div>
	</div>
	
	<div class="btn_control_wrap">
		<div class="btn_control" id="board_list">
			<button class="move_list" title="List">목록</button>
		</div>
	
		<div>
			<c:if test="${not empty member and member.mem_type eq '1'}">
				 <div class="btn_control" id="board_del">
				 	<button class="move_link" title="Delete">삭제</button>
				 </div>
				 
				 <div class="btn_control" id="board_upd">
				 	<button class="move_link" title="Update">글수정</button>
				 </div>
			 </c:if>
		</div>
	</div>
	</div>
	<c:import url="../template/footer.jsp"></c:import>
</body>

	<script type="text/javascript">
		$(".move_link").click(function(){
			var board='${board}';
			var title = $(this).attr("title");
	
			$("#frm").attr("action", board+title);
	
			if(title=='Delete'){
				$("#frm").attr("method","post");
			}
			
			$("#frm").submit();
			
			});

		$(".move_list").click(function(){
			location.href="./${board}List"
		});
	</script>

</html>