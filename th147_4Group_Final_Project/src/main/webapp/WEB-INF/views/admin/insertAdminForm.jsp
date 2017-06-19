<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>

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
    
    /* ***************** 아이디검색 ************************ */
    
   function inputCheck(f){
    	
       if(f.id.value==""){
		   alert("아이디를 입력해 주세요.");
		   // 폼 이름.input 태그명.커서 셋팅
		   f.id.focus();
		   // 프로그램 종료, 값을 돌려줌
		   return;
	   }
	   
	   if(f.pw.value==""){
		   alert("비밀번호를 입력해 주세요.");
		   f.pw.focus();
		   return;
	   }
	   // 비밀번호 확인하는 칸 추가
	   if(document.regForm.repw.value==""){
		   alert("비밀번호를 확인해 주세요");
		   document.regForm.repw.focus();
		   return;
	   }
		
	   //비밀번호 일치하는지 검사
	   if(document.regForm.pw.value != document.regForm.repw.value){
		   alert("비밀번호가 일치하지 않습니다.");
		   document.regForm.repw.focus();
		   return;
	   }
	   
	   if(document.regForm.name.value==""){
		   alert("이름을 입력해 주세요.");
		   document.regForm.name.focus();
		   return;
	   }
	   
		if(document.regForm.tel.vale==""){
			alert("연락처를 입력해 주세요.")
			document.regForm.tel.focus();
			return;
	   	}
	   
	 if(document.regForm.postcode.value==""){
		   alert("주소를 입력해 주세요.");
		   document.regForm.postcode.focus();
		   return;
	   }
		
	   if(document.regForm.email.value==""){
		   alert("이메일을 입력해 주세요.");
		   document.regForm.email.focus();
		   return;
	   }
	   
	   	var str=document.regForm.email.value;	//전자우편주소
	   	var atPos=str.indexOf('@');				//"@"의 처음 위치
	   	var atLastPos = str.lastIndexOf('@');	//"@"의 마지막 위치
	   	var dotPos = str.indexOf('.');			//.의 위치
	   	var spacePos = str.indexOf(' ');		//공백의 위치
	   	var commaPos = str.indexOf(',');		//,의 위치
	   	var eMailSize = str.length;				//메일주소의 길이
	   
	   	if(atPos > 1 && atPos == atLastPos &&
	   		dotPos > 3 && spacePos == -1 && commaPos == -1
	   		&& atPos +1 < dotPos && dotPos + 1 < eMailSize){
	   		//참일경우 별다른 처리 없음
	   	}else{
	   		alert('E-mail주소 형식이 잘못되었습니다. \n\n 다시 입력해 주세요!');
	   		document.regForm.email.focus();
	   		return;
	   	}
	   	
		f.submit();
   }
   		function idCheck(id){
   			//창을 화면 가운데로 이동합니다.
   			wx = 300; //open 할 윈도우의 크기, width
   			wy = 150; // height
   			sx = screen.width; //모니터 화면 크기
   			sy = screen.height;
   			x = (sx - wx)/2;
   			y = (sy - wy)/2;
   			
   			if(id ==""){
   				window.alert("아이디를 입력해 주세요.");
   				document.regForm.id.focus();
   			}else{ //id_check.jsp jsp파일 만들기
   				url="id_check.jsp?id=" + id; //URL Get Method
   				wr = window.open(url, "아이디검색", "width=300, height=150");
   				wr.moveTo(x,y);
   			}
   		}
   		
/*    		function openIdChk(){
   			
   			window.name = "parentForm";
   			window.open("idCheckForm.do", "chkForm", "width=500, height=300, resizable = no, scrolbars = no");
   		} */
   		
   	 function inputIdChk(){
         document.userInfo.idDuplication.value ="idUncheck";
     }
   	 
 	/* function chk_id(){
		var id = document.getElementById("id").value;

		if(id === "sinsang"){
			document.getElementById("idchk").innerHTML = "아이디가 중복되었습니다. 다시 입력해주세요.";
		} else if(id === "t10102"){
			document.getElementById("idchk").innerHTML = "아이디가 중복되었습니다. 다시 입력해주세요.";			
		}
		
	} */

</script>

</head>
<!-- onload인지 onLoad인지 보기 -->
<body bgcolor="#996600" onload="regForm.id.focus()">
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
		
	<div id="content" style="margin-top: 10%; margin-left: 10%">
		<form name="regForm" action="insertAdminPro.do" method="post">
			<h2>회원가입 Form</h2>
			<h3 class="hidden">관리자 페이지</h3>
	
			<h3 class="hidden">회원가입 폼</h3>
			<div id="join-form" class="join-form margin-large">

				<dl class="join-form-row">
					<dt class="join-form-title">아이디</dt>
					<dd class="join-form-data">
						<input type="text" name="id" id="id" onkeydown="inputIdChk()" placeholder="아이디"/> 
						<!-- <input type="button" value="ID중복확인" onclick="chk_id()"/> -->
						<p id="idchk" name="idchk"></p>
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">비밀번호</dt>
					<dd class="join-form-data">
						<input type="password" name="pw" placeholder="비밀번호(8자 이상)"/>
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">비밀번호 확인</dt>
					<dd class="join-form-data">
						<input type="password" name="repw" placeholder="비밀번호(8자 이상)"/>
					</dd>
				</dl>
				
				<!-- ***************** 비밀번호 재확인**************** -->

				<dl class="join-form-row">
					<dt class="join-form-title">이름</dt>
					<dd class="join-form-data">
						<input type="text" name="name" placeholder="이름"/>
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">성별</dt>
					<dd class="join-form-data">
						<select name="gender">
							<option value="male">남성</option>
							<option value="female">여성</option>
						</select>
					</dd>
				</dl>

				<dl class="join-form-row">
					<dt class="join-form-title">휴대폰 번호</dt>
					<dd class="join-form-data">
						<input type="text" name="tel" placeholder="휴대폰 번호  (-)를 포함하세요"/><span>[대시(-)를 포함할 것: 예)
							010-3456-2934]</span>
					</dd>
				</dl>
				<dl class="join-form-row">
					<dt class="join-form-title">주소</dt>
					<dd class="join-form-data">
						<input type="text" id="postcode" name="postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소">
						
					</dd>
				</dl>

				<dl class="join-form-row">
					<dt class="join-form-title">이메일</dt>
					<dd class="join-form-data">
						<input type="text" name="email" placeholder="ex)email@mail.com" />
					</dd>
				</dl>

				<dl class="join-form-row">
					<dt class="join-form-title">직급</dt>
					<dd class="join-form-data">
						<select name="level" placeholder="정확히 입력하세요">
							<option value="Role_Student">학생</option>
							<%-- <option>학부모<c:if test="${level == 학부모 }">자녀 이름 <input type="text" name="stName"></c:if></option> --%>
							<option value="Role_Parent" onclick="parent()">학부모</option>
							<option value="Role_Teacher">교사</option>
						</select>
					</dd>
				</dl>

				<dl class="join-form-row">
					<dt class="join-form-title">학부모의 자녀 이름</dt>
					<dd class="join-form-data">
						<input type="text" name="stName" placeholder="학부모만 입력하세요" />
					</dd>
				</dl>


				<dl class="join-form-row">
					<dt class="join-form-title">학년</dt>
					<dd class="join-form-data">
						<span style="color:#999999">교사는 담당반을 학부모는 자녀의 반을 선택하세요</span> <select name="grade">
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
							<option value="1">1반</option>
							<option value="2">2반</option>
							<option value="3">3반</option>
							<option value="4">4반</option>
							<option value="5">5반</option>
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
				<input class="btn-okay button" type="button" onclick="inputCheck(this.form)" value="가입" /><!-- type="submit"  -->
				<input class="btn-okay button" type="reset" value="다시쓰기" />
			</div>
		</form>

	</div>
	</div>
	<div style="margin-top: 15%; margin-left: 10%">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>