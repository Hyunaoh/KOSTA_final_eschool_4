<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
<title>${boardNm }</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $(".btn1").click(function(){
        $('.comments').slideUp();
    });
    $(".btn2").click(function(){
        $('.comments').slideDown();
    });
});
</script>

<script type="text/javascript">
	function goBack(){
		window.history.go(-1)
	}

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
		var chk = confirm("정말로 첨부파일을 삭제하시겠습니까?");
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
	
	function del(){
		var articleNo = $("#articleNo").attr('value');
		var boardCd = $("#boardCd").attr('value');
		var curPage = $("#curPage").attr('value');
		var searchWord = $("#searchWord").attr('value');
		
		if(confirm('삭제를 진행하겠습니까?')) {
			window.location.href="delete.do?articleNo="+articleNo +"&boardCd="+boardCd+"&curPage="+curPage+"&searchWord="+searchWord; 
		   	alert("${param.articleNo}번글 삭제완료");
		} else {
		    window.history.go(-1)
		}
	}

	function update(){
		var articleNo = $("#articleNo").attr('value');
		var boardCd = $("#boardCd").attr('value');
		var curPage = $("#curPage").attr('value');
		var searchWord = $("#searchWord").attr('value');
		
		if(confirm('수정을 진행하겠습니까?')) {
			window.location.href="modify.do?articleNo="+articleNo +"&boardCd="+boardCd+"&curPage="+curPage+"&searchWord="+searchWord;
		} else {
		    window.history.go(-1)
		}
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
	<div class="main" style="height:1300px;"> <!-- style="margin-top:2%;"-->
	
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
			<div id="bbs" class="table">
			<table class="table" style="width:80%;">
				<tr>
					<%-- 작성일 : ${thisArticle.writeDateTime }&nbsp;&nbsp;&nbsp;&nbsp; --%>
					<td>등록일 : <fmt:formatDate value="${thisArticle.regdate }" pattern="yy-MM-dd (E) HH:mm:ss"/></td>
					<td>작성자 : ${thisArticle.name } (${thisArticle.writer })</td> 
					<td>이메일 : ${thisArticle.email}</td>
				</tr>
				<tr>
					<td colspan="2">글제목 : ${thisArticle.title }</td>
					<td>조회수 : ${thisArticle.hit }</td>
				</tr>
				<tr>
					<td colspan="3">IP : ${thisArticle.regip}</td>					
				</tr>
			
				<!-- <div id="gul-content"> -->
				<tr>
					<td colspan="3">${thisArticle.htmlContent }</td>
				</tr>
				<tr>
					<td colspan="3">
						<p id="file-list" ><!-- style="text-align: right;" -->
							<c:forEach var="file" items="${attachFileList }" varStatus="status">
								 <img style="max-width: 3%; height: auto;" src="../resources/img/parentboard/archive.png" alt="첨부파일" />
								 <a href="javascript:download('${file.filename }')">${file.filename }</a> (${file.filetype}) / ${file.filesize} KB
								 <c:if test="${file.uploader eq sessionScope.id }"> <!-- 첨부파일 삭제 유효성 검사 (작성자만 버튼 보이기) -->&nbsp;&nbsp;
								 	<img style="max-width: 3%; height: auto;" alt="삭제 버튼" src="../resources/img/parentboard/tag-delete.png"
									onclick="deleteAttachFile('${file.attachFileNo }')">
								 </c:if>	
								<br/>
								<%-- <img alt="게시글 첨부 이미지 보기" src="c:/app/upload/${file.filename }"> --%>
								<!-- jpg, png, gif 파일은 미리보기 설정 -->
								<c:if test="${file.filetype eq 'image/jpeg' || file.filetype eq 'image/png' || file.filetype eq 'image/gif'}">
									<img alt="게시글 첨부 이미지 보기" src="${pageContext.request.contextPath}/resources/img/parentboard/upload/${file.filename }" width="500"; height="auto"; /><br><br>
								</c:if>
							</c:forEach>
						</p>
					</td>
				</tr>
				<!-- </div> -->
				

				<!-- 유효성 검사 -->                                                                         
				<tr>
					<td>
						<!--작성자와 동일 id만 버튼활성화(수정,삭제)  -->
						<c:if test="${thisArticle.writer eq sessionScope.id }"> 
								<label id="articleNo" value="${param.articleNo  }"></label>                                                 
								<label id="boardCd" value="${param.boardCd }"></label>
								<label id="curPage" value="${param.curPage }"></label>
								<label id="searchWord" value="${param.searchWord }"></label>
					</td>
					<td>			
								<input type="button" class="btn btn-default" value="수정" onclick="update()">
								<input type="button" class="btn btn-default" value="삭제" onclick="del()">
						</c:if>
						<input type="button" class="btn btn-default" value="목록" onclick="goList('${param.curPage }')" /> 
						<input type="button" class="btn btn-default" value="뒤로가기" onclick="goBack()"/>
					</td>
				</tr>
				</table>
				<hr>
				
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
				<hr>
				
				<button class="btn btn-default" >댓글 닫기</button>
				<button class="btn btn-default" >댓글 보기</button>
				
				<!--  덧글 반복 시작 -->
				<div class="comments">
				<h2>댓글</h2>
				<c:forEach var="comment" items="${commentList }" varStatus="status">
					<div style="font-weight: bold;">
						등록일 : <fmt:formatDate value="${comment.regdate }" pattern="yy-MM-dd (E) HH:mm:ss"/>&nbsp;&nbsp;&nbsp;&nbsp;
						작성자 : ${comment.uname } (${comment.user})&nbsp;&nbsp;&nbsp;&nbsp;
						이메일 : ${comment.email}&nbsp;&nbsp;&nbsp;&nbsp;
						IP : ${comment.uip}&nbsp;&nbsp;&nbsp;&nbsp;
						<%-- <h5>${comment.regdate }</h5> --%>
						<br>
						
						<!-- 유효성 검사 작성자만 버튼 보이게 하기 (수정, 삭제) -->
						 <c:if test="${comment.user eq sessionScope.id }"> 
						<h6>
							<a href="javascript:updateComment('${comment.commentNo }')">수정</a>
							<a href="javascript:deleteComment('${comment.commentNo }')">삭제</a>
						</h6>
						</c:if>
						<p id="comment${comment.commentNo }">${comment.htmlMemo }</p>
						<hr>
						
						<div class="modify-comment">
							<form id="modifyCommentForm${comment.commentNo }"
								action="commentUpdate.do" method="post" style="display: none;">
								<p>
									<input type="hidden" name="commentNo" value="${comment.commentNo }" />
									<input type="hidden" name="boardCd" value="${param.boardCd }" /> 
									<input type="hidden" name="articleNo" value="${param.articleNo }" />
									<input type="hidden" name="curPage" value="${param.curPage }" />
									<input type="hidden" name="searchWord" 	value="${param.searchWod }" />
								</p>
								<div class="fr">
									<a href="javascript:document.forms.modifyCommentForm${comment.commentNo }.submit()">수정입력</a> 
									<a href="javascript:updateComment('${comment.commentNo }')">취소하기</a>
								</div>
								<div>
									<textarea class="modify-comment-ta" name="memo" rows="20" cols="50">${comment.memo }</textarea>
								</div>
							</form>
						</div>
					</div>
				</c:forEach>
				</div>

				<!--  덧글 반복 끝 -->

				<form id="addCommentForm" action="commentAdd.do" method="post">
					<p style="margin: 0; padding: 0;">
						<input type="hidden" name="articleNo" value="${param.articleNo }" />
						<input type="hidden" name="boardCd" value="${param.boardCd }" />
						<input type="hidden" name="curPage" value="${param.curPage }" />
						<input type="hidden" name="searchWord" value="${param.searchWord }" />
						<input type="hidden" name="uip"  value="${ sessionScope.ip }" />
						<input type="hidden" name="user"  value="${ sessionScope.id  }" />
						<input type="hidden" name="email"  value="${ sessionScope.email  }" />
						<input type="hidden" name="uname"  value="${ sessionScope.name  }" />
					</p>
					<div id="addComment">
						<textarea name="memo" rows="4" cols="60" placeholder="댓글을 작성하세요" ></textarea>
					</div>
					<div style="text-align: left:;">
						<input type="submit" class="btn btn-default" value="댓글쓰기" />
					</div>
				</form>
				<hr>
				
				<input type="button" class="btn btn-default" value="맨위로" onClick="javascript:window.scrollTo(0,0)" /><br><br>
				
				<h3>게시글 수 : &lt; ${totalRecord} &gt; </h3>
				<div style="float:left; width:80%;">
				<table  class="table">
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
						<td>
							<c:choose>
									<c:when test="${param.articleNo == article.articleNo }">
										${no - status.index }
										<img style="max-width: 7%; height: auto;" src="../resources/img/parentboard/checkmark.png" alt="현재글" />
									</c:when>
											<c:otherwise>
										     ${no - status.index }
										    </c:otherwise>
								</c:choose>
						</td>
						<td>
								<a href="javascript:goView('${article.articleNo }')">${article.title }</a>
								<c:if test="${article.commentNum > 0 }">
									<span style="color: red">[${article.commentNum }]</span>
								</c:if> &nbsp;&nbsp;
								<c:if test="${article.attachFileNum > 0 }">
									<img style="max-width: 6%; height: auto;"	src="../resources/img/parentboard/archive.png"	alt="첨부파일" />
								</c:if> 
							</td>
							<td>${article.writeDate }</td>
							<td>${article.name }(${article.writer } )</td>
							<td>${article.hit }</td>
						</tr>
					</c:forEach>
					<!--  반복 구간 끝 -->
				</table>

				<!--paging-->
				<div id="paging" style="text-align: center;">

					<c:if test="${prevLink > 0 }">
						<a href="javascript:goList('${firstPage }')">[이전]</a>
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
						<a href="javascript:goList('${lastPage }')">[다음]</a>
					</c:if>
				</div>

				<div id="list-menu" style="text-align: left;">
					<input type="button" value="글작성" class="btn btn-default" onclick="goWrite()" />
				</div>
				<hr>
				<div id="search" style="text-align: center;">
					<form id="searchForm" action="./list.do" method="get"	style="margin: 0; padding: 0;">
						<p style="margin: 0; padding: 0;">
							<input type="hidden" name="boardCd" value="${param.boardCd }" />
							<input type="text" name="searchWord" size="15" maxlength="30" placeholder="제목 & 내용 입력"/>
							<input type="submit" value="검색" class="btn btn-default" />
						</p>
					</form>
				</div>
				</div>
			</div>
			<!-- Div End -->
			<!--  본문 끝 -->

		</div>
		<!-- content 끝 -->
	</div>
	<!--  container 끝 -->

	</div>

		<form id="downForm" action="./download.do" method="post">
			<p>
				<input type="hidden" name="filename">
			<p>
		</form>

		<form id="listForm" action="./list.do" method="get">
			<p>
				<input type="hidden" name="boardCd" value="${param.boardCd }" /> 
				<input	type="hidden" name="curPage" /> 
				<input type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>

		<form id="writeForm" action="./write.do" method="get">
			<p>
				<input type="hidden" name="boardCd" value="${param.boardCd }" />
			</p>
		</form>

		<form id="viewForm" action="./view.do" method="get">
			<p>
				<input type="hidden" name="articleNo" /> 
				<input type="hidden" name="boardCd" value="${param.boardCd }" /> 
				<input type="hidden" name="curPage" value="${param.curPage }" /> 
				<input type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>

		<form id="modifyForm" action="./modify.do" method="post">
			<p>
				<input type="hidden" name="articleNo" value="${param.articleNo }" />
				<input type="hidden" name="boardCd" value="${param.boardCd }" /> 
				<input type="hidden" name="curPage" value="${param.curPage }" /> 
				<input type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>

		<form id="deleteForm" action="./delete.do" method="post">
			<p>
				<input type="hidden" name="articleNo" value="${param.articleNo }" />
				<input type="hidden" name="boardCd" value="${param.boardCd }" />
				<input type="hidden" name="curPage" value="${param.curPage }" /> 
				<input type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>

		<form id="deleteAttachFileForm" action="attachFileDel.do" 	method="post">
			<p>
				<input type="hidden" name="attachFileNo" /> 
				<input type="hidden" name="articleNo" value="${param.articleNo }" /> 
				<input type="hidden" name="boardCd" value="${param.boardCd }" /> 
				<input type="hidden" name="curPage" value="${param.curPage }" />
				<input type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
		<form id="deleteCommentForm" action="commentDel.do" method="post">
			<p>
				<input type="hidden" name="commentNo" /> 
				<input type="hidden" name="articleNo" value="${param.articleNo }" /> 
				<input type="hidden" name="boardCd" value="${param.boardCd }" /> 
				<input type="hidden" name="curPage" value="${param.curPage }" />
				<input type="hidden" name="searchWord" value="${param.searchWord }" />
			</p>
		</form>
	</div>
	
	<div>
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>