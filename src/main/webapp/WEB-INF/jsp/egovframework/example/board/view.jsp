<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			    <label class="control-label col-sm-2" for="">제목</label>
			    <div class="col-sm-10 control-label" style="text-align:left;">
			    	<c:out value="${boardVO.title}"/>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="">작성자/작성일:</label>
			    <div class="col-sm-10 control-label" style="text-align:left;">
			 		<c:out value="${boardVO.writerNm}"/> / <c:out value="${boardVO.indate}"/>
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
		 	<button type="button" class="btn btn-default" onclick="add2('${boardVO.aDepth}','${boardVO.aOrder}','${boardVO.aGroup}');">답글</button>
			<button type="button" class="btn btn-default" onclick="mod();">수정</button>
      		<button type="button" class="btn btn-default" onclick="del();">삭제</button>
			<button type="button" class="btn btn-default" onclick="list();">목록</button>
		 </div>
		 <br>
		<div id="commentList">
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<div class="well well-sm">
				<c:out value="${result.writer}"/> / <c:out value="${result.indate}"/>
				<c:if test="${result.bDepth > 1 }">
					<c:forEach begin="2" end="${result.bDepth}">
						&nbsp;&nbsp;
					</c:forEach>
					<c:forEach begin="2" end="${result.bDepth}">
						┕
					</c:forEach>
				</c:if>
				<c:out value="${fn:replace(result.reply, crcn, br)}" escapeXml="false"/>
				<div><button type="button" class="btn-Insert">답글</button></div>
				<div><button type="button" class="btn-Edit">수정</button></div>
				<div><button type="button" class="btn-default" onclick="redel('${result.seq}',${result.idx});">삭제</button></div>
			</div>
			<div class="myFlex" style="display: none;">
				<div>작성자 : ${result.writer}</div>&emsp;&emsp;
				<div>내용 : <textarea rows="1" cols="50"  class="editcon">${fn:replace(result.reply, crcn, br)}</textarea></div>&emsp;&emsp;
				<div><button type="button" class="btnEditForm" seq="${result.seq}" >등록</button></div>
					<div><a href="">취소</a></div>
			</div>
			 <div class="myFlex" style="display: none;">
				<div>작성자 : ${sessionScope.userName }</div>&emsp;&emsp;
				<div>내용 : <textarea rows="1" cols="50"  class="insertcon">${fn:replace(result.reply, crcn, br)}</textarea></div>&emsp;&emsp;
				<div><button type="button" class="btnInForm" idx="${result.idx}" b_group="${result.bGroup}" b_order="${result.bOrder}"  b_depth="${result.bDepth}" >등록</button></div>
					<div><a href="">취소</a></div>
			</div>	
		</c:forEach>
		</div>
		<div id="paging">
			<ul class="pagination">
					<span class="badge">${paginationInfo.totalRecordCount}</span>
   				<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="page" />
   			</ul>
		</div>
		 <div class="well well-lg">
			 <form class="form-horizontal" id="form2" name="form2" method="post" action="reply.do">	
			 <div class="form-group">
			    <label class="control-label col-sm-2" for="pwd">작성자:</label>
			    <div class="col-sm-10 control-label" style="text-align:left;">
			      <input type="text" class="form-control" id="writer" name="writer" placeholder="입력 하세요" maxlength="10" style="float:left; width:30%"  value="${sessionScope.userName }">		   
			    </div>
			 </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="pwd">댓글</label>
			    <div class="col-sm-10">
			      <textarea class="form-control" rows="3" id="reply" name="reply" maxlength="300"></textarea>
			  	</div>
			  </div>
			  <button type="submit" class="btn btn-default" onclick="add();">작성</button>
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
function add2(aDepth,aOrder,aGroup){
	
	location.href = "<c:url value='/mgmt.do'/>?idx=${boardVO.idx}&aDepth="+aDepth;
}
function del(){
	
	if( !confirm("삭제하시겠습니까?") ){
		return;
	}
	document.form1.action = "<c:url value='/delete.do'/>";
	document.form1.submit();
}
function add(){
	if( $('#writer').val() == '' ){
		alert("작성자를 입력하세요");
		$('#writer').focus();
		return;
	}
	if( $('#reply').val() == '' ){
		alert("댓글을 입력하세요");
		$('#reply').focus();
		return;
	}
	
	if( !confirm("댓글을 작성하시겠습니까?") ){
		return;
	}
	
	document.form2.action = "<c:url value='/reply.do'/>?idx=${boardVO.idx}";
	document.form2.submit();
}

function redel(seq,idx){
	
	if( !confirm("삭제하시겠습니까?") ){
		return;
	}
	//console.log('seq:' + seq);
	location.href = "<c:url value='/dreply.do'/>?idx=${boardVO.idx}&seq="+seq;
}
$(document).on('click', '.btn-Insert', function () {
	let viewDiv = $(this).parent().parent();
	viewDiv.next().next().show();
	viewDiv.hide();
});

$(document).on('click', '.btn-Edit', function () {
	let viewDiv = $(this).parent().parent();
	viewDiv.next().show();
	viewDiv.hide();
});

/*댓글 수정*/
$(document).on('click', '.btnEditForm', function () {
	let editcon = $(this).parent().prev().find('.editcon').val();
	let seq = $(this).attr('seq');
	let idx = '${boardVO.idx}';

	$.ajax({
		 method: "POST",
		 url: "<c:url value='/edreply.do'/>",
		 data: { 
	
			 reply: editcon,
			 seq: seq,
			 idx: idx
	
		 }
	})
	.done(function( data ) {
	 	 console.log(data);
	 	 $('#commentList').html(data);
	});
});

/*답글 작성*/
$(document).on('click', '.btnInForm', function () {
	let insertcon = $(this).parent().prev().find('.insertcon').val();
	let uIdx = '${sessionScope.userName }';
	let idx = $(this).attr('idx');
	let b_depth = $(this).attr('b_depth');
	let b_order = $(this).attr('b_order');
	let b_group = $(this).attr('b_group');

	$.ajax({
		 method: "POST",
		 url: "<c:url value='/reinsert.do'/>",
		 data: { 
	
			 reply: insertcon,
			 writer: uIdx,
			 idx: idx,
			 bDepth: b_depth,
			 bOrder: b_order,
			 bGroup: b_group		 	 

		 }
	})
	.done(function( data ) {
	 	 console.log(data);
	 	 $('#commentList').html(data);
	});
});
function page(pageNo){
	location.href = "<c:url value='/view.do'/>?idx=${boardVO.idx}&pageIndex="+pageNo;
}

</script>	
</body>
</html>