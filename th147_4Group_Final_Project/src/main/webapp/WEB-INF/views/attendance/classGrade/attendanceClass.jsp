<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
								<li><a href="classInsertForm.do?${atGrade}&atClass=${atClass}">${atClass}반 당일 출석부 작성</a></li>
								<li><a href="class.do?atGrade=${atGrade}&atClass=${atClass}">${atClass}반 출석부 Check</a></li>
								<li><a href="classInsertNewForm.do?${atGrade}&atClass=${atClass}">${atClass}반 전학생 추가</a></li>
						</li>
					</ul>
				</div>
			</se:authorize>
      	</ul>
	</div>
	<div style="margin-top: 8%; margin-left: 10%">
	<div class="board_header"style="margin-left: 10%; width: 80%; height:150px;	
				padding-left:3%;"> 
		<div style="float: left;">
			<font size="28px"><br><strong>출석부 관리</strong></font>
		</div>	
		
		<div style="float: left; ">
			<img name="img_body1" src="${pageContext.request.contextPath}/resources/img/board/studentboard/b_1.gif" class="board_img" 
				style="height: auto; width:130px; margin-top:15%; margin-left:30%; ">  <!-- border-radius:0.81rem; box-shadow: 0px 2px 8px 0px rgba(0,0,0,.25); -->
		</div>
	</div>
	<hr>
	
	<!-- body 출석부 소개 %분 사진과 설명 -->
	<div style="width:100%; height:800px;">
		<div style="width:275;float:left; margin-right:3%;">
			<div style="width:275;"><img alt="attendance1" src="${pageContext.request.contextPath}/resources/img/attendance/1brian.jpg"></div><br>
			<div style="width:275;text-align:left; font-family:Comic Sans MS; font-size:28px;"><font color="#1533a5">Student Check</font></div>
			<div style="width:275;height:80px;">학생추가를 편리하게 간편하게 전자<br> 출석부를 이용하세요</div>
		</div>
		<div style="width:275;float:left; margin-right:20%;">
			<div style="width:275;"><img alt="attendance2" src="${pageContext.request.contextPath}/resources/img/attendance/2kamie.jpg"></div><br>
			<div style="width:275; text-align:left; font-family:Comic Sans MS; font-size:28px;"><font color="#1533a5">Student Add</font></div>
			<div style="width:275; height:80px;">전자출석부로 학생추가를 간편하게 <br>사용이 가능해요</div>
		</div>
		<div style="width:275;float:left; margin-right:3%;">
			<div style="width:275;"><img alt="attendance3" src="${pageContext.request.contextPath}/resources/img/attendance/3steve.jpg"></div><br>
			<div style="width:275; text-align:left; font-family:Comic Sans MS; font-size:28px;"><font color="#1533a5">Student Update</font></div>
			<div style="width:275; height:80px;">전자출석부로 학생이 변화가 있더라도 <br>편리하게 사용이 가능해요</div>
		</div>
		<div style="width:275; float:left; margin-right:3%;">
			<div style="width:275;"><img alt="attendance4" src="${pageContext.request.contextPath}/resources/img/attendance/4megan.jpg"></div><br>
			<div style="width:275; text-align:left; font-family:Comic Sans MS; font-size:28px;"><font color="#1533a5">Student Delete</font></div>
			<div style="width:275; height:80px;">전학생도 쉽게 삭제가 가능해요 </div>
		</div>
	
	</div>
	</div>
	</div>
	</div>
	<div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>