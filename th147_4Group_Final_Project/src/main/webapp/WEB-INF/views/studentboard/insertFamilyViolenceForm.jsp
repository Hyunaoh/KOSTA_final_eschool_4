<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../home/menu.jsp"></jsp:include>
		<!-- 전체 상자 div -->
	<div class="main" style="margin-top:15%;">
	<!-- 사이드바 -->
	<div class="left_bar" style="margin-left: 5%; margin-right: 50px;	 float:left">
	  <p class="studentboard" data-block-type="23" id="student_bar">학생마당</p>
	  <ul style="list-style:none; margin-left:-20px;" >
        <li><a href="${pageContext.request.contextPath}/studentboard/studentProposalPro.do?s_pageNum=1">건의사항</a></li>
        <li><a href="${pageContext.request.contextPath}/studentboard/schoolViolencePro.do?s_pageNum=1">학교폭력 상담</a></li>
      	<li><a href="${pageContext.request.contextPath}/studentboard/familyViolencePro.do?s_pageNum=1">가정폭력 상담</a></li>
      </ul>
	</div>	
		

	<div style="margin-left: 10%" align="left">
	
	<h1>글 쓰기</h1>
	<a href="list.do">리스트</a>
	<form name="insertFamilyViolence.do" action="insertFamilyViolence.do"
		method="post">
		<table style="width: 900px" class="table">
			<tr>
				<th>순번</th>
				<td>${fvNum}</td>
			</tr>
			<tr>
				<th>학년</th>
				<td><!-- <input type="text" name="fvGrade" maxlength="5" size="12" /> -->
					<select id="fvGrade" name="fvGrade" title="학년을 선택하세요.">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
					</select>
				
				</td>
			</tr>

			<tr>
				<th>반</th>
				<td><input type="text" name="fvSchoolClass" maxlength="12"
					size="13" /></td>
			</tr>

			<tr>
				<th>건의 사항 종류</th>
				<td>
				<!-- <input type="text" name="fvCategoly" maxlength="12" size="13" /> -->
					<select id="fvCategoly" name="fvCategoly" title="건의사항 종류를 선택하세요.">
						<option value="facility">시설물</option>
						<option value="education">교육</option>
						<option value="teacher">선생님</option>
					</select>
				</td>
				
			</tr>

			<tr>
				<th>작성자</th>
				<td><font size=6 color="skyblue">${sessionScope.sessionID}</font>
				</td>
			</tr>

			<tr>
				<th>제목</th>
				<td><input type="text" name="fvTitle" maxlength="50" size="65" />
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="fvMessage" rows="5" cols="50"></textarea></td>
			</tr>
			<tr>

				<td colspan="2"><input type="submit" value="쓰기" /> <input
					type="reset" value="취소" /></td>
			</tr>


		</table>

	</form>
	</div>
	</div>
	<div style="margin-top: 15%; margin-left: 10%">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>