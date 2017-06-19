<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>${boardNm }</title>
<script type="text/javascript">
	function download(filename) {
		var form = document.getElementById("downForm")
		form.filename.value = filename;
		form.submit();
	}

	function deleteComment(commentNo) {
		var chk = confirm("정말로 삭제하시겠습니까?");
		if (chk == true) {
			var form = document.getElementById("deleteCommentForm");
			form.commentNo.value = commentNo;
			form.submit();
		}
	}

	function updateComment(no) {
		var commentno = "comment" + no;
		var formno = "modifyCommentForm" + no;
		var pele = document.getElementById(commentno);
		var formele = document.getElementById(formno);
		var pdisplay;
		var formdisplay;
		if (pele.style.display) {
			pdisplay = '';
			formdisplay = 'none';
		} else {
			pdisplay = 'none';
			formdisplay = '';
		}
		pele.style.display = pdisplay;
		formele.style.display = formdisplay;
	}

	function deleteAttachFile(attachFileNo) {
		var chk = confirm("정말로 삭제하시겠습니까?");
		if (chk == true) {
			var form = document.getElementById("deleteAttachFileForm");
			form.attachFileNo.value = attachFileNo;
			form.submit();
		}
	}

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
	function goModify() {
		var form = document.getElementById("modifyForm");
		form.submit();

	}
	function goDelete() {
		var form = document.getElementById("deleteForm");
		form.submit();

	}
</script>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="../home/menu.jsp"></jsp:include>

<div style="margin-top: 10%; margin-left: 20%">
	<div id="content">
		<div id="content" style="min-height: 800px;">
			<!-- 본문 시작 -->
			<h1>${boardNm }</h1>
			<div id="bbs">
				<table>
					<tr>
						<th style="width: 50px;">TITLE</th>
						<th style="text-align: left; color: #555;">${thisArticle.title }</th>
						<th style="width: 50px;">DATE</th>
						<th style="width: 130px; color: #555;">${thisArticle.writeDateTime }</th>
					</tr>
				</table>

				<div id="gul-content">
					<h6>작성자 ${thisArticle.email }, 조회수 ${thisArticle.hit }</h6>
					<p>${thisArticle.htmlContent }</p>
					<p id="file-list" style="text-align: right;">
						<c:forEach var="file" items="${attachFileList }"
							varStatus="status">
							<a href="javascript:download('${file.filename }')">${file.filename }</a>
							<img style="max-width: 4%; height: auto;" alt="삭제 버튼"
								src="../resources/img/parentboard/tag-delete.png"
								onclick="deleteAttachFile('${file.attachFileNo }')">
							<br />
						</c:forEach>
					</p>
				</div>

				<!--  덧글 반복 시작 -->
				<c:forEach var="comment" items="${commentList }" varStatus="status">
					<div class="comments">
						<h4>${comment.email }</h4>
						<h5>${comment.regdate }</h5>
						<h6>
							<a href="javascript:updateComment('${comment.commentNo }')">수정</a>
							| <a href="javascript:deleteComment('${comment.commentNo }')">삭제</a>
						</h6>
						<p id="comment${comment.commentNo }">${comment.htmlMemo }</p>

						<div class="modify-comment">
							<form id="modifyCommentForm${comment.commentNo }"
								action="commentUpdate.do" method="post" style="display: none;">
								<p>
									<input type="hidden" name="commentNo"
										value="${comment.commentNo }" /> <input type="hidden"
										name="boardCd" value="${param.boardCd }" /> <input
										type="hidden" name="articleNo" value="${param.articleNo }" />
									<input type="hidden" name="curPage" value="${param.curPage }" />
									<input type="hidden" name="searchWord"
										value="${param.searchWod }" />
								</p>
								<div class="fr">
									<a
										href="javascript:document.forms.modifyCommentForm${comment.commentNo }.submit()">수정하기</a>
									| <a href="javascript:updateComment('${comment.commentNo }')">취소</a>
								</div>
								<div>
									<textarea class="modify-comment-ta" name="memo" rows="7"
										cols="50">${comment.memo }</textarea>
								</div>
							</form>
						</div>
					</div>
				</c:forEach>
				<!--  덧글 반복 끝 -->

				<form id="addCommentForm" action="commentAdd.do" method="post">
					<p style="margin: 0; padding: 0;">
						<input type="hidden" name="articleNo" value="${param.articleNo }" />
						<input type="hidden" name="boardCd" value="${param.boardCd }" />
						<input type="hidden" name="curPage" value="${param.curPage }" />
						<input type="hidden" name="searchWord"
							value="${param.searchWord }" />
					</p>
					<div id="addComment">
						<textarea name="memo" rows="7" cols="50"></textarea>
					</div>
					<div style="text-align: right;">
						<input type="submit" value="덧글남기기" />
					</div>
				</form>



				<div id="next-prev">
					<c:if test="${nextArticle != null }">
						<p>
							다음글 : <a href="javascript:goView('${nextArticle.articleNo }')">${nextArticle.title }</a>
						</p>
					</c:if>
					<c:if test="${prevArticle != null }">
						<p>
							이전글 : <a href="javascript:goView('${prevArticle.articleNo }')">${prevArticle.title }</a>
						</p>
					</c:if>
				</div>

				<div id="view-menu">
					<div class="fl">
						<input type="button" value="수정" onclick="goModify()" /> <input
							type="button" value="삭제" onclick="goDelete()" />
					</div>
					<div class="fr">
						<input type="button" value="목록"
							onclick="goList('${param.curPage }')" /> <input type="button"
							value="새글쓰기" onclick="goWrite()" />
					</div>
				</div>

				<table>
					<tr>
						<th style="width: 60px;">NO</th>
						<th>TITLE</th>
						<th style="width: 84px;">DATE</th>
						<th style="width: 60px;">HIT</th>
					</tr>
					<!--  반복 구간 시작 -->
					<c:forEach var="article" items="${list }" varStatus="status">
						<tr>
							<td style="text-align: center;"><c:choose>
									<c:when test="${param.articleNo == article.articleNo }">
										<img style="max-width: 35%; height: auto;"
											src="../resources/img/parentboard/checkmark.png" alt="현재글" />
									</c:when>
									<c:otherwise>
	     ${no - status.index }
	    </c:otherwise>
								</c:choose></td>
							<td><a href="javascript:goView('${article.articleNo }')">${article.title }</a>
								<c:if test="${article.attachFileNum > 0 }">
									<img style="max-width: 3%; height: auto;"
										src="../resources/img/parentboard/paperclip.png"
										alt="첨부파일" />
								</c:if> <c:if test="${article.commentNum > 0 }">
									<span class="bbs-strong">[${article.commentNum }]</span>
								</c:if></td>
							<td style="text-align: center;">${article.writeDate }</td>
							<td style="text-align: center;">${article.hit }</td>
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
							<c:when test="${param.curPage == i}">
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

				<div id="list-menu" style="text-align: right;">
					<input type="button" value="새글쓰기" onclick="goWrite()" />
				</div>

				<div id="search" style="text-align: center;">
					<form id="searchForm" action="./list.do" method="get"
						style="margin: 0; padding: 0;">
						<p style="margin: 0; padding: 0;">
							<input type="hidden" name="boardCd" value="${param.boardCd }" />
							<input type="text" name="searchWord" size="15" maxlength="30" />
							<input type="submit" value="검색" />
						</p>
					</form>
				</div>




			</div>
			<!-- Div End -->
			<!--  본문 끝 -->

		</div>
		<!-- content 끝 -->
	</div>
	<!--  container 끝 -->

	</div>

	<div id="form-group" style="display: none;">
		<form id="downForm" action="./download.do" method="post">
			<p>
				<input type="hidden" name="filename">
			<p>
		</form>

		<form id="listForm" action="./list.do" method="get">
			<p>
				<input type="hidden" name="boardCd" value="${param.boardCd }" /> <input
					type="hidden" name="curPage" /> <input type="hidden"
					name="searchWord" value="${param.searchWord }" />
			</p>
		</form>

		<form id="writeForm" action="./write.do" method="get">
			<p>
				<input type="hidden" name="boardCd" value="${param.boardCd }" />
			</p>
		</form>

		<form id="viewForm" action="./view.do" method="get">
			<p>
				<input type="hidden" name="articleNo" /> <input type="hidden"
					name="boardCd" value="${param.boardCd }" /> <input type="hidden"
					name="curPage" value="${param.curPage }" /> <input type="hidden"
					name="searchWord" value="${param.searchWord }" />
			</p>
		</form>

		<form id="modifyForm" action="./modify.do" method="get">
			<p>
				<input type="hidden" name="articleNo" value="${param.articleNo }" />
				<input type="hidden" name="boardCd" value="${param.boardCd }" /> <input
					type="hidden" name="curPage" value="${param.curPage }" /> <input
					type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>

		<form id="deleteForm" action="./delete.do" method="post">
			<p>
				<input type="hidden" name="articleNo" value="${param.articleNo }" />
				<input type="hidden" name="boardCd" value="${param.boardCd }" /> <input
					type="hidden" name="curPage" value="${param.curPage }" /> <input
					type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>

		<form id="deleteAttachFileForm" action="attachFileDel.do"
			method="post">
			<p>
				<input type="hidden" name="attachFileNo" /> <input type="hidden"
					name="articleNo" value="${param.articleNo }" /> <input
					type="hidden" name="boardCd" value="${param.boardCd }" /> <input
					type="hidden" name="curPage" value="${param.curPage }" /> <input
					type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
		<form id="deleteCommentForm" action="commentDel.do" method="post">
			<p>
				<input type="hidden" name="commentNo" /> <input type="hidden"
					name="articleNo" value="${param.articleNo }" /> <input
					type="hidden" name="boardCd" value="${param.boardCd }" /> <input
					type="hidden" name="curPage" value="${param.curPage }" /> <input
					type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>


		<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>