<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC
  "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd" >
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/css/bootstrap/css/bootstrap.min.css'/>">
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/css/bootstrap/js/bootstrap.min.js'/>"></script>
<script type="text/javaScript" language="javascript" defer="defer">

function cancel() {
	location.href = "<c:url value='/list.do'/>";
}	
</script>	
</head>

<body>

<div class="container">
	<h1>등록/수정화면</h1>
	<div class="panel panel-default">
		<div class="panel-heading">
			<label for="">안녕하세요</label>			 
		</div>
	</div>
		<div class="panel-body">
			<form class="form-horizontal" method="post" action="">
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="id">게시물아이디:</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="idx" name="idx" placeholder="자동">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="pwd">제목</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력 하세요" maxlength="100">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="pwd">작성자/작성일:</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="writer" name="writer" placeholder="입력 하세요" maxlength="10" style="float:left; width:30%">
			      <input type="text" class="form-control" id="indate" name="indate" placeholder="입력 하세요" maxlength="10" style="float:left; width:30%">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="pwd">내용</label>
			    <div class="col-sm-10">
			      <textarea class="form-control" rows="5" id="contents" name="contents" maxlength="1000"></textarea>
			  	</div>
			  </div>
			</form>
		</div>
		 <div class="panel-footer">
			<button type="button" class="btn btn-default">등록</button>
			<button type="button" class="btn btn-default">수정</button>
			<button type="button" class="btn btn-default"  oneclick="cancel();">취소</button>
		 </div>
	</div>


</body>

</html>