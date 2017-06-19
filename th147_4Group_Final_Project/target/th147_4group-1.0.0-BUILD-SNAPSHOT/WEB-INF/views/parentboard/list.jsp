<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>${boardNm }</title>
<script type="text/javascript">
	function goList(page) {
		var form = document.getElementById("listForm");
		form.curPage.value = page;
		form.submit();
	}

	function goWrite() {
		var form = document.getElementById("writeForm");
		form.submit();
	}

	function goView(articleNo) {
		var form = document.getElementById("viewForm");
		form.articleNo.value = articleNo;
		form.submit();

	}
</script>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../home/menu.jsp"></jsp:include>

	<div id="content" style="margin-top: 15%; margin-left: 10%">

<%-- 		<div id="main-menu">
			<%@ include file="../inc/main-menu.jsp"%>
			</div> --%>

				<!-- 본문 시작 -->
				<h1>${ boardNm }</h1>
			
					<table style="width: 900px">
						<tr>
							<th>NO</th>
							<th>TITLE</th>
							<th>DATE</th>
							<th>HIT</th>
						</tr>
						<!--  반복 구간 시작 -->
						<c:forEach var="article" items="${list }" varStatus="status">
							<tr>
								<th>${no - status.index}</th>
								<!-- 게시물 내림차순 정렬 -->
								<th><a href="javascript:goView('${article.articleNo }')">${article.title }</a>
									<c:if test="${article.attachFileNum > 0 }">
										<img style="max-width: 2%; height: auto;" src="../resources/img/parentboard/paperclip.png" alt="첨부파일" />
									</c:if> 
									<c:if test="${article.commentNum > 0 }">
										<span class="bbs-strong">[${article.commentNum }]</span>
									</c:if></th>
								<th>${article.writeDate }</th>
								<th>${article.hit }</th>
							</tr>
						</c:forEach>
						<!--  반복 구간 끝 -->
					</table>

					<!--paging-->
					<div id="paging" style="text-align: center;">

						<c:if test="${prevLink > 0 }">
							<a href="javascript:goList('${prevPage }')">[이전]</a>
						</c:if>

						<c:forEach var="i" items="${pageLinks }" varStatus="stat">
							<c:choose>
								<c:when test="${curPage == i}">
									<span class="bbs-strong">${i }</span>
								</c:when>
								<c:otherwise>
									<a href="javascript:goList('${i }')">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${nextLink > 0 }">
							<a href="javascript:goList('${nextPage }')">[다음]</a>
						</c:if>

					</div>

					<div id="list-menu" style="margin: right;">
						<input type="button" value="새글쓰기" onclick="goWrite()" />
					</div>

					<div id="search" style="text-align: center;">
						<form id="searchForm" action="./list.do" method="get" style="margin: 0; padding: 0;">
							<p style="margin: 0; padding: 0;">
								<input type="hidden" name="boardCd" value="${boardCd }" /> 
								<input type="text" name="searchWord" size="15" maxlength="30" /> 
								<input type="submit" value="검색" />
							</p>
						</form>
					</div>

				</div>
				<!--  본문 끝 -->

			<!-- content 끝 -->
		<!--  container 끝 -->


<%-- 		<div id="footer">
			<jsp:include page="${pageContext.request.contextPath}/views/home/footer.jsp"></jsp:include>
			<%@ include file="../../../home/footer.jsp"%>
		</div> --%>


	<div id="form-group" style="display: none;">
		<form id="listForm" action="./list.do" method="get">
			<p>
				<input type="hidden" name="boardCd" value="${boardCd }" /> <input
					type="hidden" name="curPage" /> <input type="hidden"
					name="searchWord" value="${param.searchWord }" />
			</p>
		</form>

		<form id="writeForm" action="./write.do" method="get">
			<p>
				<input type="hidden" name="boardCd" value="${boardCd }" /> <input
					type="hidden" name="curPage" value="${curPage }" /> <input
					type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>

		<form id="viewForm" action="./view.do" method="get">
			<p>
				<input type="hidden" name="articleNo" /> <input type="hidden"
					name="boardCd" value="${boardCd }" /> <input type="hidden"
					name="curPage" value="${curPage }" /> <input type="hidden"
					name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
	<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
	<%-- param.curPage : ${param.curPage }, ${curPage } --%>
	
</body>
</html>