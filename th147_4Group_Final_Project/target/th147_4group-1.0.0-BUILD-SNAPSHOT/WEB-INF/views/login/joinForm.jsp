<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<head><jsp:include page="../home/head.jsp"></jsp:include></head>

<body>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	<div id="content" style="margin-top: 10%; margin-left: 10%">
		<form action="join.do" method="post">
			<h2>회원가입</h2>
			<h3 class="hidden">방문페이지 로그</h3>
			<p id="breadscrumb" class="block_hlist clear">
				<img alt="Step1 개인정보 등록" src="images/step2.png" />
			</p>
			<h3 class="hidden">회원가입 폼</h3>
			<div id="join-form" class="join-form margin-large">


				<dl class="join-form-row">
					<dt class="join-form-title">아이디</dt>
					<dd class="join-form-data">
						<input type="text" name="id" /> <input id="btnCheckUid"
							class="button" type="button" value="중복확인" />
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">비밀번호</dt>
					<dd class="join-form-data">
						<input type="password" name="pw" />
					</dd>
				</dl>

				<dl class="join-form-row">
					<dt class="join-form-title">이름</dt>
					<dd class="join-form-data">
						<input type="text" name="name" />
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">성별</dt>
					<dd class="join-form-data">
						<select name="gender">
							<option value="man">남성</option>
							<option value="woman">여성</option>
						</select>
					</dd>
				</dl>

				<dl class="join-form-row">
					<dt class="join-form-title">핸드폰 번호</dt>
					<dd class="join-form-data">
						<input type="text" name="tel" /><span>[대시(-)를 포함할 것: 예)
							010-3456-2934]</span>
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">주소</dt>
					<dd class="join-form-data">
						<input type="text" name="site" /> <span>예) 경기도 성남시 분당구</span>
					</dd>
				</dl>

				<dl class="join-form-row">
					<dt class="join-form-title">이메일</dt>
					<dd class="join-form-data">
						<input type="text" name="email" />
					</dd>
				</dl>

				<dl class="join-form-row">
					<dt class="join-form-title">직급</dt>
					<dd class="join-form-data">
						<select name="level">
							<option value="Role_Student">학생</option>
							<%-- <option>학부모<c:if test="${level == 학부모 }">자녀 이름 <input type="text" name="stName"></c:if></option> --%>
							<option value="Role_Parent">학부모</option>
							<option value="Role_Teacher">교사</option>
						</select>
					</dd>
				</dl>

				<dl class="join-form-row">
					<dt class="join-form-title">학부모의 자녀 이름</dt>
					<dd class="join-form-data">
						<input type="text" name="stName" />
					</dd>
				</dl>


				<dl class="join-form-row">
					<dt class="join-form-title">학년</dt>
					<dd class="join-form-data">
						<span>교사는 담당반을 학부모는 자녀의 반을 선택하세요</span> <select name="grade">
							<option value="1학년">1학년</option>
							<option value="2학년">2학년</option>
							<option value="3학년">3학년</option>
							<option value="4학년">4학년</option>
							<option value="5학년">5학년</option>
							<option value="6학년">6학년</option>
						</select>
					</dd>
					<dd class="join-form-data">
						<select name="schoolClass">
							<option value="1반">1반</option>
							<option value="2반">2반</option>
							<option value="3반">3반</option>
							<option value="4반">4반</option>
							<option value="5반">5반
								</o ption>
						</select>
					</dd>
				</dl>

				<dl class="join-form-row">

					<dt class="join-form-title">sms 동의 여부</dt>
					<dd class="join-form-data">
						<select name="sms">
							<option>동의</option>
							<option>동의하지 않음</option>
						</select>
					</dd>
				</dl>

			</div>
			<div id="buttonLine">
				<input class="btn-okay button" type="submit" value="가입" />
			</div>
		</form>

	</div>
</body>