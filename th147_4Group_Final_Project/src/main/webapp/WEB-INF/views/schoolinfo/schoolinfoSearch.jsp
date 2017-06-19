<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<div style="height:1000px; box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.25);"> <!-- body에 해당 -->
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
		<div class="board_header"style="margin-left: 10%; width: 80%; height:150px;	
				padding-left:3%;"> <!-- border-radius:5%; background-color:#dafffd;  그림자  box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.25); --> 
			<!-- <div style="width:40%;"> -->
			<div style="float: left;"><font size="28px"><br><strong>오시는 길 </strong></font> 많은 학생들에게 기회를 제공합니다.</div>	
			
			<div style="float: left; ">
				<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/schoolinfo/map.jpg" class="board_img" 
				style="height: auto; width:130px; margin-top:15%; margin-left:30%; ">  <!-- border-radius:0.81rem; box-shadow: 0px 2px 8px 0px rgba(0,0,0,.25); -->
			</div>
		</div>
		<hr>
			<div id="content_content_sector">
				<p class="navihome">홈 > 학교소개 > 학교장 인사말</p>
			</div>
	</div>
			
				<div id="content_content">
					<font size="5" color="#00c4ef"><b>학교위치</b></font>
				</div>
				
			</div>
			<div id="content_content_greeting_background">
				<div id="content_content_greeting_ground">
					<p>
						<img src="/resources/img/Kosta.PNG">
					</p>
				</div>
			</div>
			<div style="margin-buttom:3%;"><br><br>
			<font size="4px">
			- 주소 : 경기도 성남시 분당구 삼평동 대왕판교로 670 <font color="#00c4ef"><b>코스타초등학교</b></font><br>
 			- 교장실 : (031)701-2395<br>
 			- 행정실 : (031)701-2396 FAX : (031)-701-2397<br>
 			- 교무실 : (031)701-2398<br>
 			- 각교실 : (031)701-2398 (1학년 1반 101, 1학년 연구실 100)
 			</font><br><br><br><br>
			</div>
		</div>
		</div>
	</div>
	</div>
		<div >
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<jsp:include page="../home/footer.jsp"></jsp:include>
		</div>
	
</body>
</html>