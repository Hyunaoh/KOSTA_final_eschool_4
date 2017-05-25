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
<!-- <form action="curriForm.do"> -->
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
				<th><label>삭제</label></th>
				<th><label>수정</label></th> 
			</tr>
			
			<c:forEach var="vo2" items="${ nowPage }" varStatus="status">
				<c:if test="${ status.index+1 eq param.pageNum }">
					<c:forEach var="vo" items="${ vo2.value }">
						<tr id="st_form_hidden" name="st_form_hidden">
							<th>${ vo.fmNum }</th>
							 <th><select name="fmGrade" id="fmGrade" class="st_form">
							<option value="${ vo.fmGrade }">${ vo.fmGrade }학년</option>
							

					</select></th>
					<th><select name="fmSchoolClass" id="fmSchoolClass" class="st_form" value="${ vo.fmSchoolClass }">
							<option value="${ vo.fmSchoolClass }">${ vo.fmSchoolClass }반</option>
							
					</select></th>
					<th>
						<input type="text" name="fmTitle" id="fmTitle" value="${ vo.fmTitle }" placeholder="내용 입력">
					</th>
					<th>
						<a href="detailFamilyViolence.do?fmNum=${vo.fmNum}">
							<input type="text" name="fmMessage" id="fmMessage" value="${ vo.fmMessage }" placeholder="내용 입력">
						</a>
					</th>
					<th>
						<input type="date" name="fmDate" id="fmDate" value="${ vo.fmDate }" />
					</th>
					<th>
						<input type="text" name="fmWriter" id="fmWriter" placeholder="이름 입력" value="${ vo.fmWriter }" />
					</th>
					
					<th><select name="fmCategoly" id="fmCategoly" class="st_form" value="${ vo.fmCategoly }">
							<option value="${ vo.fmCategoly }">${ vo.fmCategoly }</option>
						</select>
					</th>
					
					<th><input type="button" value="삭제" onclick="remove_item(${ vo.fmNum })" /></th>
					<th><input type="button" value="수정" onclick="modify()" /></th> 
						</tr>
					</c:forEach>
				</c:if>
			</c:forEach>
		</table>

		<c:forEach var="page" items="${ pageList }">
			<a href="FamilyViolenceForm.do?pageNum=${ page }"> ${ page } 
			<c:set var="pageNum" value="${ page }" />
			</a>
		</c:forEach>

		<br />
		<input type="button" value="추가" onclick="add_item()" /> 
		<input type="submit" value="편집완료" />

	<!-- </form> -->
</body>
</html>