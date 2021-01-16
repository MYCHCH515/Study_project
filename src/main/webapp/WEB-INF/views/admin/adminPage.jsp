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
   <h3 class="table_list_title">관리페이지</h3>
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	      <ul class="nav nav-pills nav-stacked mypage_li">
	        <li><a href="/admin/adminPage">회원관리</a></li>
	        <li><a href="/admin/adminSeatReservation">좌석관리</a></li>
	        <li><a href="/admin/adminLockerReservation">사물함관리</a></li>
	        <li><a href="/admin/adminInquiry">문의내역관리</a></li>
	      </ul><br>
	    </div>
	
	    <div class="col-sm-10 mypage_contents">
	      <h3><strong>회원관리</strong></h3>
	      <hr>
	   
	      <c:choose>
		  <c:when test="${pager.totalCount ne 0}">
	      <!-- list -->
		  <div class="list_form">
				<table class="table">
					<tr class="list_tr">
						<td ><input type="checkbox" id="allCheck" name="allCheck"></td>
						<td class="col-sm-1">회원번호</td>
						<td class="col-sm-2">회원명</td>
						<td class="col-sm-2">회원ID</td>
						<td class="col-sm-2">전화번호</td>
						<td class="col-sm-2">이메일</td>
						<td class="col-sm-2">가입날짜</td>
					</tr>
					
					<c:forEach items="${list}" var="vo">
				      <tr class="list_tr">
				      		<td ><input type="checkbox" name="rowCheck" class="chkBox" value="${mem_num}" title="${vo.mem_num}"></td>
					        <td>${vo.mem_num}</td>
					  		<td>${vo.mem_name}</td>
					        <td>${vo.mem_id}</td>
					        <td>${vo.mem_phone}</td>
					        <td>${vo.mem_email}</td>
					        <td>${vo.mem_regDate}</td>
				      </tr>
			    	</c:forEach>
				</table>
		  </div>
		  
		  <input type="button" value="선택회원삭제" id="selectDelete" class="btn btn-danger" style="float: right;">
	      
		  <div class="list_footer">	
		   <!-- search -->
		   <div class="col-sm-12">
				  <form action="./adminPage" id="search_frm">
				    <input type="hidden" name="curPage" id="curPage" value="1">
				    
					    <div class="input-group search_wrap">
						  	<div>
							  <select class="form-control" id="kind" name="kind">
							    <option value="mem_id" id="k_id">아이디</option>
							    <option value="mem_name" id="k_name">회원명</option>
							    <option value="mem_num" id="k_num">회원번호</option>
							  </select>
							</div>
							
							<div>
							    <input type="text" class="form-control" id="search" placeholder="Search" name="search">
								    <div class="form-item">
									    <button type="button" id="search_btn">
									        <img alt="" src="../images/srch.png">
									    </button>
						    		</div>
							</div>
						</div>       
				 </form>
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
		   
		 </div>
		   
		    </c:when>
	 
			 <c:otherwise>
			 	<div class="list_form">
			 		<div class="list_none_wrap" style="text-align: center;">
			 			<img alt="" src="../images/list_none.jpg">
			 			<p class="list_none">일치하는 회원이 없습니다.</p>
			 		</div>
			 		
			 	</div>
			 </c:otherwise>
	
		 </c:choose>	  
	    </div>
	  </div>
</div>
<c:import url="../template/footer.jsp"></c:import>
</body>

<script>
		$("#search").val('${param.search}');
		var kind = '${param.kind}'; 
		 if(kind != '')
		{
			$("#kind").val(kind);
		} 
		else{
			$("#kind").val("mem_id");
		}

	   var search_frm = $("#search_frm");

		$("#search_btn").on("click", function(){
			var s_search = false;
			if(!search_frm.find("input[name='search']").val()){
				alert("검색어를 입력하세요");
			}else{
				s_search = true;
				search_frm.submit();
			}
		}); 

		$(".list").click(function(){
			var curPage = ($(this).attr("title"));
			$("#curPage").val(curPage);
			$("#search_frm").submit();
		});

		$("#allCheck").click(function(){
			var chk = $("#allCheck").prop("checked");
			if(chk){
				$(".chkBox").prop("checked", true);
			}
			else{
				$(".chkBox").prop("checked", false);
			}
		});

		$(".chkBox").click(function(){
			$("#allCheck").prop("checked",false);
		});

		$("#selectDelete").click(function(){

			var checkArr = new Array();

			$("input[class='chkBox']:checked").each(function(){
				checkArr.push($(this).attr("title"));
			});
			
			if(checkArr.length==0){
				alert("선택된 글이 없습니다.")
			}
			else{
				var confirm_val = confirm("정말 삭제하시겠습니까?");

				if(confirm_val){
			
					$.post("/member/memberSelectSecession",
							{"chkBox":checkArr},
						function(result){
							if(result<1){
								alert("회원삭제 실패했습니다.");
							}
							else{
								alert("회원삭제 성공했습니다.")
								location.href="./adminPage";
							}
						}
					);
				}
				else{
					return;
				}
			}
		});
	</script>

</html>