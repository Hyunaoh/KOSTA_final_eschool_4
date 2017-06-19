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

<script type="text/javascript">
$(document).ready(function() {

	var dataset = [
		<c:forEach items='${Info}' var='vo'>
		{
			  title: '${vo.title}',
			  content : '${vo.comment}',
			  start: new Date('${vo.start}'),
			  end: new Date('${vo.end}'),
			  allDay: true,

		 },
		</c:forEach>
			      ]
	  $('#calendar').fullCalendar({
		    header: {
		      left: 'today',
		      center: 'title',
		      right: 'prev,next '
		    },
		    editable: true,

		    // add event name to title attribute on mouseover
		    eventMouseover: function(event, jsEvent, view) {
		      if (view.name !== 'agendaDay') {
		        $(jsEvent.target).attr('title', event.title);
		      }
		    },
	   	 eventClick: function(calEvent, jsEvent, view){
	   		 
	        var start = $.fullCalendar.formatDate(calEvent._start, 'yyyy-MM-dd');
	        var title = calEvent.title;
	        var end = $.fullCalendar.formatDate(calEvent._end, 'yyyy-MM-dd');
	        
	        alert('start: ' + start + '; end: ' + end + '; title: ' + title);
	        
	        location.href="/schedule/controllerScheduleDetail.do?title="+title+"&start="+start;
	        
	        
	        
	    },
	  	events: dataset
			      
	  });
	  
		
		//DatePicker
		$( ".datepicker" ).datepicker({
			dateFormat: 'yy-mm-dd' 
		});
		
		

	});
	
</script>


<style type="text/css">
#wrap{margin: 0 auto; padding: 20px;}
.calendar_body{width: 600px; float: left; margin-right: 20px;}

</style>
<title>일정표</title>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
여기는 컨트롤 디테일 스케쥴입니다
<jsp:include page="../home/menu.jsp"></jsp:include>
	
	<div class="row" style="margin-left: 15%; margin-top: 10%;">
  	<div class="col-sm-2"style="margin-left: 3%; margin-right: 8%; float:left;" >
  		<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"> <b>학교안내</b></font></p>
  		<ul class="side_bar" style="list-style:none; margin-left:-20px;">
			<li><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoGreeting.do"><font face="휴먼엽서체" size="3" color="black">커리큘럼</font></a></li>
       		<li><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoDetail.do"><font face="휴먼엽서체" size="3" color="black">전자결재</font></a></li>
            <li><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoSearch.do"><font face="휴먼엽서체" size="3" color="black">학사일정</font></a></li>
            <li><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoTeacher.do"><font face="휴먼엽서체" size="3" color="black">학사일정 수정</font></a></li>
		</ul>
	</div>
  	<div id="calendar" class="col-sm-5" style="float:center;"></div>
		<!-- Input/Output Form -->
 		<div class="col-sm-2" style="margin-left: 3%; float:right;">
			<c:forEach items="${detail}" var="vo" begin="0" end="10">
	<div class="cal_input_table">
			<form action="/schedule/updateSchedule.do" method="post">
				<table class="table">
					<tr><td colspan="2">일정 수정</td></tr>
				<tr><td>ID</td><td><input type="text" name="id" value="${vo.id}" readonly></td></tr>
				<tr><td>TITLE</td><td><input type="text" name="title" value="${vo.title}"></td></tr>
				<tr><td>COMMENT</td><td><textarea rows="5" cols="23" name="comment">${vo.comment}</textarea></td></tr>
				<tr><td>Start</td><td> <input type="text" class="datepicker" name="start" value="${vo.start}"></td></tr>
				<tr><td>End</td><td> <input type="text" class="datepicker" name="end" value="${vo.end}"></td></tr>
				<input type="hidden" name="seq" value="${vo.seq}">
				
				</table>
				<a href="deleteSchedule.do?start=${vo.start}&seq=${vo.seq}&title=${vo.title}" class="btn btn-default">삭제하기</a>
					<input type="submit" value="수정하기" class="btn btn-default">
			</form>
		</div>	
</c:forEach>
		</div>	
	</div>



<div style="margin-bottom: 10%;">

		<jsp:include page="../home/footer.jsp"></jsp:include>
</div>
</body>
</html>