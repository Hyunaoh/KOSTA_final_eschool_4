<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	test : ${ test }
	<br/>
	
	String 띄우기
	
	<br/>
	${ kvo.koRnum }
	${ kvo.koGrade }
	${ kvo.koClass }
	${ kvo.koMessage }
	${ kvo.koDate }
	${ kvo.koName }
	${ kvo.koCategoly }
	
	
	<br/>
	List 띄우기
	<br/>
	<c:forEach var="vo" items="${kvoList}">
		${ vo.koGrade }
		${ vo.koClass }
		${ vo.koMessage }
		${ vo.koDate }
		${ vo.koName }
		${ vo.koCategoly }
		<br/>
	</c:forEach>
	

</body>
</html>