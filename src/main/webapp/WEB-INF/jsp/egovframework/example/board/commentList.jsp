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
				<c:choose>
					<c:when test="${sessionScope.userName == result.writer }">
						<div><button type="button" style="display:show;" class="btn-Edit">수정</button></div>
					</c:when>
					<c:otherwise>
						<div><button type="button" style="display:none;" class="btn-Edit">수정</button></div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${sessionScope.userName == result.writer }">
						<div><button type="button" style="display:show;" class="btn-default" onclick="redel('${result.seq}',${result.idx});">삭제</button></div>
					</c:when>
					<c:otherwise>
						<div><button type="button" style="display:none;" class="btn-default" onclick="redel('${result.seq}',${result.idx});">삭제</button></div>
					</c:otherwise>
				</c:choose>
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