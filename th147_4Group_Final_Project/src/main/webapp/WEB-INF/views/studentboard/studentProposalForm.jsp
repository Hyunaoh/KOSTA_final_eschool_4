<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../home/head.jsp"></jsp:include>
<body>
	<!-- 전체구성 -->
	<div style="height:1100px; box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.25);"> <!-- body에 해당 -->
	
	<!-- 게시판 전체 상자 -->
	<div>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	
	<!-- 전체 상자 div-->
	<div class="main"><!-- style="margin-top:2%;"	--> 
	
	<!-- 사이드바 -->
	<div class="Left_bar"style="margin-left: 3%; margin-right: 8%; margin-top:5%; float:left; height:1000px;" >
	<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"> <b>학생마당</b></font></p>
		<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
       		<li class="side_li"><a href="${pageContext.request.contextPath}/studentboard/studentProposalPro.do?s_pageNum=1"><font face="휴먼엽서체" size="3" color="black">건의사항</font></a></li>
       		<li class="side_li"><a href="${pageContext.request.contextPath}/studentboard/schoolViolencePro.do?s_pageNum=1"><font face="휴먼엽서체" size="3" color="black">학교폭력</font></a></li>
       		<li class="side_li"><a href="${pageContext.request.contextPath}/studentboard/familyViolencePro.do?s_pageNum=1"><font face="휴먼엽서체" size="3" color="black">가정폭력</font></a></li>
      	</ul>
	</div>

	<div style=" margin-left: 10%; margin-top: 8%; "><!-- -->
		<div class="board_header"style="margin-left: 10%; width: 80%; height:150px;	
				padding-left:3%;"> <!-- border-radius:5%; background-color:#dafffd;  그림자  box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.25); --> 
			<!-- <div style="width:40%;"> -->
			<div style="float: left;"><font size="10px"><br><b>학생게시판 건의사항</b> </font></div>	
			
			<div style="float: left; ">
				<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/board/studentboard/b_1.gif" class="board_img" 
				style="height: auto; width:130px; margin-top:15%; margin-left:30%; ">  <!-- border-radius:0.81rem; box-shadow: 0px 2px 8px 0px rgba(0,0,0,.25); -->
			</div>
			
		</div>

	</div>
	<div style="margin-left: 10%">
		<br />
		<form action="detailStudentProposal.do">
			<table style="width: 900px;" class="table">
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
										<input type="button" value="삭제" class="btn btn-default"/>
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
					<a href="studentProposalPro.do?s_pageNum=${ s_page }&page_index_start=${ param.page_index_start }&page_index_end=${ param.page_index_end}">${ s_page }</a>
					<%-- <c:set value="${ s_pageList[status.index] }" var="page" /> --%>
					<c:if test="${ s_page % 5 == 0 }">
						<a href="studentProposalPro.do?page_index_start=${ param.page_index_start + 5 }&page_index_end=${ param.page_index_end + 5 }">
							다음 ▶ </a>
					</c:if>
				</c:forEach>
				
			</div>

			<a href="insertStudentProposalForm.do"><input type="button" value="추가" class="btn btn-default"/></a>

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
					<input type="submit" class="btn btn-default" value="검색" />
			</form>
		</div>
	</div>
	</div>
	</div>
	<div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>