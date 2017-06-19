<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board3</title>
</head>
<body>
<jsp:include page="../home/menu.jsp"></jsp:include>
	<div style="margin-top: 15%; margin-left: 10%">

		<table border="1" style="width:600px" class="table">
			<caption>게시판</caption>
			<colgroup>
				<col width='15%' />
				<col width='*%' />
			</colgroup>
			<tbody>
				<tr>
					<td>작성자</td> 
					<td><c:out value="${boardInfo.brdwriter}"/></td> 
				</tr>
				<tr>
					<td>제목</td> 
					<td><c:out value="${boardInfo.brdtitle}"/></td> 
				</tr>
				<tr>
					<td>내용</td> 
					<td><c:out value="${boardInfo.brdmemo}" escapeXml="false"/></td> 
				</tr>
			</tbody> 
		</table>    
		<a href="#" onclick="history.back(-1)">돌아가기</a>
		<a href="boarDelete.do?brdno=<c:out value="${boardInfo.brdno}"/>">삭제</a>
		<a href="boardForm.do?brdno=<c:out value="${boardInfo.brdno}"/>">수정</a>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>
