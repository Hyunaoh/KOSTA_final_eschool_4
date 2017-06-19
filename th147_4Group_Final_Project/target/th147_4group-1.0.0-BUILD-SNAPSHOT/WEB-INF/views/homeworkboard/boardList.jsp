<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../home/menu.jsp"></jsp:include>

	<div id="content" style="margin-top: 15%; margin-left: 10%" >
			<h2>숙제 / 준비물</h2>

			<br/>
		<table style="width: 800px">
			<colgroup>
				<col width='8%' />
				<col width='40%' />
				<col width='10%' />
				<col width='30%' />
				<col width='5%' />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="listview" items="${listview}" varStatus="status">
					<c:url var="link" value="board1Read.do">
						<c:param name="hwNo" value="${listview.hwNo}" />
					</c:url>

					<tr>
						<td><c:out
								value="${pageVO.totRow-((pageVO.page-1)*pageVO.displayRowCount + status.index)}" />
						</td>


						<td><a href="${link}"><c:out value="${listview.hwTitle}" /></a></td>
						<td><c:out value="${listview.hwWriter}" /></td>
						<td><c:out value="${listview.hwYmd}" /></td>
						<td><c:out value="${listview.hwHit}" /></td>


					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${pageVO.totPage>1}">
			<div class="paging" align="center">
				<c:forEach var="i" begin="${pageVO.pageStart}"
					end="${pageVO.pageEnd}" step="1">
					<c:url var="pageLink" value="board1List.do">
						<c:param name="page" value="${i}" />
					</c:url>
					<c:choose>
						<c:when test="${i eq pageVO.page}">
							<c:out value="${i}" />
						</c:when>
						<c:otherwise>
							<a href="${pageLink}"><c:out value="${i}" /></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<br />
		</c:if>
		<div align="right" style="margin-right: 20%;">
				<a href="board1Form.do">글쓰기</a>
		</div>
	</div>

	<div style="margin-top: 15%; margin-left: 10%">
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>
