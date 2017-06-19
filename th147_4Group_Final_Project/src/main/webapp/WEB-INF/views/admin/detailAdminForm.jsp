<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="com.kosta.th147_4group.vo.MemberVO"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<head><jsp:include page="../home/head.jsp"></jsp:include>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>

</head>

<body>
	<div>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	
	<!-- 전체 상자 div-->
	<div class="main"><!-- style="margin-top:2%;"	--> 
	
	<!-- 사이드바 -->
	<div class="Left_bar"style="margin-left: 3%; margin-right: 8%; float:left; height:800px;" >
	<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"> <b>학생마당</b></font></p>
		<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
       		<li class="side_li"><a href="${pageContext.request.contextPath}/studentboard/adminPro.do?s_pageNum=1"><font face="휴먼엽서체" size="3" color="black">전체 회원정보 보기</font></a></li>
       		<li class="side_li"><a href="${pageContext.request.contextPath}/studentboard/updateAdmin.do?s_pageNum=1"><font face="휴먼엽서체" size="3" color="black">전체 회원정보 수정</font></a></li>
       		<!-- ***************** 추가하기 ********************* -->
       		<li class="side_li"><a href="${pageContext.request.contextPath}/studentboard/history.do?s_pageNum=1"><font face="휴먼엽서체" size="3" color="black">History</font></a></li>
      	</ul>
	</div>
			
	<div id="content" style="margin-top: 15%; margin-left: 10%">
		<form action="updateAdmin.do" method="post">
			<h2>회원정보</h2>
			<h3 class="hidden">과닐자 페이지 로그</h3>
			<!-- <p id="breadscrumb" class="block_hlist clear">
				<img alt="Step1 개인정보 등록" src="images/step2.png" />
			</p> -->
			<h3 class="hidden">회원수정 폼</h3>
			<div id="join-form" class="join-form margin-large">

				<dl class="join-form-row">
					<dt class="join-form-title">회원번호</dt>
					<dd class="join-form-data">
						<input type="text" name="num" value="${smVo.num}"/>
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">아이디</dt>
					<dd class="join-form-data">
						<input type="hidden" name="id" value="${ smVo.id }"/>
						${ smVo.id }
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">비밀번호 수정</dt>
					<dd class="join-form-data">
						<input type="password" name="pw" value="${smVo.pw}"/>
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
						<input type="text" name="name" value=${ smVo.name } />
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">성별</dt>
					<dd class="join-form-data">
						<select name="gender">
							<c:choose>
								<c:when test="${ smVo.gender eq 'man'}">
									<option value="male">남성</option>
									<option value="female">여성</option>
								</c:when>
								<c:when test="${ smVo.gender eq 'woman'}">
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
						<input type="text" name="tel" value="${ smVo.tel }" /><span>[대시(-)를
							포함할 것: 예) 010-3456-2934]</span>
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">주소</dt>
					<dd class="join-form-data">
						<span id="guide" style="color:#999"> 예) 경기도 성남시 분당구 </span>
						
						<input type="text" id="postcode" placeholder="우편번호" value="${ smVo.postcode}">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="roadAddress" placeholder="도로명주소" value="${smVo.roadAddress}">
						<input type="text" id="jibunAddress" placeholder="지번주소" value="${smVo.jibunAddress}">
					</dd>
				</dl>

				<dl class="join-form-row">
					<dt class="join-form-title">이메일</dt>
					<dd class="join-form-data">
						<input type="text" name="email" value="${smVo.email}" />
					</dd>
				</dl>
				
					<dl class="join-form-row">
						<dt class="join-form-title">학부모의 자녀 이름</dt>
						<dd class="join-form-data">
							<input type="text" name="stName" value="${smVo.stName} }"/> 자녀의 이름을 정확하게 입력하세요(학부모만
							해당)
						</dd>
					</dl>
				


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
					<dt class="join-form-title">직급</dt>
					<dd class="join-form-data">
						<select name="level">
							<option value="${smVo.level}">${smVo.level}</option>
							<option value="Role_Studnet">학생</option>
							<option value="Role_Parent">학부모</option>
							<option value="Role_Teacher">일반교사</option>
							<option value="Role_submaster">교감</option>
							<option value="Role_Principal">교장</option>
						</select>
					</dd>
				</dl>

				<dl class="join-form-row">

					<dt class="join-form-title">sms 동의 여부 수정</dt>
					<dd class="join-form-data">

						<select name="sms">
							<c:choose>
								<c:when test="${ smVo.sms eq 'o'}">
									<option value="o">동의</option>
									<option value="x">동의하지 않음</option>
								</c:when>
								<c:when test="${ smVo.sms eq 'x'}">
									<option value="x">동의하지 않음</option>
									<option value="o">동의</option>
								</c:when>
							</c:choose>
						</select>

					</dd>
				</dl>

			</div>
			<div id="buttonLine">
				<input type="button" onclick="window.location='adminPro.do?s_pageNum=1'" value="목 록"> 
				<input class="btn-okay button" type="submit" value="수정" />
				
			</div>
		</form>
	</div>
	</div>
	<div style="margin-top: 15%; margin-left: 10%">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
	
</body>