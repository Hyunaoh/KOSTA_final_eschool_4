<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>${boardNm }</title>
<script type="text/javascript">
	function check() {
		var form = document.getElementById("writeForm");
		//유효성 검사로직 추가
		return true;
	}

	function goList() {
		var form = document.getElementById("listForm");
		form.submit();
	}
</script>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="../home/menu.jsp"></jsp:include>
	<div style="margin-top: 15%; margin-left: 20%">

		<%-- <div id="main-menu">
			<%@ include file="../inc/main-menu.jsp"%>
		</div> --%>

		<div id="content" style="min-height: 800px;">
			<div id="url-navi">BBS</div>

			<!-- 본문 시작 -->
			<h4>${boardNm }</h4>
			<div id="bbs">
				<h2>글쓰기</h2>
				<form id="writeForm" action="write.do" method="post"
					enctype="multipart/form-data" onsubmit="return check()">
					<p style="margin: 0; padding: 0;">
						<input type="hidden" name="boardCd" value="${param.boardCd }" />
					</p>
					<table id="write-form">
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" size="50" /></td>
						</tr>
						<tr>
							<td ><textarea name="content" rows="17"></textarea></td>
						</tr>
						<tr>
							<td><img style="max-width: 5%; height: auto;" alt="파일첨부"
								src="../resources/views/img/parentboard/upload.png"> 파일올리기<br>
								<input type="file" name="upload" multiple /></td>
						</tr>
					</table>
					<div style="text-align: center; padding-bottom: 15px;">
						<input type="submit" value="전송" /> <input type="button"
							value="목록" onclick="goList()" />
					</div>
				</form>
			</div>
			<!-- bbs 끝 -->
			<!--  본문 끝 -->

		</div>
		<!-- content 끝 -->
	</div>
	<!--  container 끝 -->


	<div id="form-group" style="display: none;">
		<form id="listForm" action="list.do" method="get">
			<p>
				<input type="hidden" name="boardCd" value="${param.boardCd }" />
			</p>
		</form>
	</div>

	<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>
