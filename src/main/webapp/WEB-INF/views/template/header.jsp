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
	        	<button onclick="document.getElementById('login_modal').style.display='block'">로그인</button>
	        	<a href="${pageContext.request.contextPath}/member/memberLogin" style="color:#00a5bd; font-weight: bold;">로그인</a>
	        </li>
	      </ul>
	    </div>
	    
		<div id="login_modal" class="modal">
		  
		  <form class="modal-content animate" action="" method="post">
		    <div class="imgcontainer">
		      <span onclick="document.getElementById('login_modal').style.display='none'" class="close" title="Close Modal">&times;</span>
		      <img src="img_avatar2.png" alt="Avatar" class="avatar">
		    </div>
		
		    <div class="container">
		      <label for="uname"><b>Username</b></label>
		      <input type="text" placeholder="Enter Username" name="uname" required>
		
		      <label for="psw"><b>Password</b></label>
		      <input type="password" placeholder="Enter Password" name="psw" required>
		        
		      <button type="submit">Login</button>
		      <label>
		        <input type="checkbox" checked="checked" name="remember"> Remember me
		      </label>
		    </div>
		
		    <div class="container" style="background-color:#f1f1f1">
		      <button type="button" onclick="document.getElementById('login_modal').style.display='none'" class="cancelbtn">Cancel</button>
		      <span class="psw">Forgot <a href="#">password?</a></span>
		    </div>
		  </form>
		</div>
</header>

<script>
// Get the modal
var modal = document.getElementById('login_modal');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>