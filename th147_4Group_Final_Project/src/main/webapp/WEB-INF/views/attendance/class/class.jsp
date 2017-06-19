<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
	<div class="Left_bar"style="margin-left: 3%;  margin-top:5%; float:left; height:800px; width:250px;" ><!-- margin-right: 3%; -->
	<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"><b>출석부</b></font></p>
		<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
       		<li class="side_li"><a href="${pageContext.request.contextPath}/attendance/attendanceBasic.do"><font face="휴먼엽서체" size="3" color="black">등/하교</font></a></li>
				<div id="attendance">
					<ul>
						<li><a href="attendance.do?atGrade=1">1학년</a></li>
						<li><a href="attendance.do?atGrade=2">2학년</a></li>
						<li><a href="attendance.do?atGrade=3">3학년</a></li>
						<li><a href="attendance.do?atGrade=4">4학년</a></li>
						<li><a href="attendance.do?atGrade=5">5학년</a></li>
						<li><a href="attendance.do?atGrade=6">6학년</a></li>
					</ul>
				</div>
				
       		
       		<se:authorize ifAnyGranted="Role_Teacher, Role_Admin">
			<li class="side_li"><a href="${pageContext.request.contextPath}/attendance/classGrade.do"><font face="휴먼엽서체" size="3" color="black">출석부 관리</font></a></li>
			</se:authorize>
      	</ul>
	</div>
	<div style=" margin-left: 10%; margin-top: 8%; "><!-- -->
		<div class="board_header"style="margin-left: 5%; width: 75%; height:150px;	
				padding-left:3%;"> <!-- border-radius:5%; background-color:#dafffd;  그림자  box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.25); --> 
			<!-- <div style="width:40%;"> -->
			<div style="float: left;"><font size="10px"><br><b>출석부</b> </font></div>	
			
			<div style="float: left; ">
				<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/board/studentboard/b_1.gif" class="board_img" 
				style="height: auto; width:130px; margin-top:15%; margin-left:30%; ">  <!-- border-radius:0.81rem; box-shadow: 0px 2px 8px 0px rgba(0,0,0,.25); -->
			</div>
		</div>
		<!-- 출석부 테이블 시작점 -->
		<div class="">
			<table style="width: 900px;" class="table">
			<tr>
				<th><label>이름</label></th>
				<th><label>등교 </label></th>
				<th><label>하교 </label></th>
				<th><label>비고 </label></th>
				<th><label>수정 </label></th>
				<th><label>삭제 </label></th>
			</tr>
			<c:forEach var="vo" items="${list}" begin="0" end="50">
			<tr>
				<!-- 이름 --><th>${vo.atName}</th>
				<!-- 등교 --><th>${vo.atAttendance}</th>
				<!-- 하교 --><th>${vo.atAttendance2}</th>
				<!-- 비교 --><th></th>
				<!-- 수정 --><th><input type="button" value="수정"
								onclick="location.href='updatePeopleForm.do?${list[0].atTeacher}'" class="btn btn-default"></th>
				<!-- 삭제 --><th><input type="button" value="삭제"
								onclick="location.href='classFlagForm.do'" class="btn btn-default"></th>
			</tr>
			</c:forEach>
			</table>
		</div>	
			
		<div style="margin-top: 5%; margin-left: 10%">
		</div>
		
	<div style="background-color:#F2EDE6; padding:2%; border-radius:5%; width:70%; margin-left:12%; margin-top:8%">
	<div style="margin-top:3%;">
		<form action="/attendance/dateSearch.do">
			<table class="table" style="width:300px;">
				<tr>
					<th colspan="4" style="align:center"><font size="4px" color="#00c4ef">특정 날짜 조회</font></th>
					
				</tr>
				<tr>
					<th>학생 이름</th>
					<th>학생 학년</th>
					<th colspan="2">조회 날짜</th>
				</tr>
				<tr>
					<th><input style="width:60pt;" type="text" name="atName"></th>
					<th><input style="width:60pt;" type="text" name="atGrade"></th>
					<th><input type="text" class="datepicker" name="atDate"></th>
					<th><input type="submit" value="조회" class="btn btn-default"></th>
				</tr>
			</table>
		</form>
	</div>
	<br>
	
	<div style="margin-top:2%;">
		<form action="/attendance/dateSearchDetail.do">
			<table class="table" style="width:300px;">
				<tr> 
					<th colspan="6"><font size="4px" color="#00c4ef">기간별 조회</font></th>
				</tr>
				<tr> 
					<th>학생 이름</th>
					<th>학생 학년</th>
					<th colspan="3">조회 날짜</th>
					<th>조회 </th>
				</tr>
				<tr>
					<th><input style="width:60pt;" type="text" name="atName"></th>
					<th><input style="width:60pt;" type="text" name="atGrade"></th>
					<th><input type="text" class="datepicker" name="atDate1"></th>
					<th> ~ </th>
					<th><input type="text" class="datepicker" name="atDate2"></th>
					<th><input type="submit" value="조회" class="btn btn-default"></th>
				</tr>	
			</table>
		</form>
	</div>
	</div>
	
	</div>
	</div>
	</div>
	<div>
	
		<jsp:include page="../../home/footer.jsp"></jsp:include>
	</div>
		<!-- DatePicker(jQuery UI) -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script>
	  $( function() {
	    $( ".datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
	   
	  });
	</script>

</body>
</html>