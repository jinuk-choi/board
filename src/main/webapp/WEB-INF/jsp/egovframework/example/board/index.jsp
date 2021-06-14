<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/css/bootstrap/css/bootstrap.min.css'/>">
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/css/bootstrap/js/bootstrap.min.js'/>"></script>
</head>
<body>
<div class="container">
<h1>로그인</h1>
<div class="panel panel-default">
<div class="panel-heading">
		<c:if test="${sessionScope == null || sessionScope.userId == null || sessionScope.userId == '' }">
			<form class="form-inline" method="post" action="<c:url value='/login.do'/>">   
			 	<div class="form-group">
			    	<label for="user_id">ID:</label>
			    	 <select class="form-control" id="user_id" name="user_id" onchange="setPwd(this.value);">
				     	 <option value="">선택하세요</option>
					     <option value="admin">관리자</option>
					     <option value="guest">사용자</option>
					     <option value="guest2">사용자2</option>
					 </select>
			 	</div>
			 	
				<div class="form-group">				
			    	<label for="password">Password:</label>
			    	<input type="password" class="form-control" id="password" name="password">
			  	</div>		
					 <button type="submit" class="btn btn-default" onclick="return check()">로그인</button>
			</form>	
			&emsp;&emsp;&emsp;&emsp; &emsp;&emsp;&emsp;&emsp;
			<button type="submit" class="btn btn-default" onclick="user()">회원가입</button>
			
		</c:if>
		<c:if test="${sessionScope != null && sessionScope.userId != null && sessionScope.userId != '' }">
			${sessionScope.userName}님 환영합니다.
			<button id="button"  onclick="out();">로그아웃</button>
		</c:if>				 
		</div>
</div>
</div>
<script type="text/javaScript" language="javascript" defer="defer">
$( document ).ready(function() {
	<c:if test="${!empty msg}">
		alert("${msg}");
	</c:if>
});



function setPwd(user_id){
	if( user_id == "admin" ){
		$('#password').val('manager');
	}else if( user_id == "guest" ){
		$('#password').val('guest');
	}else if( user_id == "guest2" ){
		$('#password').val('guest2');
	}
}
function check(){
	//alert('1');
	if( $('#user_id').val() == '' ){
		alert("아이디를 입력하세요");
		return false;
	}
	if( $('#password').val() == '' ){
		alert("비밀번호를 입력하세요");
		return false;
	}
	return true;
}
function out() {
	location.href = "<c:url value='/logout.do'/>";
}


function user() {
	location.href = "<c:url value='/insertpage.do'/>";
}

</script>
</body>
</html>