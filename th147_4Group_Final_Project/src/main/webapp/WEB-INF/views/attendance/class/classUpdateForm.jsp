<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../../home/head.jsp"></jsp:include>
</head>
<body>
	<!-- 전체 구성 -->
	<div style="height:1500px; box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.25);"> <!-- body에 해당 -->
	<!-- 게시판 전체 상자 -->
	<div>
	<jsp:include page="../../home/menu.jsp"></jsp:include>
	</div>
	
	<!-- 전체 상자 div-->
	<div class="main"><!-- style="margin-top:2%;"	--> 
	
	<!-- 사이드바 -->
	<div class="Left_bar"style="margin-left: 3%; margin-right: 8%; margin-top:5%; float:left; height:1000px;" >
	<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"><b>출석부</b></font></p>
		<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
       		<li class="side_li"><a href="${pageContext.request.contextPath}/attendance/attendanceBasic.do"><font face="휴먼엽서체" size="3" color="black">등/하교</font></a></li>
       		<se:authorize ifAnyGranted="Role_Teacher, Role_Admin">
			<li class="side_li"><a href="${pageContext.request.contextPath}/attendance/classGrade.do"><font face="휴먼엽서체" size="3" color="black">출석부 관리</font></a></li>
				<div id="attendance">
					<ul>
						<li><a href="classGrade.do?atGrade=${atGrade}">${atGrade}학년</a>
							<ul>
								<li><a href="class.do?atGrade=${atGrade}&atClass=${atClass}">${atClass}반 출석부 Check</a></li>
								<li><a href="classInsertForm.do?${atGrade}&atClass=${atClass}">${atClass}반 출석부 작성</a></li>
								<li><a href="classInsertNewForm.do?${atGrade}&atClass=${atClass}">${atClass}반 학생추가</a></li>
								<li><a href="updatePeopleForm.do?${atGrade}&atClass=${atClass}">${atClass}반 출석부 수정</a></li>
								<li><a href="classFlagForm.do">1반 출석부제외</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</se:authorize>
      	</ul>
		</div>
	<div style="margin-top: 8%; margin-left: 10%">
	<div class="board_header"style="margin-left: 10%; width: 70%; height:150px;	
				padding-left:3%;"> 
		<div style="float: left;">
			<font size="28px"><br><strong>출석부 수정 폼</strong></font>
		</div>	
				<div style="float: left; ">
			<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/board/studentboard/b_1.gif" class="board_img" 
				style="height: auto; width:130px; margin-top:15%; margin-left:30%; ">  <!-- border-radius:0.81rem; box-shadow: 0px 2px 8px 0px rgba(0,0,0,.25); -->
		</div>
	</div>
		<form action="/attendance/updatePeople.do" id="updatePeople">
				<table class="table" style="float: left; width: 700px; margin-bottom:5%;">
					<tr>
						<th>이름</th>
						<th>등교</th>
						<th>하교</th>
					</tr>
			<c:forEach var="vo" items="${list}" begin="0" end="50">
					<tr>
						<td style="width:150px;">${vo.atName}</td>
						<td style="width:50px;">등교 <select name="atAttendance" id="atAttendance"
							class="input_select" title="schoolAttendance">
								<option value="${vo.atAttendance}">${vo.atAttendance}</option>
								<option value="O" title="O">출석</option>
								<option value="*" title="*">지각</option>
						</select>
						</td>
						<td style="width:50px;">하교 <select name="atAttendance2" id="atAttendance2"
							class="input_select" title="schoolAttendance">
								<option value="${vo.atAttendance2}">${vo.atAttendance2}</option>
								<option value="*" title="*">조퇴</option>
								<option value="O" title="O">하교</option>
								<option value="X" title="X">결석</option>
						</select>
						</td>
					</tr>
					<tr>
						<td colspan="3">
						<input type="hidden" name="atName" value="${vo.atName}"> 
						<input type="hidden" name="atDate" value="${vo.atDate}"> 
						<input type="hidden" name="atGrade" value="${vo.atGrade}"> 
						<input type="hidden" name="atClass" value="${vo.atClass}"> 
						<input type="hidden" name="atNum" value="${vo.atNum}"> 
						<input type="hidden" name="atLevel" value="${vo.atLevel}"> 
						<input type="hidden" name="atTeacher" value="${vo.atTeacher}"> 
						<input type="hidden" name="atFlag" value="${vo.atFlag}">
						</td>
					</tr>
			</c:forEach>
			<input type="submit" value="입력"">
			</table>					
		</form>
	</div>
	</div>
	</div>
	
	<div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>