<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function add_item() {
		// pre_set 에 있는 내용을 읽어와서 처리..
		var div = document.createElement('tr');
		div.innerHTML = document.getElementById('ko_form').innerHTML;
		document.getElementById('field').appendChild(tr);
	}

	function remove_item(obj) {
		// obj.parentNode 를 이용하여 삭제
		document.getElementById('field').removeChild(obj.parentNode);
	}

	function modify_item(obj) {
		document.getElementById(obj).removeChild(obj.parentNode);
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="curriForm.do">
		<table>
			<tr>
				<th><label>번호</label></th>
				<th><label>학년</label></th>
				<th><label>반</label></th>
				<th><label>내용</label></th>
				<th><label>날짜</label></th>
				<th><label>이름</label></th>
				<th><label>카테고리</label></th>
				<th><label>분기</label></th>
				<th><label>삭제</label></th>
				<th><label>수정</label></th>
			</tr>
			
			<c:forEach var="vo2" items="${ nowPage }" varStatus="status">
				<c:if test="${ status.index+1 eq param.pageNum }">
					<c:forEach var="vo" items="${ vo2.value }">
						<tr id="ko_form_hidden" name="ko_form_hidden">
							<th>${ vo.koRnum }</th>
							 <th><select name="koGrade" id="koGrade" class="ko_form">
							<option value="${ vo.koGrade }">${ vo.koGrade }학년</option>
							<option value="1">1학년</option> 
							<option value="2">2학년</option>
							<option value="3">3학년</option>
							<option value="4">4학년</option>
							<option value="5">5학년</option>
							<option value="6">6학년</option>

					</select></th>
					<th><select name="koClass" id="koClass" class="ko_form" value="${ vo.koClass }">
							<option value="${ vo.koClass }">${ vo.koClass }반</option>
							<option value="1">1반</option>
							<option value="2">2반</option>
							<option value="3">3반</option>
							<option value="4">4반</option>
							<option value="5">5반</option>
					</select></th>
					<th><input type="text" name="koMessage" id="koMessage" value="${ vo.koMessage }" placeholder="내용 입력"></th>
					<th><input type="date" name="koDate" id="koDate" value="${ vo.koDate }" /></th>
					<th><input type="text" name="koName" id="koName" placeholder="이름 입력" value="${ vo.koName }" /></th>
					
					<th><select name="koCategoly" id="koCategoly" class="ko_form" value="${ vo.koCategoly }">
							<option value="${ vo.koCategoly }">${ vo.koCategoly }</option>
							<option value="말하기">말하기</option>
							<option value="듣기">듣기</option>
							<option value="쓰기">쓰기</option>
							<option value="읽기">읽기</option>
					</select></th>
					
					<th><select name="koBungi" id="koBungi" class="ko_form" value="${ vo.koBungi }">
							<option value="${ vo.koBungi }">${ vo.koBungi }분기</option>
							<option value="1">1분기</option>
							<option value="2">2분기</option>
							<option value="3">3분기</option>
							<option value="4">4분기</option>
					</select></th>
					
					<th><input type="button" value="삭제" onclick="remove_item(${ vo.koRnum })" /></th>
					<th><input type="button" value="수정" onclick="modify()" /></th> 
						</tr>
					</c:forEach>
				</c:if>
			</c:forEach>
		</table>

		<c:forEach var="page" items="${ pageList }">
			<a href="curriForm.do?pageNum=${ page }"> ${ page } 
			<c:set var="pageNum" value="${ page }" />
			</a>
		</c:forEach>

		<br />
		<%-- <input type="hidden" value="${ vo.koRnum }" name="koRnum"id="koRnum" /> --%>
		<input type="button" value="추가" onclick="add_item()" /> <input
			type="submit" value="편집완료" />

	</form>

</body>
</html>