<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<div style="margin-top: 2%">
		<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	<table id="schoolInfo">

		<div style="margin-top: 10%; margin-left: 10%; margin-right: 30%">
			<div id="content_menu_center">
				<div id="content_content">
					<li class="content_content_name">학교위치</li>
				</div>
				<div id="content_content_sector">
					<p class="navihome">홈 > 학교소개 > 학교위치</p>
				</div>
			</div>
			<div id="content_content_greeting_background">
				<div id="content_content_greeting_ground">
					<p>
						<img src="/resources/img/Kosta.PNG">
					</p>
				</div>
			</div>
		</div>

		<div style="margin-top: 15%; margin-left: 10%">
			<jsp:include page="../home/footer.jsp"></jsp:include>
		</div>
	</table>
</body>
</html>