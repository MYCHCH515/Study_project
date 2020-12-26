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
  		padding-top: 50px;
  		text-align: center;
  	}
  	
  	.list_form, .write_form{
  		margin: 0 auto;
  		padding: 20px 0;
  		width: 90%;
  	}
  	
  	.write_control input {
  		border: none;
 		width: 90px;
 		height: 40px;
  		float: right;
  		background-color: #00a5bd;
  		color: white;
  	}
  </style>
</head>

<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
	<h3 class="table_list_title">뉴스&이벤트</h3>
	
	<!-- list -->
	<div class="list_form">
		<table class="table">
				<tr>
					<td class="col-sm-1">썸넬</td>
					<td class="col-sm-1">날짜</td>
					<td class="col-sm-10">제목</td>
				</tr>
		</table>
		
		<c:if test="${not empty member and member.mem_type eq '1'}">
			<div id="board_write_btn" class="write_control">
				 	 <input type="button" value="글작성">
			</div>
		</c:if>
	</div>
	
	
	
	
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>