<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<div style="margin-top: 2%">
		<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	<div style="margin-top: 10%; margin-left: 10%; margin-right: 30%">
		<table id="schoolInfo">
			<!-- <div align="left">
				<div>
					<a href="schoolinfoDetail.do">학교정보</a><br> <a
						href="schoolinfoGreeting.do">교장인사말</a><br> <a
						href="schoolinfoSearch.do">학교위치</a><br> <a
						href="schoolinfoTeacher.do">선생님정보</a><br>
				</div>
			</div> -->
			<div id="content_menu_top">
				<div id="content_menu_center">
					<div id="content_content">
						<li class="content_content_name">교사 소개</li>
					</div>
					<div id="content_content_sector">
						<p class="navihome">홈 > 학교소개 > 교사소개</p>
					</div>
				</div>
				<div id="content_content_introduce_background">
					<div id="content_content_introduce_ground">
						<div>
							<c:forEach var="VO" items="${list}" begin="0" end="2">
		  교사이름 : ${VO.name}<br>
		  연락처 : ${VO.tel}<br>
		  E-Mail${VO.email}<br>
		  담당 : ${VO.grade}학년 ${VO.schoolClass}반<br>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</table>
	</div>

	<div style="margin-top: 15%; margin-left: 10%">
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>