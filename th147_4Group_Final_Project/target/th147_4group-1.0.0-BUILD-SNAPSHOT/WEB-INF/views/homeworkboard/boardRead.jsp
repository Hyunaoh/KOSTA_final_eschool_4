<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="../home/menu.jsp"></jsp:include>
	<div style="margin-top: 15%; margin-left: 10%">
		<table style="width:800px; height:100px">
			<caption>게시판</caption>
			<colgroup>
				<col width='15%' />
				<col width='*%' />
			</colgroup>
			<tbody>
				<tr>
					<td>작성자</td> 
					<td><c:out value="${boardInfo.hwWriter}"/></td> 
				</tr>
				<tr>
					<td>제목</td> 
					<td><c:out value="${boardInfo.hwTitle}"/></td> 
				</tr>
				<tr>
					<td>내용</td> 
					<td><c:out value="${boardInfo.hwContent}"/></td> 
				</tr>
			</tbody>
		</table>    
		<a href="#" onclick="history.back(-1)">돌아가기</a>
		<a href="board1Delete.do?hwNo=<c:out value="${boardInfo.hwNo}"/>">삭제</a>
		<a href="board1Form.do?hwNo=<c:out value="${boardInfo.hwNo}"/>">수정</a>
	</div>
</body>
</html>
