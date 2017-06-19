<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<!-- 전체 구성 -->
	<div style="height:1100px; box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.25);"> <!-- body에 해당 -->
	<!-- 게시판 전체 상자 -->
	<div>
		<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	
	<!-- 전체 상자 div-->
	<div class="main"><!-- style="margin-top:2%;"	--> 
	
	<!-- 사이드바 -->
	<div class="Left_bar"style="margin-left: 3%; margin-right: 8%; margin-top:5%; float:left; height:1000px;" >
	<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"> <b>학교안내</b></font></p>
		<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
            <li class="side_li"><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoGreeting.do"><font face="휴먼엽서체" size="3" color="black">교장 인사말</font></a></li>
			<li class="side_li"><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoDetail.do"><font face="휴먼엽서체" size="3" color="black">학교정보</font></a></li>
            <li class="side_li"><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoSearch.do"><font face="휴먼엽서체" size="3" color="black">학교위치</font></a></li>
            <li class="side_li"><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoTeacher.do"><font face="휴먼엽서체" size="3" color="black">선생님 정보</font></a></li>
      	</ul>
	</div>


	<div style=" margin-left: 10%; margin-top: 8%; "><!-- -->
		<div class="board_header"style="margin-left: 10%; width: 80%; height:150px;	padding-left:3%;"> <!-- border-radius:5%; background-color:#dafffd;  그림자  box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.25); --> 
			<!-- <div style="width:40%;"> -->
			<div style="float: left;"><font size="28px"><br><strong>학교정보</strong> </font></div>	
			
			<div style="float: left; ">
				<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/schoolinfo/b_2.jpg" class="board_img" 
				style="height: auto; width:130px; margin-top:15%; margin-left:30%; ">  <!-- border-radius:0.81rem; box-shadow: 0px 2px 8px 0px rgba(0,0,0,.25); -->
			</div>
			
		</div>
		<hr>
		<font size="5" color="#00c4ef"><b>교육목표</b></font>
		<!-- 교육목표 이미지 -->
		<div>
			<p><font size="4px">
				1. 개성과 재능을 길러 꿈을 키우는 어린이(개성인) <br/>
				2. 기본을 다져 탐구하고 창조하는 창의로운 어린이(창의인) <br/>
				3. 우리 문화를 이해하고 다양한 문화를 향유하는 어린이(문화인)  <br/>
				4. 나눔과 배려로 모두에게 본이 되는 어린이(도덕인)</font></p><br>
		</div>	
		<div style="margin-buttom:5%">
			<img alt="" src="/resources//img/schoolinfo/bundang_1_1.png">
		</div>
			
		<font size="5" color="#00c4ef"><b>학교장 경영상</b></font>
		<!-- 교육목표 이미지 -->
		<div>
			<p><font size="4px">
				1. 학교상 : 질문이 있는 학교, 꾸미지 않는 학교, 실천하는 학교 <br/>
				2. 교사상 : 단 한명의 학생도 포기 하지 않는선생님<br/>
				3. 학생상 : 바른 인성을 갖춘 창의 융합적인 학생  <br/>
				4. 학부모상 : 코스타교육을 신뢰하며 사랑을 주는 학부모</font></p>
		</div>	
		<div>
			<img alt="" src="/resources//img/schoolinfo/bundang_2_2.png">
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