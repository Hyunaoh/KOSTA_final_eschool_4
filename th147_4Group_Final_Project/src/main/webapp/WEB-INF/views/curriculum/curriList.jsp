<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
<script type="text/javascript">
	function result(res1){
		if(res1 == 1){
			alert('해당 컬럼 삭제 완료');
		}
	}
</script>

</head>
<body onload="result(${deleteResult})">
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
	<div id="content" style="margin-top: 8%; margin-left: 10%; height:1100px;"> 
	
	<!-- 본문 시작 -->
		<div class="board_header"style="margin-left: 10%; width: 80%; height:150px;	
			padding-left:3%;">
				<!-- 본문 시작 -->
				<div style="float: left;"><font size="10px"><br><b>전자결재</b></font></div>
			<div style="float: left; ">
					<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/curriculum/b_10.jpg" class="board_img" style="height: auto; width:100px; margin-top:15%; margin-left:30%; margin-top:60%; ">
			</div>
		</div>
	<br>
	<!-- 결제여부 (0:보류 / 1:승인 / 2: 반려 / 3: 대기) -->
	
	<p>
	<a href="curriListPro.do"><input type="button"  class="btn btn-default" value="전체"></a>
	<!-- <a href="selectSignInfo.do?cuFlag=0"><input type="button" class="btn btn-default" value="대기"></a>
	<a href="selectSignInfo.do?cuFlag=1"><input type="button" class="btn btn-default" value="승인"></a>
	<a href="selectSignInfo.do?cuFlag=2"><input type="button" class="btn btn-default" value="반려"></a>
	<a href="selectSignInfo.do?cuFlag=3"><input type="button" class="btn btn-default" value="미결"></a> -->
	</p>
	
		<form action="submitSignPro.do" method="post">
			<table style="width: 60%; margin-left:20px" class="table">
				<tr>
					<th><label>번호</label></th>
					<th><label>학년</label></th>
					<th><label>반</label></th>
					<th><label>제목</label></th>
					<th><label>내용</label></th>
					<th><label>주차</label></th>
					<th><label>이름</label></th>
					<th><label>카테고리</label></th>
					<th><label>학기</label></th>
					<th><label>과목</label></th>
					<th><label>교감결재</label></th>
					<th><label>교장결재</label></th>
					<c:if test="${ sign_1 eq '2'  or sign_2 eq '2' or sign_1 eq '3'}">
						<th><label>삭제</label></th>
					</c:if>
				</tr>

				<c:forEach var="vo2" items="${ cu_nowPage }" varStatus="status">
					<c:if test="${ status.index+1 eq param.cu_pageNum }">
						<c:forEach var="vo" items="${ vo2.value }">
							<tr id="cu_form_hidden" name="cu_form_hidden">
								<th><input type="hidden" name="cuRnum"
									value="${ vo.cuRnum }" />${ vo.cuRnum }</th>
								<th><input type="hidden" name="cuGrade"
									value="${ vo.cuGrade }" /> ${ vo.cuGrade }</th>
								<th><input type="hidden" name="cuClass"
									value="${ vo.cuClass }" /> ${ vo.cuClass }</th>
								<th><input type="hidden" name="cuTitle"
									value="${ vo.cuTitle }" /> ${ vo.cuTitle }</th>
								<th><input type="hidden" name="cuMessage"
									value="${ vo.cuMessage }" /> ${ vo.cuMessage }</th>
								<th><input type="hidden" name="cuDate"
									value="${ vo.cuDate }" /> ${ vo.cuDate }주차</th>
								<th><input type="hidden" name="cuName"
									value="${ vo.cuName }" /> ${ vo.cuName }</th>
								<th><input type="hidden" name="cuCategory"
									value="${ vo.cuCategory }" /> ${ vo.cuCategory }</th>
								<th><input type="hidden" name="cuBungi"
									value="${ vo.cuBungi }" /> ${ vo.cuBungi }</th>
								<th><input type="hidden" name="cuSubject"
									value="${ vo.cuSubject }" /> ${ vo.cuSubject }</th>
								<th><input type="hidden" name="cuSign"
									value="${ vo.cuSign }" /> 
								<c:if test="${ vo.cuSign eq '3' }">
									미결재
								</c:if> 
								<c:if test="${ vo.cuSign eq '2' }">
									결재반려
								</c:if> 
								<c:if test="${ vo.cuSign eq '1' }">
									결재승인
								</c:if> 
								<c:if test="${ vo.cuSign eq '0' }">
									결재대기
								</c:if>
								</th>
								<th><input type="hidden" name="cuSign2" value="${ vo.cuSign2 }" /> 
								<c:if test="${ vo.cuSign2 eq '3' }">
									미결재
								</c:if> 
								<c:if test="${ vo.cuSign2 eq '2' }">
									결재반려
								</c:if> 
								<c:if test="${ vo.cuSign2 eq '1' }">
									결재승인
								</c:if> 
								<c:if test="${ vo.cuSign2 eq '0' }">
									결재대기
								</c:if>
								</th>
								<c:if test="${  sign_1 eq '2' or sign_2 eq '2' or sign_1 eq '3'}">
									<th><a href="curriDeletePro.do?cuRnum=${ vo.cuRnum }&sign=${sign_1}"><input type="button" class="btn btn-default" value="삭제"/></a></th>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
				</c:forEach>
			</table>
			
			<div align="center">

				<c:forEach var="cu_page" items="${ cu_pageList }" varStatus="status"
					begin="${ param.page_index_start }" end="${ param.page_index_end }">
					<c:if test="${ cu_page % 10 == 1 && cu_page != 1 }">
						<a href="curriPro.do?cu_pageNum=${ param.page_index_start - 1 }&page_index_start=${ param.page_index_start - 10 }&page_index_end=${ param.page_index_end - 10 }">
							◀ 이전</a>
					</c:if>
					
					<c:if test="${ cuFlag eq null }">
						<a href="curriListPro.do?cu_pageNum=${ cu_page }&page_index_start=${ param.page_index_start }&page_index_end=${ param.page_index_end }">${ cu_page }</a>
					</c:if>
					<c:if test="${ cuFlag ne null}">
						<a href="curriListPro.do?cu_pageNum=${ cu_page }&page_index_start=${ param.page_index_start }&page_index_end=${ param.page_index_end }&cuFlag=${ param.cuFlag }">${ cu_page }</a>
					</c:if>
					
					<c:if test="${ cu_page % 10 == 0 && (cu_all_Cnt - 10) == 0 }">
						<a href="curriListPro.do?cu_pageNum=${ param.page_index_end + 1 }&page_index_start=${ param.page_index_start + 10 }&page_index_end=${ param.page_index_end + 10 }">
							다음 ▶ </a>
					</c:if>
				</c:forEach>

			</div>


			<div style="margin-top: 1%">
				<a href="signForm.do">
				<input type="button" class="btn btn-default" value="추가" /></a> 
				<a href="signChartPro.do">
					<input type="submit" class="btn btn-default" data-target="#layerpop" data-toggle="modal" value="결재" />
				</a>
			</div>
	
		</form>
	</div>

	<div style="display: none"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/home_bootstrap.min.js"></script>
	
</body>
</html>