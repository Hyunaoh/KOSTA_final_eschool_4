<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>학생게시판 건의사항</h1>
<form action="curriForm.do">
		<table>
			<tr>
				<th><label>번호</label></th>
				<th><label>학년</label></th>
				<th><label>반</label></th>
				<th><label>게시글 제목</label></th>
				<th><label>글 내용</label></th>
				<th><label>작성 날짜</label></th>
				<th><label>작성자</label></th>
				<th><label>소분류</label></th>
				<th><label>조회수</label></th>
				<th><label>삭제</label></th>
				<th><label>수정</label></th> 
			</tr>
			
			<c:forEach var="vo2" items="${ nowPage }" varStatus="status">
				<c:if test="${ status.index+1 eq param.pageNum }">
					<c:forEach var="vo" items="${ vo2.value }">
						<tr id="st_form_hidden" name="st_form_hidden">
							<th>${ vo.stNum }</th>
							 <th><select name="stGrade" id="stGrade" class="st_form">
							<option value="${ vo.stGrade }">${ vo.stGrade }학년</option>
							<option value="1">1학년</option> 
							<option value="2">2학년</option>
							<option value="3">3학년</option>
							<option value="4">4학년</option>
							<option value="5">5학년</option>
							<option value="6">6학년</option>

					</select></th>
					<th><select name="stSchoolClass" id="stSchoolClass" class="st_form" value="${ vo.stSchoolClass }">
							<option value="${ vo.stSchoolClass }">${ vo.stSchoolClass }반</option>
							<option value="1">1반</option>
							<option value="2">2반</option>
							<option value="3">3반</option>
							<option value="4">4반</option>
							<option value="5">5반</option>
					</select></th>
					<th><input type="text" name="stTitle" id="stTitle" value="${ vo.stTitle }" placeholder="내용 입력"></th>
					<th><input type="text" name="stMessage" id="stMessage" value="${ vo.stMessage }" placeholder="내용 입력"></th>
					<th><input type="date" name="stDate" id="stDate" value="${ vo.stDate }" /></th>
					<th><input type="text" name="stWriter" id="stWriter" placeholder="이름 입력" value="${ vo.stWriter }" /></th>
					
					<th><select name="stCategoly" id="stCategoly" class="st_form" value="${ vo.stCategoly }">
							<option value="${ vo.stCategoly }">${ vo.stCategoly }</option>
							<option value="수업">수업</option>
							<option value="시설">시설</option>
							<option value="동아리">동아리</option>
							<option value="진로">진로</option>
					</select></th>
					
					<th><input type="button" value="삭제" onclick="remove_item(${ vo.stNum })" /></th>
					<th><input type="button" value="수정" onclick="modify()" /></th> 
						</tr>
					</c:forEach>
				</c:if>
			</c:forEach>
		</table>

		<c:forEach var="page" items="${ pageList }">
			<a href="studentProposalForm.do?pageNum=${ page }"> ${ page } 
			<c:set var="pageNum" value="${ page }" />
			</a>
		</c:forEach>

		<br />
		<%-- <input type="hidden" value="${ vo.koRnum }" name="koRnum"id="koRnum" /> --%>
		<input type="button" value="추가" onclick="add_item()" /> 
		<input type="submit" value="편집완료" />

	</form>
</body>
</html>