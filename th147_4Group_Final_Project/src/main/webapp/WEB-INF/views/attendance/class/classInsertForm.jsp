<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<jsp:include page="../../home/head.jsp"></jsp:include>
</head>

<body>
<!-- 전체 구성 -->
	<div style="height:1100px; box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.25);"> <!-- body에 해당 -->
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
	<div class="board_header"style=" width: 70%; height:150px; padding-left:3%;"> <!-- margin-left: 10%; -->
		<div style="float: left;">
			<font size="28px"><br><strong>출석부 입력 폼</strong></font>
		</div>	
				<div style="float: left; ">
			<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/board/studentboard/b_1.gif" class="board_img" 
				style="height: auto; width:130px; margin-top:15%; margin-left:30%; ">  <!-- border-radius:0.81rem; box-shadow: 0px 2px 8px 0px rgba(0,0,0,.25); -->
		</div>
	</div>
	<hr>
		<form action="/attendance/insertPeople.do">
		<table class="table" style="width: 700px;">
		<tr>
			<th>이름</th>
			<th>등교</th>
			<th>하교</th>
			<th>날짜</th>
			<th>학년</th>
			<th>반</th>
			<th>학번</th>
			<th>직급</th>
			<th>담당교사</th>
			<th>출석</th>
			
		</tr>
		<c:forEach items="${list}" var="vo" begin="0" end="15">
		
			<tr>
				
				<td><input type="text" name="atName" value="${vo.atName}" placeholder="${vo.atName}" readonly></td>
				<td style="width:50px;"><input type="text" style="width:50px;" name="atAttendance" value="-" placeholder="-" readonly></td>
				<td style="width:50px;"><input type="text" style="width:50px;" name="atAttendance2" value="-" placeholder="-" readonly></td>
				<td style="width:50px;"><input type="text" style="width:50px;" name="atDate" value="${today}" placeholder="${today}"></td>
				<td style="width:50px;"><input type="text" style="width:50px;" name="atGrade" value="${vo.atGrade}" placeholder="${vo.atGrade}" readonly></td>
				<td style="width:50px;"><input type="text" style="width:50px;" name="atClass" value="${vo.atClass}" placeholder="${vo.atClass}" readonly></td>
				<td style="width:100px;"><input type="text" style="width:100px; name="atNum" value="${vo.atNum}" placeholder="${vo.atNum}" readonly></td>
				<td style="width:100px;"><input type="text" style="width:100px;" name="atLevel" value="${vo.atLevel}" placeholder="${vo.atLevel}" readonly></td>
				<td style="width:100px;"><input type="text" style="width:100px;" name="atTeacher" value="${vo.atTeacher}" placeholder="${vo.atTeacher}" readonly></td>
				<td ><select  name="atFlag" id="atFlag">
						<option value="0">0</option>
						<option value="1">1</option>
					</select>
				</td>
			</tr>
			
		</c:forEach>
			<input type="submit" value="저장">
			</table>
		</form>
	</div>
	
	</div>
	</div>

	<div>
		<jsp:include page="../../home/footer.jsp"></jsp:include>
	</div>
	
<script>
  $( function() {
    $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
   
  });
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</body>
</html>