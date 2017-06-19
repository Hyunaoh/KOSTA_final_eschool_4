<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>${boardNm }</title>
<script type="text/javascript">
	function check() {
		var form = document.getElementById("writeForm");
		  if (form.title.value.length < 1) {
			   alert("제목을 입력해주세요.");
			   form.title.focus();
			   return false;
		  }
		  
		  if (form.content.value.length < 1) {
			   alert("내용을 입력해주세요.");
			   form.content.focus();
			   return false;
		  }
		  
 		  if (form.upload.value.length < 1) {
			  var chk = confirm("파일 첨부 없이 게시글 등록을 하시겠습니까?");
			  if(chk == true){
				  return true;
			  }
			   form.upload.focus();
			    return false;
		  } 
	}

	function goList() {
		var form = document.getElementById("listForm");
		form.submit();
	}
</script>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<!-- 전체구성 -->
	<div style=" box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.25);"> <!-- body에 해당 -->
	
	<!-- 게시판 전체 상자 -->
	<div>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	
	<!-- <!-- 전체 상자 div-->
	<div class="main" style="height:1900px;"> <!-- style="margin-top:2%;"-->
	
	<!-- 사이드바 -->
	<div class="Left_bar"style="margin-left: 3%; margin-right: 8%; margin-top:5%; float:left; height:1800px;" >
	<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"> <b>학부모 마당</b></font></p>
		<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
       		<li class="side_li"><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=suggest"><font face="휴먼엽서체" size="3" color="black">건의사항</font></a></li>
       		<li class="side_li"><a href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=counsel"><font face="휴먼엽서체" size="3" color="black">자녀상담</font></a></li>
      	</ul>
	</div>
	<div style="margin-top: 8%; margin-left: 10%">
	
	<div class="board_header"style="margin-left: 10%; width: 80%; height:150px;	
				padding-left:3%;">
				<div style="float: left;"><font size="10px"><br> ${ boardNm } 글작성</font></div>
				
				<div style="float: left; ">
				<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/parentboard/parentboard_img.png" class="board_img" 
				style="height: auto; width:80px; margin-top:15%; margin-left:30%; padding-top:50%;">  <!-- border-radius:0.81rem; box-shadow: 0px 2px 8px 0px rgba(0,0,0,.25); -->
			</div>
			
	</div>
		<div id="content" style="min-height: 800px;" >

			<!-- 본문 시작 -->
			
			<div id="bbs">
				<form id="writeForm" action="write.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
					<p style="margin: 0; padding: 0;">
						<input type="hidden" name="boardCd" value="${param.boardCd }" />
					</p>
					이름 : <input type="text" name="name" size="30" style="border:0px;"	value="${sessionScope.name}"readonly/><br>
					Email : <input type="text" name="email" size="30" style="border:0px;" value="${ sessionScope.email }" readonly/><br>
					IP : <input type="text" name="regip" size="30" style="border:0px;" value="${ sessionScope.ip }" readonly/><br>
					작성자 : <input type="text" name="writer" size="30" style="border:0px;" value="${ sessionScope.id }" readonly/>
					<br>
					<div>
					제목 : <input type="text" name="title" size="30" placeholder="제목을 작성하세요"/>
					</div>
					<br>
					<div>
					<textarea name="content" rows="17" cols="100" placeholder="글내용을 작성하세요"></textarea>
					</div>
							
					<div>
					파일첨부하기
					<img style="max-width: 1%; height: auto;" alt="파일첨부" src="../resources/img/parentboard/upload.png"> <br>
					
					<input type="file" name="upload"  multiple="multiple"/>
					</div>
					
					<div style="text-align: center; padding-bottom: 15px;">
						<input type="submit" class="btn btn-default" value="전송" />
						<input type="reset" class="btn btn-default" value="다시입력"/>
						 <input type="button" class="btn btn-default" value="목록" onclick="goList()" />
					</div>
					
				</form>
			</div>
			
<%-- 			<div id="bbs">
				<form id="writeForm" action="write.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
					<p style="margin: 0; padding: 0;">
						<input type="hidden" name="boardCd" value="${param.boardCd }" />
					</p>
					
					
					<table id="write-form" >
						<tr>
							<td>작성자</td>
							<td><input type="text" name="writer" size="50" value="${ sessionScope.id }" readonly/></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" size="50" placeholder="제목을 작성하세요"/></td>
						</tr>
						<tr>
							<td ><textarea name="content" rows="17" placeholder="글내용을 작성하세요"></textarea></td>
						</tr>
						
						<tr>
							<td><img style="max-width: 5%; height: auto;" alt="파일첨부" src="../resources/views/img/parentboard/upload.png"> 파일올리기<br>
								     <input type="file" name="upload" multiple />
							</td>
						</tr>
					</table>
					
					<div style="text-align: center; padding-bottom: 15px;">
						<input type="submit" value="전송" /> <input type="button" value="목록" onclick="goList()" />
					</div>
					
				</form>
			</div> --%>
			<!-- bbs 끝 -->
			<!--  본문 끝 -->

		</div>
		<!-- content 끝 -->
	</div>
	<!--  container 끝 -->


	<div id="form-group" style="display: none;">
		<form id="listForm" action="list.do" method="get">
			<p>
				<input type="hidden" name="boardCd" value="${param.boardCd }" />
			</p>
		</form>
	</div>
	</div>s
	</div>
	<div>
		<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
</body>
</html>
