<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<!-- 전체 구성 -->
	<div style="height:1000px; box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.25);"> <!-- body에 해당 -->
	<!-- 게시판 전체 상자 -->
	<div>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	
	<!-- 전체 상자 div-->
	<div class="main"><!-- style="margin-top:2%;"	--> 
	
	<!-- 사이드바 -->
	<div class="Left_bar"style="margin-left: 3%; margin-right: 8%; margin-top:5%; float:left; height:800px;" >
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
			<div style="float: left;"><font size="28px"><br><strong>학교장 인사말</strong> </font></div>	
			
			<div style="float: left; ">
				<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/schoolinfo/b_9.jpg" class="board_img" 
				style="height: auto; width:130px; margin-top:15%; margin-left:30%; ">  <!-- border-radius:0.81rem; box-shadow: 0px 2px 8px 0px rgba(0,0,0,.25); -->
			</div>
		</div>
		<hr>
			<div id="content_content_sector">
				<p class="navihome">홈 > 학교소개 > 학교장 인사말</p>
			</div>
		</div>
		<div id="content_content_greeting_background" style="height:800px;">
			
			<div id="content_content_greeting_ground">
				<div style="float: left; margin-right:5%;">
					<div style="margin-bottom:8%;">
					<p><font size="5px"><strong>
						판교 중심에 위치한 <font size="6px" color="#00c4ef">코스타초등학교</font>는 <br>
						60여년의 긴 역사와 전통을 가진 학교입니다.</strong>
					</font></p><br><br>
					
					<p><font size="4px"><font color="#00c4ef">큰 꿈, 큰 사람, 큰 사랑의 교훈 아래</font><br><br>
				
				       	올바른 인성을 바탕으로 알찬 실력을 갖춘 창의적인 인재가 주역이 되는<br>
						미래사회의 주인공들을 기르고자<br><br> 
					
						학생의 창의력과 자기주도적 학습력 신장을 위해 노력하며, 교사의 수업역량 강화로<br>
						학생들의 전인적 성장을 도와주는 알찬 교육을 실현하겠습니다.<br><br>
					
						안전하고 깨끗한 학교환경을 조성하고, 감성을 깨우는 실천중심의<br>
						인성교육을 강화하여 소통과 배려, 나눔과 어울림의 행복 교육을 실현하겠습니다.<br><br>
					
						학부모, 지역사회와의 협력을 통해 함께	하는 공동체 교육을 실현하겠습니다.<br><br>
					
					 	모두가 행복한 학교를 만드는데<br>
						코스타초등학교 홈페이지가<br>
						지혜를 나누고 교육정보를 공유하는<br>
						행복한 대화의 장이 되기를 소망합니다.<br><br>
						
				
					 </font>
					 </p>
					</div>
					
				</div>
				<div style="float:left;">
					<div style="margin-bottom:5%;">
					<img alt="principal" src="/resources/img/schoolinfo/prancipal.jpg" style="width:80%x;">
					</div>
					<div align="center">
						<font size="4px"><strong><font color="#F69C55">코스타초등학교장</font> 임 숙 자</strong></font>
					</div>
				</div>
			</div>
				
		</div>

	</div>
	</div>
	<div> <!-- style="margin-bottom:0px;" -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
</body>

</html>