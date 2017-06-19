<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="curriPro.do">
		<label>학년</label>
		<select name="koGrade" id="koGrade" class="ko_form">
			<option value="1">1학년</option>
			<option value="2">2학년</option>
			<option value="3">3학년</option>
			<option value="4">4학년</option>
			<option value="5">5학년</option>
			<option value="6">6학년</option>
		</select> 
		<br/>
		<label>반</label>
		<select name="koClass" id="koClass" class="ko_form">
			<option value="1">1반</option>
			<option value="2">2반</option>
			<option value="3">3반</option>
			<option value="4">4반</option>
			<option value="5">5반</option>
		</select> 
		<br/>
		<label>내용</label>
		<textarea name="koMessage" id="koMessage" placeholder="내용 입력">
		</textarea>
		<br/>
		<label>날짜</label>
		<input type="date" name="koDate" id="koDate" /> 
		<br/>
		<label>이름</label> : 
		<input type="text" name="koName" id="koName" placeholder="이름 입력" /> 
		<br/>
		<label>카테고리</label> 
		<select name="koCategory" id="koCategory" class="ko_form">
			<option value="1">말하기</option>
			<option value="2">듣기</option>
			<option value="3">쓰기</option>
			<option value="4">읽기</option>
		</select> 
		<br/>
		<label>분기</label> 
		<select name="koBungi" id="koBungi" class="ko_form">
			<option value="1">1분기</option>
			<option value="2">2분기</option>
			<option value="3">3분기</option>
			<option value="4">4분기</option>
		</select>  
		
		<input type="submit" value="보내기" />
	</form>

</body>
</html>