<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<head>
<jsp:include page="head.jsp"></jsp:include>
</head>

<div class="navbar-wrapper">
  <div class="container">
    <div class="navbar navbar-inverse navbar-static-top">
      
      <div class="navbar-header">
	    <a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	    </a>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">ESCHOOL</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
          	<%-- <se:authentication property="principal" var="user"/>
          	${ user.id } --%>
					<li><a> 
					<se:authorize ifAnyGranted="Role_Student">
					 학생 여러분 환영합니다.
					</se:authorize> 
					<se:authorize ifAnyGranted="Role_Teacher">
					선생님 환영합니다.
					</se:authorize> 
					<se:authorize ifAnyGranted="Role_Parent">
					학부모님 환영합니다.
					</se:authorize> 
					<se:authorize ifAnyGranted="Role_Admin">
					admin님 환영합니다.
					</se:authorize>
					</a></li>
					<li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">학교안내<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoDetail.do">학교정보</a></li>
                <li><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoGreeting.do">교장 인사말</a></li>
                <li><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoSearch.do">학교위치</a></li>
                <li class="divider"></li>
                <li><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoTeacher.do">선생님 정보</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">학생마당<b class="caret"></b></a>
              <ul class="dropdown-menu">
                 <li><a href="${pageContext.request.contextPath}/studentboard/studentProposalPro.do?s_pageNum=1">건의사항</a></li>
                <li><a href="">상담게시판</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">학부모마당<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=suggest">건의사항</a></li>
                <li><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=counsel">자녀상담</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">진로진학<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">꿈이 뭔가요?</a></li>
                <li><a href="#">중학진로</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">교육과정<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/curriculum/curriListPro.do?grade=${ sessionScope.grade }&mClass=${ sessionScope.mClass }&level=${ sessionScope.level }">커리큘럼</a></li>
                <%-- <se:authorize ifAnyGranted="Role_Teacher"> --%>
                <li><a href="${pageContext.request.contextPath}/curriculum/signForm.do">전자결재</a></li>
                <%-- </se:authorize> --%>
                <li><a href="${pageContext.request.contextPath}/homeworkboard/board1List.do">숙제/준비물</a></li>
                <li><a href="#">학사일정</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">출석부<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/attendance/attendanceBasic.do">등/하교</a></li>
                <li><a href="#">출석부관리</a></li>
              </ul>
            </li>
            
            <se:authorize ifAnyGranted="Role_Teacher, Role_Parent, Role_Admin">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">쪽지<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/message/messageForm.do">보낸사람</a></li>
                <li><a href="${pageContext.request.contextPath}/message/getMessage.do">받는사람</a></li>
              </ul>
            </li>
            </se:authorize>
            
            <se:authorize access="isAnonymous()">
			<li>
           	 <a href="${pageContext.request.contextPath}/login/loginForm.do">로그인</a>
            </li>
            </se:authorize>
 
			<se:authorize access="isAuthenticated()">
			<li>
            <a href="${CONTEXT}/j_spring_security_logout">로그아웃</a>
            </li>
            
            <li>
            <a href="${pageContext.request.contextPath}/login/loginUpdateForm.do?id=${ sessionScope.id }">회원수정</a>
            </li>
          	</se:authorize>

            
          </ul>
        </div>

    </div>
  </div><!-- /container -->
</div><!-- /navbar wrapper -->
