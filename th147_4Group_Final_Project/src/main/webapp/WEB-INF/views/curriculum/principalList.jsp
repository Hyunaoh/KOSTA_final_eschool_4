<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 교장페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<div>
		<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	
	<div style="margin-top: 15%; margin-left: 10%">
	
		<form action="principalListPro.do">
		
			<select id="cuGrade" name="cuGrade" class="btn btn-default">
				<option value="${ param.cuGrade }">${ param.cuGrade }학년</option>
				
				<c:forEach begin="1" end="6" step="1" var="i" varStatus="status">
					<c:if test="${ i ne param.cuGrade }">
						<option value="${ i }">${ i }학년</option>
					</c:if>
				</c:forEach>
				
			</select>
			
			<select id="cuClass" name="cuClass" class="btn btn-default">
				<option value="${ param.cuClass }">${ param.cuClass }반</option>
				
				<c:forEach begin="1" end="3" step="1" var="i" varStatus="status">
					<c:if test="${ i ne param.cuClass }">
						<option value="${ i }">${ i }반</option>
					</c:if>
				</c:forEach>
				
			</select>
			
			<input type="submit" class="btn btn-default" value="찾기"/>
			
		</form>
			
			<p id="principalListChoice" style="margin-top: 1%;">
		
			<a href="principalListPro.do?cuGrade=${ param.cuGrade }&cuClass=${ param.cuClass }">
				<input type="button" class="btn btn-default" value="전체">
			</a>
<%-- 			<a href="principalListPro.do?cuFlag=0&cuGrade=${ param.cuGrade }&cuClass=${ param.cuClass }">
				<input type="button" class="btn btn-default" value="대기">
			</a>
			<a href="principalListPro.do?cuFlag=1&cuGrade=${ param.cuGrade }&cuClass=${ param.cuClass }">
				<input type="button" class="btn btn-default" value="승인">
			</a>
			<a href="principalListPro.do?cuFlag=2&cuGrade=${ param.cuGrade }&cuClass=${ param.cuClass }">
				<input type="button" class="btn btn-default" value="반려">
			</a> --%>
			
			</p>
		
	<form action="signChartPro.do" method="post">
			<table style="width: 90%" class="table">
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
					<th><label>결재여부</label></th>
					<th><label>승인여부</label></th>
					<th><label>결재날짜</label></th>
					
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
								<th><input type="hidden" name="cuSign2"
									value="${ vo.cuSign }" /> 
								<c:if test="${ vo.cuSign eq '3' }">
									미결재
								</c:if> 
								<c:if test="${ vo.cuSign eq '2' }">
									결재반려 : <p> ${ vo.cuSignComment1 } </p>
								</c:if> 
								<c:if test="${ vo.cuSign eq '1' }">
									결재승인
								</c:if> 
								<c:if test="${ vo.cuSign eq '0' }">
									결재대기
								</c:if>
								</th>
								
								<th>
								<input type="hidden" name="cuSign2"
									value="${ vo.cuSign2 }" /> 
								<c:if test="${ vo.cuSign2 eq '2' }">
									결재반려
								</c:if> 
								<c:if test="${ vo.cuSign2 eq '1' }">
									최종승인완료
								</c:if> 
								<c:if test="${ vo.cuSign2 eq '0' }">
									<a href="principalApproveSign.do?sign=1&cuRnum=${ vo.cuRnum }"><input type="button" value="승인" class="btn btn-default"/></a>
									<a href="principalApproveSign.do?sign=2&cuRnum=${ vo.cuRnum }"><input type="button" value="반려" class="btn btn-default"/></a>
								</c:if>
								</th>
								<th>
									${ vo.cuSignDate2 }
								</th>
							</tr>
						</c:forEach>
					</c:if>
				</c:forEach>
			</table>
			
			<div align="center">

				<c:forEach var="cu_page" items="${ cu_pageList }" varStatus="status" begin="${ param.page_index_start }" end="${ param.page_index_end }">
					<c:if test="${ cu_page % 10 == 1 && cu_page != 1 }">
						<a href="principalListPro.do?cu_pageNum=${ param.page_index_start - 1 }&page_index_start=${ param.page_index_start - 10 }&page_index_end=${ param.page_index_end - 10 }">
							◀ 이전</a>
					</c:if>
					
					<c:if test="${ cuFlag eq null }">
						<a href="principalListPro.do?cu_pageNum=${ cu_page }">${ cu_page }</a>
					</c:if>
					<c:if test="${ cuFlag ne null}">
						<a href="principalListPro.do?cu_pageNum=${ cu_page }&cuFlag=${ param.cuFlag }">${ cu_page }</a>
					</c:if>
					
					<c:if test="${ cu_page % 10 == 0 && (cu_all_Cnt - 10) == 0 }">
						<a href="principalListPro.do?cu_pageNum=${ param.page_index_end + 1 }&page_index_start=${ param.page_index_start + 10 }&page_index_end=${ param.page_index_end + 10 }">
							다음 ▶ </a>
					</c:if>
				</c:forEach>

			</div>

		
		</form>
	</div>
	
	
	<div style="margin-top: 15%; margin-left: 10%">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>