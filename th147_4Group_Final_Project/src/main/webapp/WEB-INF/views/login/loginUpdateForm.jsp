<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="com.kosta.th147_4group.vo.MemberVO"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<%-- <%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();

	Object principal = auth.getPrincipal();
	String id = "";
	if(principal !=null && principal instanceof MemberVO){
		id= ((MemberVO)principal).getId();
	}
%> --%>


<head><jsp:include page="../home/head.jsp"></jsp:include></head>

<body>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	<div id="content" style="margin-top: 15%; margin-left: 10%">
		<form action="loginUpdatePro.do" method="post">
			<h2>회원정보 수정</h2>
			<h3 class="hidden">방문페이지 로그</h3>
			<!-- <p id="breadscrumb" class="block_hlist clear">
				<img alt="Step1 개인정보 등록" src="images/step2.png" />
			</p> -->
			<h3 class="hidden">회원수정 폼</h3>
			<div id="join-form" class="join-form margin-large">


				<dl class="join-form-row">
					<dt class="join-form-title">아이디</dt>
					<dd class="join-form-data">
						<se:authentication property="name" var="LoingUser" />
						${ sessionScope.id } <input type="hidden" name="id"
							value="${ param.id }">
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">비밀번호 수정</dt>
					<dd class="join-form-data">
						<input type="password" name="pw" value="${vo.pw}"></input>
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">수정할 비밀번호 확인</dt>
					<dd class="join-form-data">
						<c:if test=""></c:if>
					</dd>
				</dl>

				<dl class="join-form-row">
					<dt class="join-form-title">이름</dt>
					<dd class="join-form-data">
						<input type="text" name="name" value=${ vo.name } />
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">성별</dt>
					<dd class="join-form-data">
						<select name="gender">
							<c:choose>
								<c:when test="${ vo.gender eq 'male'}">
									<option value="male">남성</option>
									<option value="female">여성</option>
								</c:when>
								<c:when test="${ vo.gender eq 'female'}">
									<option value="female">여성</option>
									<option value="male">남성</option>
								</c:when>
							</c:choose>
						</select>
					</dd>
				</dl>

				<dl class="join-form-row">
					<dt class="join-form-title">핸드폰 번호</dt>
					<dd class="join-form-data">
						<input type="text" name="tel" value="${ vo.tel }" /><span>[대시(-)를
							포함할 것: 예) 010-3456-2934]</span>
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">주소</dt>
					<dd class="join-form-data">
						<input type="text" name="site" value="${vo.site }" /> <span>예)
							경기도 성남시 분당구</span>
					</dd>
				</dl>

				<dl class="join-form-row">
					<dt class="join-form-title">이메일</dt>
					<dd class="join-form-data">
						<input type="text" name="email" value="${vo.email}" />
					</dd>
				</dl>

				<se:authorize ifAnyGranted="Role_Parent">
					<dl class="join-form-row">
						<dt class="join-form-title">학부모의 자녀 이름</dt>
						<dd class="join-form-data">
							<input type="hidden" name="stName"> 자녀의 이름을 정확하게 입력하세요(학부모만
							해당)
						</dd>
					</dl>
				</se:authorize>


				<dl class="join-form-row">
					<dt class="join-form-title">학년</dt>
					<dd class="join-form-data">
						<span>교사는 담당반 / 학부모는 자녀의 반을 선택하세요</span>
						<select name="grade">
							<option value="1">1학년</option>
							<option value="2">2학년</option>
							<option value="3">3학년</option>
							<option value="4">4학년</option>
							<option value="5">5학년</option>
							<option value="6">6학년</option>
						</select>
					</dd>

					<dd class="join-form-data">
						<select name="schoolClass">

							<c:choose>
								<c:when test="${ schoolClass eq 1 }">
									<option value="1">1반</option>
								</c:when>
								<c:when test="${ schoolClass eq 2 }">
									<option value="2">2반</option>
								</c:when>
								<c:when test="${ schoolClass eq 3 }">
									<option value="3">3반</option>
								</c:when>
								<c:otherwise>
									<option value="1">1반</option>
									<c:set var="schoolClass" value="1"/>
								</c:otherwise>
							</c:choose>
							

							<c:forEach var="i" varStatus="status" step="1" begin="1" end="3">
								<c:if test="${ schoolClass ne i }">
									<option value="${ i }">${ i }반</option>
									<c:set var="schoolClass" value="${ i }"/>
								</c:if>
							</c:forEach>

						</select>
					</dd>
				</dl>

				<dl class="join-form-row">

					<dt class="join-form-title">sms 동의 여부 수정</dt>
					<dd class="join-form-data">

						<select name="sms">
							<c:choose>
								<c:when test="${ vo.sms eq 'o'}">
									<option value="o">동의</option>
									<option value="x">동의하지 않음</option>
								</c:when>
								<c:when test="${ vo.sms eq 'x'}">
									<option value="x">동의하지 않음</option>
									<option value="o">동의</option>
								</c:when>
							</c:choose>
						</select>

					</dd>
				</dl>

			</div>
			<div id="buttonLine">
				<input class="btn-okay button" type="submit" value="수정" />
				<!-- <delete value="삭제"> -->
			</div>
		</form>

	</div>
</body>