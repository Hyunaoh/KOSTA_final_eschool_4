<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board1</title>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../home/menu.jsp"></jsp:include>

	<div id="content" style="margin-top: 15%; margin-left: 10%">
		<form name="form1" action="board1Save.do" method="post">
			<table border="1" style="width: 800px">
				<caption>게시판</caption>
				<colgroup>
					<col width='15%' />
					<col width='*%' />
				</colgroup>
				<tbody>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="hwWriter" size="20"
							maxlength="20" value="<c:out value="${boardInfo.hwWriter}" />"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="hwTitle" size="70"
							maxlength="250" value="<c:out value="${boardInfo.hwTitle}"/> "></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="hwContent" rows="5" cols="60"><c:out
									value="${boardInfo.hwContent}" /></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="hwNo"
				value="<c:out value="${boardInfo.hwNo}"/>"> <a href="#"
				onclick="form1.submit()">저장</a>
		</form>
	</div>

	<div style="margin-top: 15%; margin-left: 10%">
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>
