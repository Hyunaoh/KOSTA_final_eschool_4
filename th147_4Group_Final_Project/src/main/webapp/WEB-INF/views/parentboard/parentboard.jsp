<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page import="java.util.*  ,  java.text.SimpleDateFormat"  %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mybatis+MariaDB 연동</title>
</head>
<body>
	<h1>학부모 마당</h1>

	<table>
		<tr>
			<td>글번호</td>
			<td>학부모 아이디</td>
			<td>학부모 비밀번호</td>
			<td>작성시간</td>
			<td>학부모 이름</td>
			<td>학부모 핸드폰번호</td>
			<td>학부모 주소</td>
			<td>학부모 이메일</td>
			<td>학부모 SMS 동의여부</td>
			<td> 값 : 학부모</td>
			<td>학부모의 자녀 이름</td>
		</tr>
		<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.paNum }</td>
				<td>${dto.paId }</td>
				<td>${dto.paPw }</td>
				<td>${dto.paDate}</td>
				<td>${dto.paTel }</td>
				<td>${dto.paSite }</td>
				<td>${dto.paEmail }</td>
				<td>${dto.paSms }</td>
				<td>${dto.paSms }</td>
				<td>${dto.paLevel }</td>
				<td>${dto.paStName }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>