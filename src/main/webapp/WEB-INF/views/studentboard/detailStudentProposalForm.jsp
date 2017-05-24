<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 게시판 전체 상자 -->
	<!-- <form action=""> -->


	<div class="row" style="float:left; width: 60%;">
		<div class="matchingSubject">
					<!-- 번호 -->
					<div class="m_p">
					<h3 align="left">  </h3>
					<h4>게시글 번호 : ${stNum.stNum}</h4>
					</div>
				</div>
		
		<div class="matchingSubject">
					<!-- 학년 -->
					<div class="m_p">
					<h3 align="left"> </h3>
					<h4>학년 : ${stNum.stGrade}</h4>
					</div>
				</div>
				<br>
				<hr>
	
		<div class="matchingSubTitle">
					<!-- 반-->
					<div class="m_p">
					<h3 align="left"></h3>
					<h4>반 : ${stNum.stSchoolClass}</h4>
					</div>
				</div>
				<br>
				<hr>
		
		<div class="matchingLocal">
					<!-- 건의사항 항목 -->
					<div class="m_p">
					<h3 align="left"> </h3>
					<h4>건의사항 종류 : ${stNum.stCategoly}</h4> 
					</div>
				</div>
				<br>
				<hr>
				
				<div class="metchingPurpose">
					<!-- 건의사항 제목 -->
					<div class="m_p_text">
						<h3 align="left"> </h3>
						<h4>${stNum.stTitle}</h4>
					</div>
				</div>
				<br>
				<hr>
				
				<div class="metchingcontent">
					<!-- 작성자 -->
					<div class="m_p">
						<!-- 추후 매칭자 아이디 불러오기  -->	
						<div>
						<h3 align="left"></h3>
						<h4> 작성자 : ${sessionScope.sessionID} </h4>
						</div>	
					</div>
				</div>
				<br>
				<hr>
				
				<div class="metchingPurpose">
					<!-- 작성날짜 -->
					<div class="m_p_text">
						<h3 align="left"> </h3>
						<h4>작성 날짜 : ${stNum.stDate}</h4>
					</div>
				</div>
				<br>
				<hr>
				
				<div class="metchingPurpose">
					<!-- 작성날짜 -->
					<div class="m_p_text">
						<h3 align="left"> </h3>
						<h4>조회수 : ${stNum.stHit}</h4>
					</div>
				</div>
				<br>
				<hr>
	
				<div class="metchingPurpose">
					<!-- 작성날짜 -->
					<div class="m_p_text">
						<h3 align="left"></h3>
						<h4>작성 날짜 : ${stNum.stMessage}</h4>
					</div>
				</div>
				<br>
				<hr>

			
				<!-- 목록으로 가는 칸 -->
				<button onclick="window.location='BoardListAction.bo'"> 목 록  </button>
				
		</div>	

		<!-- </form> -->
</body>
</html>