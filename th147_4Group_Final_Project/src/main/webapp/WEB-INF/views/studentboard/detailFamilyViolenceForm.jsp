<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<!-- 게시판 전체 상자 -->
	<jsp:include page="../home/menu.jsp"></jsp:include>
	<!-- 전체 상자 div -->
	<div class="main" style="margin-top:15%;">
	<!-- 사이드바 -->
	<div class="left_bar" style="margin-left: 5%; margin-right: 50px;	 float:left">
	  <p class="studentboard" data-block-type="23" id="student_bar">학생마당</p>
	  <ul style="list-style:none; margin-left:-20px;" >
        <li><a href="${pageContext.request.contextPath}/studentboard/studentProposalPro.do?s_pageNum=1">건의사항</a></li>
        <li><a href="${pageContext.request.contextPath}/studentboard/schoolViolencePro.do?s_pageNum=1">학교폭력 상담</a></li>
      	<li><a href="${pageContext.request.contextPath}/studentboard/familyViolencePro.do?s_pageNum=1">가정폭력 상담</a></li>
      </ul>
	</div>	
		

	<div style="margin-left: 10%" align="left" style="width: 900px" class="table">
		<form action="updateFamilyViolence.do?s_nowPage=1">

			<!-- 번호 -->

			<h3 align="left"></h3>
			<h4>게시글 번호 : ${fvVo.fvNum} / 학년 : ${fvVo.fvGrade} / 반 :
				${fvVo.fvSchoolClass} / 작성자 : ${sessionScope.sessionID}</h4>
			<h4>작성 날짜 : ${fvVo.fvDate}</h4>
			<h4>조회수 : ${fvVo.fvHit}</h4>
			<!-- 건의사항 항목 -->

			<h3 align="left"></h3>
			<h4>
				건의사항 종류 : <input type="text" id="fvCategoly" name="fvCategoly"
					value="${fvVo.fvCategoly}">
			</h4>


			<!-- 건의사항 제목 -->

			<h4>
				제목 : <input type="text" id="fvTitle" name="fvTitle"
					value="${fvVo.fvTitle}">
			</h4>
			<!-- 작성자 -->

			<!-- 추후 매칭자 아이디 불러오기  -->


			<input type="hidden" value="${fvVo.fvNum}" id="fvNum" name="fvNum" />
			<h3 align="left"></h3>
			<h4>내용 :</h4>
			<textarea id="fvMessage" name="fvMessage" rows="10" cols="30">${fvVo.fvMessage}</textarea>
			<!-- 목록으로 가는 칸 -->
			<br /> <input type="button"
				onclick="window.location='familyViolenceForm.do?s_pageNum=1'"
				value="목 록"> 
				<input type="submit" value="수 정">
		</form>
	</div>
	</div>
	<div style="margin-top: 15%; margin-left: 10%">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>