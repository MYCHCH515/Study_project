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
</head>

<style type="text/css">
  	.table_list_title{
  		padding: 50px 0 30px 0;
  		text-align: center;
  	}
</style>


<body>

	<c:import url="../template/header.jsp"></c:import>
	
		<div class="container">
		<h3 class="table_list_title">예약 확인</h3>
		${vo2.reserve_num}
		${vo2.mem_num}
		</div>
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>