<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="../home/menu.jsp"></jsp:include>
	<div style="margin-top: 15%; margin-left: 10%">
		<h1>쪽지함(2017010103)</h1>

		<table style="width: 900px">
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
	<div style="margin-top: 15%; margin-left: 10%">
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>