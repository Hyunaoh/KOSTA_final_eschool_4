<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin list form</title>
</head>

<jsp:include page="../home/head.jsp"></jsp:include>

<body>

<!-- 전체 구성 -->
	<div style="height:1050px; box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.25);"> <!-- body에 해당 -->
	<!-- 게시판 전체 상자 -->
	<div>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	
	<!-- 전체 상자 div-->
	<div class="main"><!-- style="margin-top:2%;"	--> 
	
	<!-- 사이드바 -->
	<%-- <div class="Left_bar"style="margin-left: 3%; margin-right: 8%; margin-top:5%; float:left; height:500px;" >
	<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"> <b>Admin Page</b></font></p>
		<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
       		<li class="side_li"><a href="${pageContext.request.contextPath}/admin/adminPro.do?s_pageNum=1"><font face="휴먼엽서체" size="3" color="black">전체 회원정보 보기</font></a></li>
       		<li class="side_li"><a href="${pageContext.request.contextPath}/studentboard/updateAdmin.do?s_pageNum=1"><font face="휴먼엽서체" size="3" color="black">전체 회원정보 수정</font></a></li>
       		<!-- ***************** 추가하기 ********************* -->
       		<li class="side_li"><a href="${pageContext.request.contextPath}/studentboard/history.do?s_pageNum=1"><font face="휴먼엽서체" size="3" color="black">History</font></a></li>
      	</ul>
	</div> --%>

	<div style=" margin-left: 10%; margin-top: 8%; "><!-- -->
		<div class="board_header"style="margin-left: 10%; width: 90%; height:150px;	
				padding-left:3%;"> <!-- border-radius:5%; background-color:#dafffd;  그림자  box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.25); --> 
			<!-- <div style="width:40%;"> -->
			<div style="float: left;"><font size="28px"><br><strong>회원관리</strong> </font></div>	
			
			<div style="float: left; ">
				<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/board/studentboard/b_1.gif" class="board_img" 
				style="height: auto; width:130px; margin-top:15%; margin-left:30%; ">  <!-- border-radius:0.81rem; box-shadow: 0px 2px 8px 0px rgba(0,0,0,.25); -->
			</div>
			
		</div>
		<hr>
	</div>
		<form action="detailAdmin.do">
			
			<table style="width: 90%; margin-left:10%;" class="table">
				<tr>
					<th><label>번호</label></th>
					<th><label>id</label></th>
					<th><label>이름</label></th>
					<th><label>학년</label></th>
					<th><label>반</label></th>
					<th><label>전화번호</label></th>
					<th><label>주소</label></th>
					<th><label>Email</label></th>
					<th><label>직급</label></th>
					<th><label>학생자녀</label></th>
					<th><label>SMS</label></th>
					<th><label>gender</label></th>
					<!-- <th><label>가입날짜</label></th> -->
					<th></th>
				</tr>

				<c:forEach var="mVo2" items="${ s_nowPage }" varStatus="status">
					<c:if test="${ status.index+1 eq param.s_pageNum }">
						<c:forEach var="mVo" items="${ mVo2.value }">
							<tr id="mes_fors_hidden" name="mes_fors_hidden">
								
								
								<!-- num -->
								<th>${ mVo.num }</th>
								<!-- id -->
								<th><input type="hidden" name="id" id="id"
									value="${ mVo.id }">${ mVo.id }</th>
								<!-- 이름 -->
								<th><a href="detailAdmin.do?num=${ mVo.num }"><input type="hidden" name="name" id="name" 
									value="${ mVo.name }">${ mVo.name} </a></th>
								<!-- grade -->
								<th><input type="hidden" name="sms" id="sms"
									class="me_form" value="${ mVo.grade }">${ mVo.grade }</th>
								<!-- schoolClass -->
								<th><input type="hidden" name="schoolClass" id="schoolClass"
									class="me_form" value="${ mVo.schoolClass }">${ mVo.schoolClass }</th>
								<!-- tel -->
								<th><input type="hidden" name="tel" id="tel"
									class="me_form" value="${ mVo.tel }">${ mVo.tel }</th>
								<!-- site -->
								<%-- <th><input type="hidden" name="site" id="postcode"
									value="${ mVo.postcode }">${ mVo.postcode }</th> --%>
								<th><input type="hidden" name="site" id="postcode"
									value="${ mVo.roadAddress }">${ mVo.roadAddress }</th>
								<%-- <th><input type="hidden" name="site" id="postcode"
									value="${ mVo.jibunAddress }">${ mVo.jibunAddress }</th> --%>
								<!-- email -->
								<th><input type="hidden" name="email" id="email"
									 value="${ mVo.email }" /></th>
								<!-- level -->
								<th><input type="hidden" name="level" id="level"
									value="${ mVo.level }"> ${ mVo.level }</th>
								<!-- stName -->
								<th><input type="hidden" name="stName" id="stName"
									class="me_form" value="${ mVo.stName }">${ mVo.stName }</th>
								<!-- sms -->
								<th><input type="hidden" name="sms" id="sms"
									class="me_form" value="${ mVo.sms }">${ mVo.sms }</th>
								<!-- gender -->
								<th><input type="hidden" name="gender" id="gender"
									class="me_form" value="${ mVo.gender }">${ mVo.gender }</th>
								<!-- date -->
								<%-- <th><input type="hidden" name="date" id="date"
									value="${ mVo.date }" />${ mVo.date }</th> --%>
								
								<th><a href="deleteAdmin.do?num=${ mVo.num }">
										<input type="button" value="삭제" />
								</a></th>
								<th></th>
								
								
							</tr>
						</c:forEach>
					</c:if>
				</c:forEach>
			</table>

			<br />
			<div style="margin-bottom:1%; margin-left:10%">
				<a href="insertAdminForm.do"><input type="button" value="회원추가" class="btn btn-default"/></a>
			</div>
			<br/>
			
			<div align="center">
				<c:forEach var="s_page" items="${ s_pageList }" varStatus="status" begin="${ param.page_index_start }" end="${ param.page_index_end }">
					<c:if test="${ s_page % 5 == 1 && s_page != 1 }">
						<a href="adminPro.do?page_index_start=${ param.page_index_start - 5 }&page_index_end=${ param.page_index_end - 5 }">
							◀ 이전</a>
					</c:if>
					<a href="adminPro.do?s_pageNum=${ s_page }">${ s_page }</a>
					<%-- <c:set value="${ s_pageList[status.index] }" var="page" /> --%>
					
				</c:forEach>
			</div>

		</form>
			<br/>
			
			<!-- 검색창 -->
		<div align="center">
			<form action="searchPro.do">
				<select name="search" id="search" class="searchContext">
					<option value="cuGrade">학년</option>
					<option value="cuClass">반</option>
					<option value="cuMessage">내용</option>
					<option value="cuDate">날짜</option>
					<option value="cuName">이름</option>
					<option value="cuCategoly">카테고리</option>
					<option value="cuBungi">분기</option>
				</select> 
					<input type="text" name="searchText" id="searchText" placeholder="검색어를 입력하세요" required /> 
					<input type="submit" value="검색" />
			</form>
		</div>
	</div>
	</div>
	

	<div ><!-- style="margin-top: 15%; margin-left: 10%" -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>


</body>
</html>