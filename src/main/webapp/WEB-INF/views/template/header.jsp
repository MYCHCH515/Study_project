<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="navbar navbar-inverse lnb" >
	   <div class="container" id="myNavbar">
	      <a href="${pageContext.request.contextPath}/"><img alt="" src="${pageContext.request.contextPath}/images/logo.png" id="logo"></a>
	      
	      <ul class="nav navbar-nav navbar-right">
	        <li class="lnb_li"><a href="${pageContext.request.contextPath}"><span>개인석</span></a></li>
	        <li class="lnb_li"><a href="${pageContext.request.contextPath}"><span>스터디룸</span></a></li>
	        <li class="lnb_li"><a href="${pageContext.request.contextPath}"><span>사물함</span></a></li>
	        <li class="lnb_li"><a href="${pageContext.request.contextPath}"><span>이용가이드</span></a></li>
	        <li class="lnb_li"><a href="${pageContext.request.contextPath}"><span>뉴스&이벤트</span></a></li>
	        
	        <c:choose>
	        	<c:when test="${not empty member}">
	        		 <li>
	        			<a href="${pageContext.request.contextPath}/member/memberPage" style="color:#00a5bd; font-weight: bold;">마이페이지</a>
	       			 </li>
	       			 
	       			 <li class="Logout_link">
	        			<a href="${pageContext.request.contextPath}/member/memberLogout" style="color:#00a5bd; font-weight: bold;">로그아웃</a>
	       			 </li> 
	        	</c:when>
	        	
	        	<c:otherwise>
	        		<li class="Login_link">
	        			<a href="${pageContext.request.contextPath}/member/memberLogin" style="color:#00a5bd; font-weight: bold;">로그인</a>
	       			</li>
	        	</c:otherwise>
	        </c:choose>
	
	      </ul>
	    </div>
</header>
