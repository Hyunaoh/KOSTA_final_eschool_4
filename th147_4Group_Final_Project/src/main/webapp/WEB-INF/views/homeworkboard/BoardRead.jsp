<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board5</title>
<script>
function fn_formSubmit(){
	var form1 = document.form1;
	
	if (form1.rewriter.value=="") {
		alert("작성자를 입력해주세요.");
		form1.rewriter.focus();
		return;
	}
	if (form1.rememo.value=="") {
		alert("글 내용을 입력해주세요.");
		form1.rememo.focus();
		return;
	}
	form1.submit();	
}

function fn_replyDelete(reno){
	if (!confirm("삭제하시겠습니까?")) {
		return;
	}
	var form = document.form2;

	form.action="boardReplyDelete.do";
	form.reno.value=reno;
	form.submit();	
} 

var updateReno = updateRememo = null;
function fn_replyUpdate(reno){
	var form = document.form2;
	var reply = document.getElementById("reply"+reno);
	var replyDiv = document.getElementById("replyDiv");
	replyDiv.style.display = "";
	
	if (updateReno) {
		document.body.appendChild(replyDiv);
		var oldReno = document.getElementById("reply"+updateReno);
		oldReno.innerText = updateRememo;
	} 
	
	form.reno.value=reno;
	form.rememo.value = reply.innerText;
	reply.innerText ="";
	reply.appendChild(replyDiv);
	updateReno   = reno;
	updateRememo = form.rememo.value;
	form.rememo.focus();
} 

function fn_replyUpdateSave(){
	var form = document.form2;
	if (form.rememo.value=="") {
		alert("글 내용을 입력해주세요.");
		form.rememo.focus();
		return;
	}
	
	form.action="boardReplySave.do";
	form.submit();	
} 

function fn_replyUpdateCancel(){
	var form = document.form2;
	var replyDiv = document.getElementById("replyDiv");
	document.body.appendChild(replyDiv);
	replyDiv.style.display = "none";
	
	var oldReno = document.getElementById("reply"+updateReno);
	oldReno.innerText = updateRememo;
	updateReno = updateRememo = null;
} 

</script>

</head>
<body>
	<!-- 전체구성 -->
	<div style="height:1100px; box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.25);"> <!-- body에 해당 -->
	
	<!-- 게시판 전체 상자 -->
	<div>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	
	<!-- 전체 상자 div-->
	<div class="main"> <!-- style="margin-top:2%;"-->
	
	<!-- 사이드바 -->
	<div class="Left_bar"style="margin-left: 3%; margin-right: 8%; margin-top:5%; float:left; height:1000px;" >
	<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"><b>Curriculum</b></font></p>
      	<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
 					<li class="side_li"><a href="${pageContext.request.contextPath}/curriculum/signChartPro.do"><font face="휴먼엽서체" size="3" color="black">커리큘럼</font></a></li>                
 						<cl:if test="${ sessionScope.id ne 'principal' and  sessionScope.id ne 'submaster'}">
                	<li class="side_li"><a href="${pageContext.request.contextPath}/curriculum/curriListPro.do?grade=${ sessionScope.grade }&mClass=${ sessionScope.mClass }&level=Role_Teacher"><font face="휴먼엽서체" size="3" color="black">전자결재</font></a></li>
                	</cl:if>
                <cl:if test="${ sessionScope.id eq 'principal' }">
                	<li class="side_li"><a href="${pageContext.request.contextPath}/curriculum/principalListPro.do"><font face="휴먼엽서체" size="3" color="black">전자결재(교장)</font></a></li>
                </cl:if>
                <cl:if test="${ sessionScope.id eq 'submaster' }">
                	<li class="side_li"><a href="${pageContext.request.contextPath}/curriculum/principalListPro.do"><font face="휴먼엽서체" size="3" color="black">전자결재(교감)</font></a></li>
                </cl:if>
                	<li class="side_li"><a href="${pageContext.request.contextPath}/homeworkboard/boardList.do"><font face="휴먼엽서체" size="3" color="black">숙제/준비물</font></a></li>
                	<li class="side_li"><a href="${pageContext.request.contextPath}/schedule/selectAll.do"><font face="휴먼엽서체" size="3" color="black">학사일정</font></a></li>
                	<se:authorize ifAnyGranted="Role_Teacher">
					<li class="side_li"><a href="${pageContext.request.contextPath}/schedule/controllerSchedule.do"><font face="휴먼엽서체" size="3" color="black">학사일정수정</font></a></li>
					</se:authorize> 
              </ul>
	</div>
	<div id="content"style="margin-top: 8%; margin-left: 10%;">
	
		<!-- 본문 시작 -->
		<div class="board_header"style="margin-left: 10%; width: 80%; height:150px;	
			padding-left:3%;">
				<!-- 본문 시작 -->
				<div style="float: left;"><font size="10px"><br><b>숙제 /준비물 작성</b></font></div>
			<div style="float: left; ">
					<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/homework/homework.jpg" class="board_img" style="height: auto; width:100px; margin-top:15%; margin-left:30%; margin-top:60%; ">
			</div>
		</div>
		
		<table style="width:800px;" class="table">
			<colgroup>
				<col width='15%' />
				<col width='*%' />
			</colgroup>
			<tbody>
				<tr>
					<th>제목 : </th> 
					<td><c:out value="${boardInfo.brdtitle}"/></td>  
				</tr>
				<tr>
					<th>작성자 : </th> 
					<td><c:out value="${boardInfo.brdwriter}"/></td> 
				</tr>
				<tr>
					<th>첨부 : </th> 
					<td>
						<c:forEach var="listview" items="${listview}" varStatus="status">	
            				<a href="fileDownload.do?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>"> 							 
							<c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>
						</c:forEach>					
					</td> 
				</tr>
				<tr>
					<th>내용 : </th> 
					<td><c:out value="${boardInfo.brdmemo}" escapeXml="false"/></td> 
				</tr>
			</tbody>
		</table>    
		<a href="boardList.do"><input type="button" class="btn btn-default" value="돌아가기"></a>
		<a href="boardDelete.do?brdno=<c:out value="${boardInfo.brdno}"/>"><input type="button" class="btn btn-default" value="삭제"></a>
		<a href="boardForm.do?brdno=<c:out value="${boardInfo.brdno}"/>"><input type="button" class="btn btn-default" value="수정"></a>
		<p>&nbsp;</p>
		<div style="width: 100px; padding: 5px; float:left;">
			<form name="form1" action="boardReplySave.do" method="post">
				<input type="hidden" name="brdno" value="<c:out value="${boardInfo.brdno}"/>"> 
				작성자: <input type="text" name="rewriter" size="20" maxlength="20"> <br/>
				<textarea name="rememo" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
				<a href="#" onclick="fn_formSubmit()"><input type="button" class="btn btn-default" value="저장"></a>
			</form>
		</div>
		
		<c:forEach var="replylist" items="${replylist}" varStatus="status">
			<div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px;">	
				<c:out value="${replylist.rewriter}"/> <c:out value="${replylist.redate}"/>
				<a href="#" onclick="fn_replyDelete('<c:out value="${replylist.reno}"/>')">삭제</a>
				<a href="#" onclick="fn_replyUpdate('<c:out value="${replylist.reno}"/>')">수정</a>
				<br/>
				<div id="reply<c:out value="${replylist.reno}"/>"><c:out value="${replylist.rememo}"/></div>
			</div>
		</c:forEach>

		<div id="replyDiv" style="width: 99%; display:none">
			<form name="form2" action="boardReplySave.do" method="post">
				<input type="hidden" name="brdno" value="<c:out value="${boardInfo.brdno}"/>"> 
				<input type="hidden" name="reno"> 
				<textarea name="rememo" rows="3" cols="60" maxlength="500"></textarea>
				<a href="#" onclick="fn_replyUpdateSave()"><input type="button" class="btn btn-default" value="저장"></a>
				<a href="#" onclick="fn_replyUpdateCancel()"><input type="button" class="btn btn-default" value="취소"></a>
			</form>
		</div>
	</div>
	</div>
	</div>
	<div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
							
</body>
</html>
