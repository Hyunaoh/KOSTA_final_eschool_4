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
	<div>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	
	<!-- 전체 상자 div-->
	<div class="main"><!-- style="margin-top:2%;"	--> 
	
	<!-- 사이드바 -->
	<div class="Left_bar"style="margin-left: 3%; margin-right: 8%; float:left; height:800px;" >
	<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"> <b>학생마당</b></font></p>
		<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
       		<li class="side_li"><a href="${pageContext.request.contextPath}/studentboard/studentProposalPro.do?s_pageNum=1"><font face="휴먼엽서체" size="3" color="black">건의사항</font></a></li>
       		<li class="side_li"><a href="${pageContext.request.contextPath}/studentboard/schoolViolencePro.do?s_pageNum=1"><font face="휴먼엽서체" size="3" color="black">학교폭력</font></a></li>
       		<li class="side_li"><a href="${pageContext.request.contextPath}/studentboard/familyViolencePro.do?s_pageNum=1"><font face="휴먼엽서체" size="3" color="black">가정폭력</font></a></li>
      	</ul>
	</div>
	<div style="margin-top: 15%; margin-left: 10%" style="width: 900px" class="table">
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
	</div>
	<div style="margin-top: 15%; margin-left: 10%">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>