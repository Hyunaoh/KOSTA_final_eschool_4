<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- DatePicker(jQuery UI) -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<!-- FullCalendar(jQuery API) -->
<link href='/resources/fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='/resources/fullcalendar/fullcalendar.print.css' rel='stylesheet' media="print"/>
<script src='/resources/fullcalendar/fullcalendar.js'></script>


<title>일정표</title>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
여기는 디테일 스케쥴입니다

<div>
<c:forEach items="${detail}" var="vo" begin="0" end="10">
Title : ${vo.title}<br>
Comment : ${vo.comment}<br>
Start : ${vo.start}<br>
End : ${vo.end}<br>

</c:forEach>
</div>

</body>
</html>