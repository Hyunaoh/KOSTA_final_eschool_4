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
		<form action="curriModifyPro.do" method="get">

			<div>
				담임성명 : ${ sessionScope.name } <input type="hidden" name="cuName"
					value="${ sessionScope.name }" />
			</div>
			
			<div>
				교번 : ${ sessionScope.id } <input type="hidden" name="cuId"
					value="${ sessionScope.id }" />
			</div>

			<div style="margin-top: 20px">
				학년 : 
				<select name="cuGrade" class="btn btn-default dropdown-toggle">
					<option value="${ sessionScope.cuGrade }">${ sessionScope.cuGrade }학년</option>
						<c:forEach begin="1" end="6" step="1" var="i" varStatus="status">
							<c:if test="${ i ne sessionScope.grade }">
								<option value="${ i }">${ i }학년</option>
							</c:if>
						</c:forEach>
				</select> 
				반 : 
				<select name="cuClass" class="btn btn-default dropdown-toggle">
					<option value="${ sessionScope.mClass }">${ sessionScope.mClass }반</option>
						<c:forEach begin="1" end="3" step="1" var="i" varStatus="status">
							<c:if test="${ i ne sessionScope.mClass }">
								<option value="${ i }">${ i }반</option>
							</c:if>
						</c:forEach>
				</select> 
				학기 : 
				<select name="cuBungi" class="btn btn-default dropdown-toggle">
					<option value="1">1</option>
					<option value="2">2</option>
				</select> 
				과목 : 
				<select name="cuSubject" class="btn btn-default dropdown-toggle">
					<option value=" ${ param.cuSubject }">
						<c:choose>
							<c:when test="${ param.cuSubject eq 'KOREA'}">국어</c:when>
							<c:when test="${ param.cuSubject eq 'ENGLISH'}">영어</c:when>
							<c:when test="${ param.cuSubject eq 'SCIENCE'}">과학</c:when>
							<c:when test="${ param.cuSubject eq 'HISTORY'}">사회</c:when>
							<c:when test="${ param.cuSubject eq 'MATH'}">수학</c:when>
						</c:choose>
					</option>
					
					<option value="KOREA">국어</option>
					<option value="ENGLISH">영어</option>
					<option value="SCIENCE">과학</option>
					<option value="HISTORY">사회</option>
					<option value="MATH">수학</option>
				</select> 
				항목(카테고리) : 
				<select name="cuCategory" class="btn btn-default dropdown-toggle">
					<option value=" ${ param.cuCategory }">
						<c:choose>
							<c:when test="${ param.cuCategory eq '말하기/듣기'}">말하기/듣기(국어,영어)</c:when>
							<c:when test="${ param.cuCategory eq '쓰기'}">쓰기(국어,영어)</c:when>
							<c:when test="${ param.cuCategory eq '읽기'}">읽기(국어,영어)</c:when>
							<c:when test="${ param.cuCategory eq '문법'}">문법(국어,영어)</c:when>
							<c:when test="${ param.cuCategory eq '문학'}">문학(국어,영어)</c:when>
							<c:when test="${ param.cuCategory eq '수와연산'}">수와연산(수학)</c:when>
							<c:when test="${ param.cuCategory eq '도형'}">도형(수학)</c:when>
							<c:when test="${ param.cuCategory eq '규칙성'}">규칙성(수학)</c:when>
							<c:when test="${ param.cuCategory eq '물질'}">물질(과학)</c:when>
							<c:when test="${ param.cuCategory eq '에너지'}">에너지(과학)</c:when>
							<c:when test="${ param.cuCategory eq '생명'}">생명(과학)</c:when>
							<c:when test="${ param.cuCategory eq '경제'}">경제(사회)</c:when>
							<c:when test="${ param.cuCategory eq '정치'}">정치(사회)</c:when>
							<c:when test="${ param.cuCategory eq '법'}">법(사회)</c:when>
							<c:when test="${ param.cuCategory eq '사회문화'}">사회문화(사회)</c:when>
						</c:choose>
					</option>
				
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
					<option value=" ${ param.cuDate }">
						<c:forEach begin="1" end="20" step="1" var="i" varStatus="status">
							<c:if test="${ i ne param.cuDate }">
								<option value="${ i }">${ i }주차</option>
							</c:if>
						</c:forEach>
					</option>
				</select>
			</div>

			<div style="margin-top: 20px; margin-right: 70%">
				제목 : <input class="form-control" type="text" name="cuTitle" value="${ param.cuTitle }">
			</div>

			<div style="margin-top: 20px; margin-right: 70%">
				<textarea class="form-control" name="cuMessage" cols="50" rows="10" value="${ param.cuMessage }"></textarea>
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