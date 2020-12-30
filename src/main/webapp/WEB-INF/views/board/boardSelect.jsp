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
   </style>
   
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
	<h3 class="table_list_title">뉴스&amp;이벤트</h3>
	
	<form action="" id="frm">
		<input type="hidden" value="${vo.board_num}" name="board_num">
	</form>
	<h3>Num: ${vo.board_num}</h3>
	<h3>Title: ${vo.board_title}</h3>
	<h3>Writer: ${vo.board_writer}</h3>
	<h3>Contents: ${vo.board_contents}</h3>
	
	<br>
	<h3>Files</h3>
	
	<c:forEach items="${vo.files}" var="file">
		<p><a href="${board}FileDown?fileNum=${file.fileNum}">${file.oriName}</a></p>
	</c:forEach>
	
	<button class="btn btn-primary go" title="Update">Update</button>
	<button class="btn btn-danger go"  title="Delete">Delete</button>
	
	
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
</body>

	<script type="text/javascript">
		$(".go").click(function(){
			var board='${board}';
			var t = $(this).attr("title");
	
			$("#frm").attr("action", board+t);
	
			if(t=='Delete'){
				$("#frm").attr("method","post");
			}
			
			$("#frm").submit();
			
			});
	</script>

</html>