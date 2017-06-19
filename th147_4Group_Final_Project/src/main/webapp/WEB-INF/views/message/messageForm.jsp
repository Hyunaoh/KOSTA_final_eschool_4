<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="cm" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
<script type="text/javascript">
	
</script>
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
		<div class="board_header"style="margin-left: 10%; width: 40%; height:150px;	
				padding-left:3%;"> <!-- border-radius:5%; background-color:#dafffd;  그림자  box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.25); --> 
			<!-- <div style="width:40%;"> -->
			<div style="float: left;"><font size="28px"><br><strong>쪽지보내기</strong> </font></div>	
			
			<div style="float: left; ">
				<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/board/studentboard/b_8.jpg" class="board_img" 
				style="height: auto; width:130px; margin-top:15%; margin-left:30%; ">  <!-- border-radius:0.81rem; box-shadow: 0px 2px 8px 0px rgba(0,0,0,.25); -->
			</div>
			
		</div>
		<hr>

	<div style="margin-left: 10%; background-color:#F2EDE6; padding:5%; width:40%; border-radius:10%;">
		<form action="searchGradeAndClass.do">

			<select name="grGrade" id="grGrade">
				<option value="1">1학년</option>
				<option value="2">2학년</option>
				<option value="3">3학년</option>
				<option value="4">4학년</option>
				<option value="5">5학년</option>
				<option value="6">6학년</option>
			</select> <select name="grClass" id="grClass">
				<option value="1">1반</option>
				<option value="2">2반</option>
				<option value="3">3반</option>
			</select> <input type="submit" value="찾기" />
		</form>

		<form action="choiceGradeAndClass.do">
			<select name="grNo">
				<cm:forEach var="list" items="${ slist }">
					<option value="${ list.grNo }">${ list.grName }${ list.grNo }
						<cm:set var="grName" value="${ list.grName }" />
						<cm:set var="grClass" value="${ list.grClass }" />
						<cm:set var="grGrade" value="${ list.grGrade }" />
						<cm:set var="meSend" value="${ sessionScope.id }" />
						<cm:set var="meGet" value="${ list.grId }" />
						<cm:set var="grId" value="${ list.grId }" />
					</option>
				</cm:forEach>
			</select> <br>
			
				<input type="checkbox" id="all_t" name="all_t">전체 교사에게 보내기 <br />
				<input type="checkbox" id="all_p" name="all_p">전체 학부모에게 보내기 <br />
				<br>
			<textarea name="meMessage" rows="10" cols="50" ></textarea><!-- required -->
			
				<input type="hidden" name="grName" value="${ grName }" />
				<input type="hidden" name="grClass" value="${ grClass }" />
				<input type="hidden" name="grGrade" value="${ grGrade }" />
				<input type="hidden" id="grId" name="grId" value="${ grId }"/> 
				<input type="hidden" id="meSend" name="meSend" value="${ meSend }"/>
				<input type="hidden" id="meGet" name="meGet" value="${ meGet }"/>
				<br/>
				<br>
				<input class="btn btn-default" type="submit" value="보내기" />

		</form>

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