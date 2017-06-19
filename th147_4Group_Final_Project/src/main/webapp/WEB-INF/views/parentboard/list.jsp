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
	<!-- 전체구성 -->
	<div style="height:1100px; box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.25);"> <!-- body에 해당 -->
	
	<!-- 게시판 전체 상자 -->
	<div>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	
	<!-- <!-- 전체 상자 div-->
	<div class="main"> <!-- style="margin-top:2%;"-->
	
	<!-- 사이드바 -->
	<div class="Left_bar"style="margin-left: 3%; margin-right: 8%; margin-top:5%; float:left; height:1000px;" >
			<c:if test="${boardCd eq 'suggest' || boardCd eq 'counsel'}">
			<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"> <b>학부모 마당</b></font></p>
			<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
		       		<li class="side_li"><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=suggest"><font face="휴먼엽서체" size="3" color="black">건의사항</font></a></li>
		       		<li class="side_li"><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=counsel"><font face="휴먼엽서체" size="3" color="black">자녀상담</font></a></li>
	      	</ul>
			</c:if>
			<c:if test="${boardCd eq 'student' || boardCd eq 'vio' || boardCd eq 'vio2'}">
			<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"> <b>학생 마당</b></font></p>
				<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
		       		<li class="side_li"><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=student"><font face="휴먼엽서체" size="3" color="black">건의사항</font></a></li>
		       		<li class="side_li"><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=vio"><font face="휴먼엽서체" size="3" color="black">학교폭력</font></a></li>
		       		<li class="side_li"><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=vio2"><font face="휴먼엽서체" size="3" color="black">가정폭력</font></a></li>
		      	</ul>
			</c:if>
	</div>
	<div id="content" style="margin-top: 8%; margin-left: 10%">

				<!-- 본문 시작 -->
		<div class="board_header"style="margin-left: 10%; width: 80%; height:150px;	
			padding-left:3%;">
				<!-- 본문 시작 -->
				<div style="float: left;"><font size="10px"><br><b>${ boardNm }</b></font></div>
			<div style="float: left; ">
					<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/parentboard/parentboard_img.png" class="board_img" style="height: auto; width:100px; margin-top:15%; margin-left:30%; margin-top:60%; ">
			</div>
		</div>	
				<div style="width:800px; text-align:right; float:left;">게시글 수 : &lt; ${totalRecord} &gt;</div>
				<br>
					<table  class="table" style="width: 800px">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
						<!--  반복 구간 시작 -->
						<c:forEach var="article" items="${list }" varStatus="status">
							<tr>
								<td>${no - status.index}</td>
								<!-- 게시물 내림차순 정렬 -->
								<td><a href="javascript:goView('${article.articleNo }')">${article.title }</a>
									<c:if test="${article.commentNum > 0 }">
										<span style="color: red">[${article.commentNum }]</span>
									</c:if>&nbsp;&nbsp;
									
									<c:if test="${article.attachFileNum > 0 }">
										<img style="max-width: 3%; height: auto;" src="../resources/img/parentboard/archive.png" alt="첨부파일" />
									</c:if> 
								</td>
								<td>${article.writeDate }</td>
								<td>${article.name } (${article.writer }) </td>
								<td>${article.hit }</td>
							</tr>
						</c:forEach>
						<!--  반복 구간 끝 -->
					</table>

					<!--paging-->
					<div id="paging" style="text-align: center;">

						<c:if test="${prevLink > 0 }">
							<a href="javascript:goList('${firstPage - 1 }')">[이전]</a>
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
							<a href="javascript:goList('${lastPage +1 }')">[다음]</a>
						</c:if>

					</div>

					<div id="list-menu" style="margin: right;">
						<input type="button" value="글작성" onclick="goWrite()" />
					</div>
					<br><br>
					<div id="search" style="text-align: center;">
						<form id="searchForm" action="./list.do" method="get" style="margin: 0; padding: 0;">
							<p style="margin: 0; padding: 0;">
								<input type="hidden" name="boardCd" value="${boardCd }" /> 
								<input type="text" name="searchWord" size="15" maxlength="30" placeholder="제목 & 내용 검색" /> 
								<input type="submit" value="검색" />
							</p>
						</form>
					</div>

				</div>
				<!--  본문 끝 -->

			<!-- content 끝 -->
			
		<!--  container 끝 -->

	<div id="form-group" style="display: none;">
		<form id="listForm" action="./list.do" method="get">
			<p>
				<input type="hidden" name="boardCd" value="${boardCd }" /> 
				<input type="hidden" name="curPage" />
				 <input type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>

		<form id="writeForm" action="./write.do" method="get">
			<p>
				<input type="hidden" name="boardCd" value="${boardCd }" /> 
				<input type="hidden" name="curPage" value="${curPage }" /> 
				<input type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>

		<form id="viewForm" action="./view.do" method="get">
			<p>
				<input type="hidden" name="articleNo" /> 
				<input type="hidden" name="boardCd" value="${boardCd }" /> 
				<input type="hidden" name="curPage" value="${curPage }" /> 
				<input type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
		</div>
		</div>
		</div>
	<div>	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>