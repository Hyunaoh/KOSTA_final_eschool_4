<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>${boardNm }</title>
<script type="text/javascript">
	function check() {
		var form = document.getElementById("modifyForm");
		return true;
	}

	function goList() {
		var form = document.getElementById("listForm");
		form.submit();
	}

	function goView() {
		var form = document.getElementById("viewForm");
		form.submit();
	}
</script>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<!-- 전체구성 -->
	<div style=" box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.25);"> <!-- body에 해당 -->
	
	<!-- 게시판 전체 상자 -->
	<div>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	
	<!-- <!-- 전체 상자 div-->
	<div class="main" style="height:1100px;"> <!-- style="margin-top:2%;"-->
	
	<!-- 사이드바 -->
	<div class="Left_bar"style="margin-left: 3%; margin-right: 8%; margin-top:5%; float:left; height:1000px;" >
			<c:if test="${param.boardCd eq 'suggest' || param.boardCd eq 'counsel'}">
			<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"> <b>학부모 마당</b></font></p>
			<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
		       		<li class="side_li"><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=suggest"><font face="휴먼엽서체" size="3" color="black">건의사항</font></a></li>
		       		<li class="side_li"><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=counsel"><font face="휴먼엽서체" size="3" color="black">자녀상담</font></a></li>
	      	</ul>
			</c:if>
			<c:if test="${param.boardCd eq 'student' || param.boardCd eq 'vio' || param.boardCd eq 'vio2'}">
			<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"> <b>학생 마당</b></font></p>
				<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
		       		<li class="side_li"><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=student"><font face="휴먼엽서체" size="3" color="black">건의사항</font></a></li>
		       		<li class="side_li"><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=vio"><font face="휴먼엽서체" size="3" color="black">학교폭력</font></a></li>
		       		<li class="side_li"><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=vio2"><font face="휴먼엽서체" size="3" color="black">가정폭력</font></a></li>
		      	</ul>
			</c:if>
	</div>
	<div style="margin-top: 8%; margin-left: 10%">
		<div id="container" >
			<div id="content" >

				<!-- 본문 시작 -->
				<div class="board_header"style="margin-left: 10%; width: 80%; height:150px;	
			padding-left:3%;">
				<!-- 본문 시작 -->
				<div style="float: left;"><font size="10px"><br><b>${boardNm } 글 수정</b></font></div>
			<div style="float: left; ">
					<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/parentboard/parentboard_img.png" class="board_img" style="height: auto; width:100px; margin-top:15%; margin-left:30%; margin-top:60%; ">
			</div>
		</div>	
				
				<div id="bbs">
					<form id="modifyForm" action="modify.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
						<p style="margin: 0; padding: 0;">
							<input type="hidden" name="articleNo" value="${param.articleNo }" />
							<input type="hidden" name="boardCd" value="${param.boardCd }" />
							<input type="hidden" name="curPage" value="${param.curPage }" />
							<input type="hidden" name="searchWord" value="${param.searchWord }" />
						</p>
						<table id="write-form" class="table" style="width:80%;">
							<tr>
								<td>제목</td>
								<td><input type="text" name="title" size="50" value="${thisArticle.title }" /></td>
							</tr>
							<tr>
								<td colspan="2"><textarea name="content" rows="17" cols="100">${thisArticle.content }</textarea>
								</td>
							</tr>
							<tr>
								<td>파일첨부</td>
								<td><input type="file" name="upload" multiple /></td>
							</tr>
						</table>



						<div style="text-align: center; padding-bottom: 15px;">
							<input type="submit" value="전송" /> 
							<input type="button" value="상세보기" onclick="goView()" /> 
							<input type="button" value="목록" onclick="goList()" />
						</div>
					</form>

				</div>
				<!-- bbs 끝 -->
				<!--  본문 끝 -->
			</div>
			<!-- content 끝 -->
		</div>
		<!--  container 끝 -->

	</div>

	<div id="form-group" style="display: none;">
		<form id="listForm" action="list.do" method="get">
			<p>
				<input type="hidden" name="boardCd" value="${param.boardCd }" /> <input
					type="hidden" name="curPage" value="${param.curPage }" /> <input
					type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
		<form id="viewForm" action="view.do" method="get">
			<p>
				<input type="hidden" name="articleNo" value="${param.articleNo }" />
				<input type="hidden" name="boardCd" value="${param.boardCd }" />
				 <input type="hidden" name="curPage" value="${param.curPage }" />
				  <input type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
		</div>
		</div>
	
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<jsp:include page="../home/footer.jsp"></jsp:include>

</body>
</html>