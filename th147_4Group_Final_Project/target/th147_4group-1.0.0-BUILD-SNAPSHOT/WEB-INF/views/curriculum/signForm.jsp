<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../home/menu.jsp"></jsp:include>

	<div style="margin-top: 15%; margin-left: 10%">
		<form action="signPro.do" method="get">

			<div>
				담임성명 : ${ sessionScope.name } <input type="hidden" name="cuName"
					value="${ sessionScope.name }" />
			</div>
			
			<div>
				교번 : ${ sessionScope.id } <input type="hidden" name="cuId"
					value="${ sessionScope.id }" />
			</div>

			<div style="margin-top: 20px">
				학년 : <select name="cuGrade">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
				</select> 
				반 : 
				<select name="cuClass">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select> 
				학기 : 
				<select name="cuBungi">
					<option value="1">1</option>
					<option value="2">2</option>
				</select> 
				과목 : 
				<select class="cuSubject" name="cuSubject">
					<option value="KOREA">국어</option>
					<option value="ENGLISH">영어</option>
					<option value="SCIENCE">과학</option>
					<option value="HISTORY">사회</option>
					<option value="MATH">수학</option>
				</select> 
				항목(카테고리) : 
				<select name="cuCategory">
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
					<option value="기타">기타</option>
				</select>
			</div>

			<div style="margin-top: 20px">
				시작날짜 : <input type="date" name="cuDate" > 
				마지막날짜 : <input type="date" name="cuDate2" >
			</div>

			<div style="margin-top: 20px">
				제목 : <input type="text" name="cuTitle">
			</div>

			<div style="margin-top: 20px">
				<textarea name="cuMessage" cols="50" rows="10"></textarea>
			</div>

			<div style="margin-top: 20px">
				<input type="submit" value="제출" />
				<a href="curriListPro.do?grade=${ sessionScope.grade }&mClass=${ sessionScope.mClass }&level=${ sessionScope.level }"><input type="button" value="리스트" /></a>				
			</div>
		</form>
	</div>

	<div style="margin-top: 15%; margin-left: 10%">
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
	
</body>

</html>