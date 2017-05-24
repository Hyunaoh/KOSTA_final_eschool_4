<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글 쓰기</h1>
<a href="list.do">리스트</a>
<form name = "insertStudentProposalForm" action="insertStudentProposal.do" method="post">
<table width="600">
	<tr>
		<th>순번</th>
		<td>
			${stNum}
		</td>
	</tr>
	<tr>
		<th>학년</th>
		<td>
			<input type="text" name="stGrade" maxlength="5" size="12"/>
		</td>
	</tr>
	
	<tr>
		<th>반</th>
		<td>
			<input type="text" name="stSchoolClass" maxlength="12"  size="13"/>
		</td>
	</tr>
	
	<tr>
		<th>건의 사항 종류</th>
		<td>
			<input type="text" name="stCategoly" maxlength="12"  size="13"/>
		</td>
	</tr>
	
	<tr>
		<th>작성자</th>
		<td>
        	<font size=6 color="skyblue">${sessionScope.sessionID}</font>
		</td>
	</tr>
	
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="stTitle" maxlength="50" size="65"/>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="stMessage" rows="5" cols="50"></textarea>
		</td>
	</tr>
	<tr>
		
		<td colspan="2">
			<input type="submit" value="쓰기" />
			<input type="reset" value="취소" />
		</td>
	</tr>
	

</table>


</form>
</body>
</html>