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
  	
  </style>
</head>

<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
	<h3 class="table_list_title">개인석</h3>
	
	
	
	
	<div id=wrap>

		<div class="G1"></div>
		<div class="G2"></div>
		<div class="G3"></div>
		<div class="G4"></div>

		<div>
			<div class="s_box" style="top: 0px; left: 0px">
				<table>
					<tbody>
						<tr>
							<td width="40px" id="G101_no">7</td>
							<td width="*" colspan="2" id="G101_name">7</td>
						</tr>
						<tr>
							<td colspan="4" id="G101_inOut" align="center">7</td>
						</tr>
						<tr>
							<td colspan="4" class="clearfix">
								<!-- <button class="btnIn" id="G101_btnIn" value="G101">입실</button> -->
								<button class="btnOut" id="7"
									value="G101">퇴실</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="s_box" style="top: 0px; left: 100px">
				<table>
					<tbody>
						<tr>
							<td width="40px" id="G102_no">8</td>
							<td width="*" colspan="2" id="G102_name">8</td>
						</tr>
						<tr>
							<td colspan="4" id="G102_inOut" align="center">8</td>
						</tr>
						<tr>
							<td colspan="4" class="clearfix">
								<!-- <button class="btnIn" id="G102_btnIn" value="G102">입실</button> -->
								<button class="btnOut" id="8"
									value="G102">퇴실</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			
		</div>
	
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>