<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<!-- 전체 구성 -->
	<div style="height:700px; box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.25);"> <!-- body에 해당 -->
	<!-- 게시판 전체 상자 -->
	<div>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	
	<!-- 전체 상자 div-->
	<div class="main"><!-- style="margin-top:2%;"	--> 
	
	<!-- 사이드바 -->
	<div class="Left_bar"style="margin-left: 3%; margin-right: 8%; margin-top:5%; float:left; height:500px;" >
	<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"><b>Message</b></font></p>
		<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
       		<li class="side_li"><a href="${pageContext.request.contextPath}/message/messageForm.do"><font face="휴먼엽서체" size="3" color="black">쪽지보내기</font></a></li>
       		<li class="side_li"><a href="${pageContext.request.contextPath}/message/getMessage.do"><font face="휴먼엽서체" size="3" color="black">받은 쪽지함</font></a></li>
      	</ul>
	</div>

	<div style=" margin-left: 10%; margin-top: 8%; "><!-- -->
		<div class="board_header"style="margin-left: 10%; width: 80%; height:150px;	
				padding-left:3%;"> <!-- border-radius:5%; background-color:#dafffd;  그림자  box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.25); --> 
			<!-- <div style="width:40%;"> -->
			<div style="float: left;"><font size="28px"><br><strong>받은쪽지함</strong> </font></div>	
			
			<div style="float: left; ">
				<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/board/studentboard/b_8.jpg" class="board_img" 
				style="height: auto; width:130px; margin-top:15%; margin-left:30%; ">  <!-- border-radius:0.81rem; box-shadow: 0px 2px 8px 0px rgba(0,0,0,.25); -->
			</div>
			
		</div>
		<hr>
	<div style="margin-left: 10%">

		<table style="width: 800px">
			<tr>
				<th>보낸사람</th>
				<th>받는사람</th>
				<th>메세지</th>
				<th>날짜</th>
			</tr>
			<c:forEach var="mList" items="${ mList }">
				<tr>
					<th>${ mList.meSend }</th>
					<th>${ mList.meGet }</th>
					<th>${ mList.meMessage }</th>
					<th>${ mList.meDate }</th>
				</tr>
			</c:forEach>
		</table>
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