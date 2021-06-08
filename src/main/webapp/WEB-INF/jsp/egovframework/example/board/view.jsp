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
			<form id="form1" name="form1" class="form-horizontal" method="post" action="">
			<input type="hidden" name="idx" value="${boardVO.idx}">	
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="">게시물아이디:</label>
			    <div class="col-sm-10 control-label" style="text-align:left;">
			    	<c:out value="${boardVO.idx}"/>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="">제목</label>
			    <div class="col-sm-10 control-label" style="text-align:left;">
			    	<c:out value="${boardVO.title}"/>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="">작성자/작성일:</label>
			    <div class="col-sm-10 control-label" style="text-align:left;">
			 		<c:out value="${boardVO.writer}"/> / <c:out value="${boardVO.indate}"/>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="pwd">내용</label>
			    <div class="col-sm-10 control-label" style="text-align:left;">
			    	<c:out value="${boardVO.contents}"/>
			  	</div>
			  </div>
			</form>	
		</div>
		 <div class="panel-footer">
			<button type="button" class="btn btn-default" onclick="mod();">수정</button>
      		<button type="button" class="btn btn-default" onclick="del();">삭제</button>
			<button type="button" class="btn btn-default" onclick="list();">목록</button>
		 </div>
		 <div class="well well-sm">작성자/작성일</br>내용</div>
		 <div class="well well-lg">
			 <form class="form-horizontal" method="post" action="reply.do">
			 <div class="form-group">
			    <label class="control-label col-sm-2" for="pwd">작성자:</label>
			    <div class="col-sm-10 control-label" style="text-align:left;">
			      <input type="text" class="form-control" id="writer" name="writer" placeholder="입력 하세요" maxlength="10" style="float:left; width:30%">		   
			    </div>
			 </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="pwd">댓글</label>
			    <div class="col-sm-10">
			      <textarea class="form-control" rows="3" id="repky" name="reply" maxlength="300"></textarea>
			  	</div>
			  </div>
			  <button type="submit" class="btn btn-default">작성</button>
			 </form>
		 </div>
</div>
<script type="text/javaScript" language="javascript" defer="defer">
function list() {
	location.href = "<c:url value='/list.do'/>";
}	

function mod(){
	location.href = "<c:url value='/mgmt.do'/>?idx=${boardVO.idx}";
}
function del(){
	
	if( !confirm("삭제하시겠습니까?") ){
		return;
	}
	document.form1.action = "<c:url value='/delete.do'/>";
	document.form1.submit();
}


</script>	
</body>
</html>