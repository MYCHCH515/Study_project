<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
  <title>Study_project</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <c:import url="../template/bootStrap.jsp"></c:import>
  <link href="../css/common.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
	
  <style type="text/css">
  	.table_list_title{
  		padding: 50px 0 30px 0;
  		text-align: center;
  	}
  	
  	.list_form, .write_form{
  		height: 1000px;
  		margin: 0 auto;
  		width: 90%;
  	}
  	
  	#files{
		margin-top: 5px;
	}
	
	.files{
		padding: 10px 0;
	}
  	
  	.write_control {
  		margin-top: 10px;
  		border: none;
 		width: 100px;
 		height: 50px;
  		float: right;
  		background-color: #00a5bd;
  		text-align: center;
  	}
  	
  	.write_control a{
  		line-height: 50px;
  		color: white;
  	}
  	
  	.go_list{
  		background-color: gray;
  		margin-right: 10px;
  		margin-bottom: 10px;
  	}
  	
  	.write_form #title, .write_form #writer{
  		height: 40px;
  	}
  	
   .error{
		color: red;
	}
	
	.errors{
		text-align: left;
	}
  </style>


<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
		<h3 class="table_list_title">글 작성</h3>
		
		<!-- Write Form -->
		<div class="write_form">
	  		<form:form modelAttribute="boardVO" id="write_frm" enctype="multipart/form-data" >
	  			<form:hidden path="board_num" name="board_num" value="${vo.board_num}"/>
			    <div class="form-group">
			      <label for="title">글 제목</label>
			      <form:input path="board_title" class="form-control empty" id="title" title="제목" value="${vo.board_title}" />
			      <div class="errors"><form:errors path="board_title" cssClass="error" ></form:errors></div>
			    </div>
		   
			     <div class="form-group">
			      <label for="contents">작성자</label>
			      <form:input path="board_writer" class="form-control empty" id="writer" title="writer" value="${vo.board_writer}" readonly="true"/>
			      <div class="errors"><form:errors path="board_writer" cssClass="error"></form:errors></div>
			    </div>

			    <div class="form-group">
			      <label for="contents">내용</label>
			      <textarea class="form-control empty" rows="20" cols="30" id="contents" name="board_contents" title="내용">
			      	${vo.board_contents}
			      </textarea>
			    </div>
			   
				<div id="files" class="col-sm-12" style="border: 1px solid #ddd">
				  <input class="files" type="file" class="form-control" name="files">
				  <input class="files" type="file" class="form-control" name="files">
				  <input class="files" type="file" class="form-control" name="files">
				</div>  
	  		</form:form>
	  		
	  		<div>
				<div id="board_submit_btn" class="write_control">
					 <a href="#">수정</a>
				</div>
				
				<div  class="write_control go_list">
					 <a href="#">목록</a>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	var count=0;

	<!--서머노트-->
	
	 $('#contents').summernote({
		 height:500,
		 callbacks:{
			 onImageUpload:function(files, editor, welEditable){
				 var formData = new FormData();	    
				 formData.append('file', files[0]); 
				 
				 $.ajax({
				    data: formData,
				    type: "POST",
				    url: 'summernote',
				    cache: false,
				    contentType: false,
				    enctype: 'multipart/form-data',
				    processData: false,
					 success:function(data){
						 data = data.trim();
						 $("#contents").summernote('editor.insertImage', data);
					 }
				 })
			 },
			 
			 onMediaDelete:function(files){
				var fileName = $(files[0]).attr("src");
				console.log(fileName);
				fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
				console.log(fileName);
				
				$.ajax({
					type:"POST",
					url : "./summernoteDelete",
					data: {
						file:fileName
					},
					success:function(data){
						alert(data);
					}
				
				}); 
			 }
		 }
		
	 });

	 $("#board_submit_btn").click(function(){
			$("#write_frm").submit();
	 });

	 $(".go_list").click(function(){
			location.href="./${board}List"
	 });
	 
	 
</script>
</html>