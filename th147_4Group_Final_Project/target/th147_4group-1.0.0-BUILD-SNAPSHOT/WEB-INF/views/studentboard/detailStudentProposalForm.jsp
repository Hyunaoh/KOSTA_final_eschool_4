<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<!-- 게시판 전체 상자 -->
	<jsp:include page="../home/menu.jsp"></jsp:include>

	<div style="margin-top: 15%; margin-left: 10%">
		<form action="updateStudentProposal.do?s_nowPage=1">

			<!-- 번호 -->

			<h3 align="left"></h3>
			<h4>게시글 번호 : ${stVo.stNum} / 학년 : ${stVo.stGrade} / 반 :
				${stVo.stSchoolClass} / 작성자 : ${sessionScope.sessionID}</h4>
			<h4>작성 날짜 : ${stVo.stDate}</h4>
			<h4>조회수 : ${stVo.stHit}</h4>
			<!-- 건의사항 항목 -->

			<h3 align="left"></h3>
			<h4>
				건의사항 종류 : <input type="text" id="stCategoly" name="stCategoly"
					value="${stVo.stCategoly}">
			</h4>


			<!-- 건의사항 제목 -->

			<h4>
				제목 : <input type="text" id="stTitle" name="stTitle"
					value="${stVo.stTitle}">
			</h4>
			<!-- 작성자 -->

			<!-- 추후 매칭자 아이디 불러오기  -->


			<input type="hidden" value="${stVo.stNum}" id="stNum" name="stNum" />
			<h3 align="left"></h3>
			<h4>내용 :</h4>
			<textarea id="stMessage" name="stMessage" rows="10" cols="30">${stVo.stMessage}</textarea>
			<!-- 목록으로 가는 칸 -->
			<br /> <input type="button"
				onclick="window.location='studentProposalForm.do?s_pageNum=1'"
				value="목 록"> <input type="submit" value="수 정">
		</form>
	</div>
	
	<div style="margin-top: 15%; margin-left: 10%">
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>