<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="cm" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
<script type="text/javascript">
	function sendMessageCheck(){
		var meGet = document.getElementById('meGet').value;
		var all_t = document.getElementById('all_t').value;
		var all_p = document.getElementById('all_p').value;
		
		if(!meGet){
			alert('보내는 사람이 없습니다.');
			return true;
		} else if(all_t != 'on'){
			alert('teacher X');
			return true;
		} else if(all_p != 'on'){
			alert('Parent X');
			return true;
		} else {
			alert('받는사람이 없습니다.');
			return false;
		}
		
	}
</script>
</head>
<body>

	<jsp:include page="../home/menu.jsp"></jsp:include>

	<div style="margin-top: 15%; margin-left: 10%">
		<form action="searchGradeAndClass.do">

			<select name="grGrade" id="grGrade">
				<option value="1">1학년</option>
				<option value="2">2학년</option>
				<option value="3">3학년</option>
				<option value="4">4학년</option>
				<option value="5">5학년</option>
				<option value="6">6학년</option>
			</select> <select name="grClass" id="grClass">
				<option value="1">1반</option>
				<option value="2">2반</option>
				<option value="3">3반</option>
			</select> <input type="submit" value="찾기" />
		</form>

		<form action="choiceGradeAndClass.do">
			<select name="grNo">
				<cm:forEach var="list" items="${ slist }">
					<option value="${ list.grNo }">${ list.grName }${ list.grNo }
						<cm:set var="grName" value="2017010101" />
						<cm:set var="grClass" value="2017010101" />
						<cm:set var="grGrade" value="2017010101" />
						<cm:set var="meSend" value="2017010101" />
						<cm:set var="meGet" value="${ list.grId }" />
						<cm:set var="grId" value="${ list.grId }" />
					</option>
				</cm:forEach>
			</select> 
			
				<input type="checkbox" id="all_t" name="all_t">전체 교사에게 보내기 <br />
				<input type="checkbox" id="all_p" name="all_p">전체 학부모에게 보내기 <br />

			<textarea name="meMessage" rows="10" cols="50" required></textarea>
			
				<input type="hidden" name="grName" value="${ grName }" />
				<input type="hidden" name="grClass" value="${ grClass }" />
				<input type="hidden" name="grGrade" value="${ grGrade }" />
				<input type="hidden" id="grId" name="grId" value="${ grId }"/> 
				<input type="hidden" id="meSend" name="meSend" value="${ meSend }"/>
				<input type="hidden" id="meGet" name="meGet" value="${ meGet }"/>
				<br/>
				<input type="submit" value="보내기" onclick="sendMessageCheck()" />
			
				${ res }
		</form>

	</div>

	<div style="margin-top: 15%; margin-left: 10%">
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>