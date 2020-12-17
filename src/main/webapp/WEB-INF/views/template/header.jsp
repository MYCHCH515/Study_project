<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="navbar navbar-inverse lnb" >
	   <div class="container" id="myNavbar">
	      <a href="${pageContext.request.contextPath}/"><img alt="" src="${pageContext.request.contextPath}/images/logo.png" id="logo"></a>
	      
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="${pageContext.request.contextPath}">개인석</a></li>
	        <li><a href="${pageContext.request.contextPath}">스터디룸</a></li>
	        <li><a href="${pageContext.request.contextPath}">사물함</a></li>
	        <li><a href="${pageContext.request.contextPath}">이용가이드</a></li>
	        <li><a href="${pageContext.request.contextPath}">공지사항</a></li>
	        <li class="Login_link">
	        	<a href="${pageContext.request.contextPath}/member/memberLogin" style="color:#00a5bd; font-weight: bold;">로그인</a>
	        </li>
	      </ul>
	    </div>
</header>
