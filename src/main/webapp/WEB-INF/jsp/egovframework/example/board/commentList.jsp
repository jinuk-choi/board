<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<div id="commentList">
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<div class="well well-sm">
				<c:out value="${result.writer}"/> / <c:out value="${result.indate}"/>
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
				<div>작성자 : ${result.writer}</div>&emsp;&emsp;
				<div>내용 : <textarea rows="1" cols="50"  class="insertcon">${fn:replace(result.reply, crcn, br)}</textarea></div>&emsp;&emsp;
				<div><button type="button" class="btnInForm" idx="${result.idx}" >등록</button></div>
					<div><a href="">취소</a></div>
			</div>	
		</c:forEach>
</div>