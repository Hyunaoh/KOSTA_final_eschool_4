<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../home/head.jsp"></jsp:include>
<body>
	<!-- 게시판 전체 상자 -->
	<jsp:include page="../home/menu.jsp"></jsp:include>

	<div style="margin-top: 15%; margin-left: 10%">
		<h1>학생게시판 건의사항</h1>
		<br />
		<form action="detailStudentProposal.do">
			<table style="width: 900px">
				<tr>
					<th><label>번호</label></th>
					<th><label>학년</label></th>
					<th><label>반</label></th>
					<th><label>게시글 제목</label></th>
					<th><label>글 내용</label></th>
					<th><label>작성 날짜</label></th>
					<th><label>작성자</label></th>
					<th><label>소분류</label></th>
					<th><label>조회수</label></th>
					<th><label>삭제</label></th>
					<th></th>
				</tr>

				<c:forEach var="sVo2" items="${ s_nowPage }" varStatus="status">
					<c:if test="${ status.index+1 eq param.s_pageNum }">
						<c:forEach var="sVo" items="${ sVo2.value }">
							<tr id="st_form_hidden" name="st_form_hidden">
								<th>${ sVo.stNum }</th>
								<th><input type="hidden" name="stGrade" id="stGrade"
									value="${ sVo.stGrade }">${ sVo.stGrade }학년</th>
								<th><input type="hidden" name="stSchoolClass"
									id="stSchoolClass" value="${ sVo.stSchoolClass }">${ sVo.stSchoolClass }반
								</th>
								<th><input type="hidden" name="stTitle" id="stTitle"
									class="st_form" value="${ sVo.stTitle }">${ sVo.stTitle }</th>
								<th><a href="detailStudentProposal.do?stNum=${ sVo.stNum }">
										<input type="hidden" name="stMessage" id="stMessage"
										value="${ sVo.stMessage }" placeholder="내용 입력">${ sVo.stMessage }
								</a></th>
								<th><input type="hidden" name="stDate" id="stDate"
									value="${ sVo.stDate }" />${ sVo.stDate }</th>
								<th><input type="hidden" name="stWriter" id="stWriter"
									placeholder="이름 입력" value="${ sVo.stWriter }" /></th>

								<th><input type="hidden" name="stCategoly" id="stCategoly"
									value="${ sVo.stCategoly }"> ${ sVo.stCategoly }</th>

								<th><input type="hidden" name="stHit" id="stHit"
									class="st_form" value="${ sVo.stHit }">${ sVo.stHit }</th>

								<th><a href="deleteStudentProposal.do?stNum=${ sVo.stNum }">
										<input type="button" value="삭제" />
								</a></th>
								<th></th>
							</tr>
						</c:forEach>
					</c:if>
				</c:forEach>
			</table>

			<br />
			<div align="center">

				<c:forEach var="s_page" items="${ s_pageList }" varStatus="status" begin="${ param.page_index_start }" end="${ param.page_index_end }">
					<c:if test="${ s_page % 5 == 1 && s_page != 1 }">
						<a href="studentProposalPro.do?page_index_start=${ param.page_index_start - 5 }&page_index_end=${ param.page_index_end - 5 }">
							◀ 이전</a>
					</c:if>
					<a href="studentProposalPro.do?s_pageNum=${ s_page }">${ s_page }</a>
					<%-- <c:set value="${ s_pageList[status.index] }" var="page" /> --%>
					<c:if test="${ s_page % 5 == 0 }">
						<a href="studentProposalPro.do?page_index_start=${ param.page_index_start + 5 }&page_index_end=${ param.page_index_end + 5 }">
							다음 ▶ </a>
					</c:if>
				</c:forEach>
				
			</div>

			<a href="insertStudentProposalForm.do"><input type="button" value="추가" /></a>

		</form>
			<br/>
		<div>
		
			<form action="searchPro.do">
				<select name="search" id="search" class="searchContext">
					<option value="cuGrade">학년</option>
					<option value="cuClass">반</option>
					<option value="cuMessage">내용</option>
					<option value="cuDate">날짜</option>
					<option value="cuName">이름</option>
					<option value="cuCategoly">카테고리</option>
					<option value="cuBungi">분기</option>
				</select> 
					<input type="text" name="searchText" id="searchText" placeholder="검색어를 입력하세요" required /> 
					<input type="submit" value="검색" />
			</form>
		</div>
	</div>

	<div style="margin-top: 15%; margin-left: 10%">
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>