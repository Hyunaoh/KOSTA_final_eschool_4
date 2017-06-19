<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<head>
<jsp:include page="head.jsp"></jsp:include>

</head>

<div class="navbar-wrapper" style="margin-top:0px; margin-left:0px;position:fixed;width:100%;">
  <div class="container">
    <div class="navbar navbar-inverse navbar-static-top">
      
      <div class="navbar-header">
	    <a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	    </a>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
        <div style="margin-left:10%;"><img style="width: 110px; height : 75px;" src="${pageContext.request.contextPath}/resources/img_main/logo_2.jpg"></div>
        </a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
          
					<li><a> 
					<se:authorize ifAnyGranted="Role_Student">
					<font color="#A6A6A6" size="2"><b>학생 여러분 환영합니다.</b></font>
					</se:authorize> 
					<se:authorize ifAnyGranted="Role_Teacher">
					<cl:if test="${ sessionScope.id ne 'principal' }">
					<font color="#A6A6A6" size="2"><b>선생님 환영합니다.</b></font>
					</cl:if>
					<cl:if test="${ sessionScope.id eq 'principal' }">
					<font color="#A6A6A6" size="2"><b>교장선생님 환영합니다.</b></font>
					</cl:if>
					</se:authorize> 
					<se:authorize ifAnyGranted="Role_Parent">
					<font color="#A6A6A6" size="2"><b>학부모님 환영합니다.</b></font>
					</se:authorize> 
					<se:authorize ifAnyGranted="Role_Admin">
					<font color="#A6A6A6" size="2"><b>admin님 환영합니다.</b></font>
					</se:authorize>
					</a></li>
					
			<se:authorize ifAnyGranted="Role_Admin">
				<li class="dropdown">
				 <a href="#" class="dropdown-toggle" data-toggle="dropdown"><font face="Comic Sans MS" size="3" >Admin</font><br>Page<b class="caret"></b></a>
	              <ul class="dropdown-menu">
	                <li><a href="${pageContext.request.contextPath}/admin/adminPro.do?s_pageNum=1">전체 회원정보 보기</a></li>
	              </ul>
	            </li>
			</se:authorize>
			
			<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><font face="Comic Sans MS" size="3" >School</font><br>Information<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoDetail.do">학교정보</a></li>
                <li><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoGreeting.do">교장 인사말</a></li>
                <li><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoSearch.do">학교위치</a></li>
                <li class="divider"></li>
                <li><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoTeacher.do">선생님 정보</a></li>
              </ul>
            </li>
            <cl:if test="${ sessionScope.level eq 'Role_Teacher' or sessionScope.level eq 'Role_Student' }">
            <li class="dropdown">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown"><font face="Comic Sans MS" size="3" >Student</font><br>board<b class="caret"></b></a>
              <ul class="dropdown-menu">
                 <li><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=student">건의사항</a></li>
                 <li><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=vio">학교폭력</a></li>
                 <li><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=vio2">가정폭력</a></li>
              </ul>
            </li>
              </cl:if>
			
			<cl:if test="${ sessionScope.level eq 'Role_Parent' or sessionScope.level eq 'Role_Teacher' }">
            <li class="dropdown">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown"><font face="Comic Sans MS" size="3" >Parent</font><br>board<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=suggest">건의사항</a></li>
                <li><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=counsel">자녀상담</a></li>
              </ul>
            </li>
            </cl:if>
            
            
            <li class="dropdown">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown"><font face="Comic Sans MS" size="3" >Dreams</font><br>ComeTrue<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/hope/boardList.do">꿈이 뭔가요?</a></li>
                <li><a href="${pageContext.request.contextPath}/courseedums/boardList.do">중학진로</a></li>
              </ul>
            </li>
            <li class="dropdown">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown"><font face="Comic Sans MS" size="3" >Curriculum</font><br>School<b class="caret"></b></a>
              <ul class="dropdown-menu">
               <cl:if test="${ sessionScope.level eq 'Role_Teacher' }">
 					<li><a href="${pageContext.request.contextPath}/curriculum/signChartPro.do">커리큘럼</a></li>                
 						<cl:if test="${ sessionScope.id ne 'principal' and  sessionScope.id ne 'submaster'}">
                	<li><a href="${pageContext.request.contextPath}/curriculum/curriListPro.do?grade=${ sessionScope.grade }&mClass=${ sessionScope.mClass }&level=Role_Teacher">전자결재</a></li>
                		</cl:if>
                <cl:if test="${ sessionScope.id eq 'principal' }">
                	<li><a href="${pageContext.request.contextPath}/curriculum/principalListPro.do">전자결재(교장)</a></li>
                </cl:if>
                <cl:if test="${ sessionScope.id eq 'submaster' }">
                	<li><a href="${pageContext.request.contextPath}/curriculum/principalListPro.do">전자결재(교감)</a></li>
                </cl:if>
               </cl:if>
                	<li><a href="${pageContext.request.contextPath}/homeworkboard/boardList.do">숙제/준비물</a></li>
                	<li><a href="${pageContext.request.contextPath}/schedule/selectAll.do">학사일정</a></li>
                	<se:authorize ifAnyGranted="Role_Teacher">
					<li><a href="${pageContext.request.contextPath}/schedule/controllerSchedule.do">학사일정수정</a></li>
					</se:authorize> 
              </ul>
            </li>
            <li class="dropdown">
           	<a href="#" class="dropdown-toggle" data-toggle="dropdown"><font face="Comic Sans MS" size="3" >Attendance</font><br>Class<b class="caret"></b></a>
              <ul class="dropdown-menu">
               <li><a href="${pageContext.request.contextPath}/attendance/attendanceBasic.do">등/하교</a></li>
       				<se:authorize ifAnyGranted="Role_Teacher, Role_Admin">
						<li><a href="${pageContext.request.contextPath}/attendance/classGrade.do">출석부관리</a></li>
					</se:authorize>
              </ul>
            </li>
            
            <cl:if test="${ sessionScope.level eq 'Role_Teacher' or sessionScope.level eq 'Role_Parent' or sessionScope.level eq 'Role_Admin' }">
            <se:authorize ifAnyGranted="Role_Teacher, Role_Parent, Role_Admin">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><font face="Comic Sans MS" size="3" >Message</font><br>Sending<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/message/messageForm.do">보낸사람</a></li>
                <li><a href="${pageContext.request.contextPath}/message/getMessage.do">받는사람</a></li>
              </ul>
            </li>
            </se:authorize>
            </cl:if>
            
            <se:authorize access="isAnonymous()">
			<li>
           	<a href="${pageContext.request.contextPath}/login/loginForm.do"><font face="Comic Sans MS" size="3" >Login</font></a>
            </li>
            </se:authorize>
 
			<se:authorize access="isAuthenticated()">
			<li>
            <a href="${CONTEXT}/j_spring_security_logout"><font face="Comic Sans MS" size="3" >Logout</font></a>
            </li>
            
            <li>
            <a href="${pageContext.request.contextPath}/login/loginUpdateForm.do?id=${ sessionScope.id }">
            <font face="Comic Sans MS" size="3" >회원수정</font></a>
            </li>
          	</se:authorize>

            
          </ul>
        </div>

    </div>
  </div><!-- /container -->
</div><!-- /navbar wrapper -->
	
