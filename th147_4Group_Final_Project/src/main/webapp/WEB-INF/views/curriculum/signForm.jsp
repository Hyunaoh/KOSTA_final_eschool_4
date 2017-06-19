<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
<jsp:include page="../home/head.jsp"></jsp:include>

<script type="text/javascript">
	function result(res){
		if(res == 1){
			alert('추가완료');
		}	
	}
</script>
</head>
<body onload="result(${res})">
	<jsp:include page="../home/menu.jsp"></jsp:include>

	<div style="margin-top: 15%; margin-left: 10%">
		<form action="addSignPro.do" method="get">

			<div>
				담임성명 : ${ sessionScope.name } <input type="hidden" name="cuName"
					value="${ sessionScope.name }" />
			</div>
			
			<div>
				교번 : ${ sessionScope.id } <input type="hidden" name="cuId"
					value="${ sessionScope.id }" />
			</div>

			<div style="margin-top: 20px">
				학년 : <select name="cuGrade" class="btn btn-default dropdown-toggle">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
				</select> 
				반 : 
				<select name="cuClass" class="btn btn-default dropdown-toggle">
				<c:set var="cuClass" value="${sessionScope.mClass}"/>
					<c:if test="${cuClass eq 1 }">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</c:if>
					<c:if test="${cuClass eq 2 }">
						<option value="2">2</option>
						<option value="1">1</option>
						<option value="3">3</option>
					</c:if>
					<c:if test="${cuClass eq 3 }">
						<option value="3">3</option>
						<option value="1">1</option>
						<option value="2">2</option>
					</c:if>
					<c:if test="${cuClass eq null }">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</c:if>
				</select> 
				학기 : 
				<select name="cuBungi" class="btn btn-default dropdown-toggle">
					<option value="1">1</option>
					<option value="2">2</option>
				</select> 
				과목 : 
				<select name="cuSubject" class="btn btn-default dropdown-toggle">
					<option value="KOREA">국어</option>
					<option value="ENGLISH">영어</option>
					<option value="SCIENCE">과학</option>
					<option value="HISTORY">사회</option>
					<option value="MATH">수학</option>
				</select> 
				항목(카테고리) : 
				<select name="cuCategory" class="btn btn-default dropdown-toggle">
					<option value="말하기/듣기">말하기/듣기(국어,영어)</option>
					<option value="쓰기">쓰기(국어,영어)</option>
					<option value="읽기">읽기(국어,영어)</option>
					<option value="문법">문법(국어,영어)</option>
					<option value="문학">문학(국어,영어)</option>
					<option value="수와연산">수와연산(수학)</option>
					<option value="도형">도형(수학)</option>
					<option value="규칙성">규칙성(수학)</option>
					<option value="물질">물질(과학)</option>
					<option value="에너지">에너지(과학)</option>
					<option value="생명">생명(과학)</option>
					<option value="경제">경제(사회)</option>
					<option value="정치">정치(사회)</option>
					<option value="법">법(사회)</option>
					<option value="사회문화">사회문화(사회)</option>
				</select>
			</div>

			주차 : 
			<div style="margin-top: 20px">
				<select name="cuDate" class="btn btn-default dropdown-toggle">
					<option value="1">1주차(3월 6일 ~ 3월 10일)</option>
					<option value="2">2주차(3월 13일 ~ 3월 17일)</option>
					<option value="3">3주차(3월 20일 ~ 3월 24일)</option>
					<option value="4">4주차(3월 27일 ~ 3월 31일)</option>
					<option value="5">5주차(4월 3일 ~ 4월 7일)</option>
					<option value="6">6주차(4월 10일 ~ 4월 14일)</option>
					<option value="7">7주차(4월 17일 ~ 4월 21일)</option>
					<option value="8">8주차(4월 24일 ~ 4월 28일)</option>
					<option value="9">9주차(5월 1일 ~ 4월 5일)</option>
					<option value="10">10주차(5월 8일 ~ 5월 12일)</option>
					<option value="11">11주차(5월 15일 ~ 5월 19일)</option>
					<option value="12">12주차(5월 22일 ~ 5월 26일)</option>
					<option value="13">13주차(5월 29일 ~ 6월 2일)</option>
					<option value="14">14주차(6월 5일 ~ 6월 9일)</option>
					<option value="15">15주차(6월 12일 ~ 6월 16일)</option>
					<option value="16">16주차(6월 19일 ~ 6월 23일)</option>
					<option value="17">17주차(6월 26일 ~ 6월 30일)</option>
					<option value="18">18주차(7월 3일 ~ 7월 7일)</option>
					<option value="19">19주차(7월 10일 ~ 7월 14일)</option>
					<option value="20">20주차(7월 17일 ~ 7월 21일)</option>
				</select>
			</div>

			<div style="margin-top: 20px; margin-right: 70%">
				제목 : <input class="form-control" type="text" name="cuTitle">
			</div>

			<div style="margin-top: 20px; margin-right: 70%">
				<textarea class="form-control" name="cuMessage" cols="50" rows="10"></textarea>
			</div>

			<div style="margin-top: 20px">
				<input type="submit" class="btn btn-default" value="저장" />
				<a href="curriListPro.do?grade=${ sessionScope.grade }&mClass=${ sessionScope.mClass }&level=${ sessionScope.level }"><input type="button" class="btn btn-default" value="리스트" /></a>				
			</div>
		</form>
	</div>

	<div style="margin-top: 15%; margin-left: 10%">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
	
</body>

</html>