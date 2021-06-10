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
		<form class="form-horizontal" name="form1" method="post" action="">
		<input type="hidden" name="idx" value="${boardVO.idx}">		
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="">제목</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력 하세요" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="">작성자:</label>
		    <div class="col-sm-10">
		    <p>  ${boardVO.writerNm}</p>
		      <input type="hidden" class="form-control" id="writer" name="writer" maxlength="15" style="float:left;width:30%" value="${boardVO.writer }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="">내용</label>
		    <div class="col-sm-10">
		      <textarea class="form-control" rows="5" id="contents" name="contents" maxlength="1000"></textarea>
		  	</div>
		  </div>
		</form>
	</div>
	<div class="panel-footer">
	<c:if test="${!empty sessionScope.userId }">
      <c:if test="${empty boardVO.idx }">
      <button type="button" class="btn btn-default" onclick="add();">등록</button>
      </c:if>
      <c:if test="${!empty boardVO.idx }">
      <button type="button" class="btn btn-default" onclick="mod();">수정</button>
      </c:if>
    </c:if>
      <button type="button" class="btn btn-default" onclick="cancel();">취소</button>
	 </div>
</div>

<script type="text/javaScript" language="javascript" defer="defer">

function cancel() {
	location.href = "<c:url value='/list.do'/>";
}	
function add(){
	if( $('#title').val() == '' ){
		alert("제목을 입력하세요");
		$('#title').focus();
		return;
	}
	if( $('#contents').val() == '' ){
		alert("내용을 입력하세요");
		$('#contents').focus();
		return;
	}
	
	if( !confirm("등록하시겠습니까?") ){
		return;
	}
		
	document.form1.action = "<c:url value='/insert.do'/>";
	document.form1.submit();
}
function mod(){
	if( $('#title').val() == '' ){
		alert("제목을 입력하세요");
		$('#title').focus();
		return;
	}
	if( $('#contents').val() == '' ){
		alert("내용을 입력하세요");
		$('#contents').focus();
		return;
	}
	
	if( !confirm("수정하시겠습니까?") ){
		return;
	}
	
	document.form1.action = "<c:url value='/edit.do'/>";
	document.form1.submit();
}


</script>
</body>
</html>