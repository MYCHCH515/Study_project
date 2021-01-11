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
     	font-size: 18px;
     	font-weight: bold;
     }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
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
	        <li><a class="">MY 정보</a></li>
	        <li><a>MY 예약</a></li>
	        <li><a>MY 문의</a></li>
	      </ul><br>
	    </div>
	
	    <div class="col-sm-10 mypage_contents">
	      <h4><small>RECENT POSTS</small></h4>
	      <hr>
	      <h2>I Love Food</h2>
	      <h5><span class="glyphicon glyphicon-time"></span> Post by Jane Dane, Sep 27, 2015.</h5>
	      <h5><span class="label label-danger">Food</span> <span class="label label-primary">Ipsum</span></h5><br>
	      <p>Food is my passion. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
	      <br><br>
	      
	      <h4><small>RECENT POSTS</small></h4>
	      <hr>
	      <h2>Officially Blogging</h2>
	      <h5><span class="glyphicon glyphicon-time"></span> Post by John Doe, Sep 24, 2015.</h5>
	      <h5><span class="label label-success">Lorem</span></h5><br>
	      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
	      <hr>
	
	      <h4>Leave a Comment:</h4>
	      <form role="form">
	        <div class="form-group">
	          <textarea class="form-control" rows="3" required></textarea>
	        </div>
	        <button type="submit" class="btn btn-success">Submit</button>
	      </form>
	      <br><br>
	      
	      <p><span class="badge">2</span> Comments:</p><br>
	     
	    </div>
	  </div>
</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
