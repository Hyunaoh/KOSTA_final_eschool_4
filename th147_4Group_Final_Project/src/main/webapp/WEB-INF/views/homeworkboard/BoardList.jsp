<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board5</title>
<script>
	function fn_formSubmit() {
		document.form1.submit();
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
	<div id="content" style="margin-top: 8%; margin-left: 10%">
	
		<!-- 본문 시작 -->
		<div class="board_header"style="margin-left: 10%; width: 80%; height:150px;	
			padding-left:3%;">
				<!-- 본문 시작 -->
				<div style="float: left;"><font size="10px"><br><b>숙제 /준비물 게시판</b></font></div>
			<div style="float: left; ">
					<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/homework/homework.jpg" class="board_img" style="height: auto; width:100px; margin-top:15%; margin-left:30%; margin-top:60%; ">
			</div>
		</div>	
	
	<table style="width: 800px" class="table">
		<colgroup>
			<col width='8%' />
			<col width='40%' />
			<col width='10%' />
			<col width='30%' />
			<col width='5%' />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록자</th>
				<th>등록일</th>
				<th>조회수</th>
				<th>첨부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="listview" items="${listview}" varStatus="status">
				<c:url var="link" value="boardRead.do">
					<c:param name="brdno" value="${listview.brdno}" />
				</c:url>

				<tr>
					<td><c:out
							value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}" /></td>
					<td
						style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
						<a href="${link}"><c:out value="${listview.brdtitle}" /></a> <c:if
							test="${listview.replycnt>0}">
							(<c:out value="${listview.replycnt}" />)
						</c:if>
					</td>
					<td><c:out value="${listview.brdwriter}" /></td>
					<td><c:out value="${listview.brddate}" /></td>
					<td><c:out value="${listview.brdhit}" /></td>
					<td><c:out value="${listview.filecnt}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="right" style="margin-right: 20%;"><!--  -->
		<a class="btn btn-default" href="boardForm.do">글쓰기</a>
	</div>

	<form id="form1" name="form1" method="post" action="boardList.do">
		<jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />

		<div style="margin-left:30%;">
			<input type="checkbox" name="searchType" value="brdtitle"
				<c:if test="${fn:indexOf(searchVO.searchType, 'brdtitle')!=-1}">checked="checked"</c:if> />
			<label class="chkselect" for="searchType1">제목</label> <input
				type="checkbox" name="searchType" value="brdmemo"
				<c:if test="${fn:indexOf(searchVO.searchType, 'brdmemo')!=-1}">checked="checked"</c:if> />
			<label class="chkselect" for="searchType2">내용</label> <input
				type="text" name="searchKeyword" style="width: 150px;"
				maxlength="50" value='<c:out value="${searchVO.searchKeyword}"/>'
				onkeydown="if(event.keyCode == 13) { fn_formSubmit();}"> <input
				name="btn_search" value="검색" class="btn_sch" type="button"
				onclick="fn_formSubmit()" />
		</div>
	</form>
	
	</div>
	</div>
	</div>
	<div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
	
	
</body>
</html>
