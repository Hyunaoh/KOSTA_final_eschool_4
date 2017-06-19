<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<!-- chart css -->
<link href="/resources/css/schoolinfoTeacherChart.css" rel="stylesheet" type="text/css">

<jsp:include page="../home/head.jsp"></jsp:include>

</head>
<body>
	<div style="height:1000px; box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.25);"> <!-- body에 해당 -->
	<div>
		<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	
	
	<!-- 전체 상자 div-->
	<div class="main"><!-- style="margin-top:2%;"	--> 
	
	<!-- 사이드바 -->
	<div class="Left_bar"style="margin-left: 3%; margin-right: 8%; margin-top:5%; float:left; height:1000px;" >
	<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"> <b>학교안내</b></font></p>
		<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
       		<li class="side_li"><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoGreeting.do"><font face="휴먼엽서체" size="3" color="black">교장 인사말</font></a></li>
       		<li class="side_li"><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoDetail.do"><font face="휴먼엽서체" size="3" color="black">학교정보</font></a></li>
            <li class="side_li"><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoSearch.do"><font face="휴먼엽서체" size="3" color="black">학교위치</font></a></li>
            <li class="side_li"><a href="${pageContext.request.contextPath}/schoolinfo/schoolinfoTeacher.do"><font face="휴먼엽서체" size="3" color="black">선생님 정보</font></a></li>
      	</ul>
	</div>
	
	<!-- ***********************************************여기는 css 입히는 부분******************************* -->
	<div style=" margin-left: 10%; margin-top: 8%; "><!-- -->
		<div class="board_header"style="margin-left: 10%; width: 80%; height:150px;	
				padding-left:3%;"> <!-- border-radius:5%; background-color:#dafffd;  그림자  box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.25); --> 
			<!-- <div style="width:40%;"> -->
			<div style="float: left;"><font size="28px"><br><strong>선생님 정보 </strong></font></div>	
			
			<div style="float: left; ">
				<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/schoolinfo/b_1.gif" class="board_img" 
				style="height: auto; width:130px; margin-top:15%; margin-left:30%; ">  <!-- border-radius:0.81rem; box-shadow: 0px 2px 8px 0px rgba(0,0,0,.25); -->
			</div>
		</div>
		<hr>
			<div id="content_content_sector">
				<p class="navihome">홈 > 학교소개 > 선생님 정보</p>
			</div>
	</div>
	
<div class="content" style="margin-top: 3%; margin-left:15%; height:800px; font-family:Comic Sans MS;"> <!--style="margin-top: 8%; margin-left:15%; height:800px; width:1200px;"  -->
  <figure class="org-chart cf">
    <ul class="administration">
      <li>					
        <ul class="director">
          <li>
            <a href="#"><span style="font-size:20pt;">교장 : 임숙자</span></a>
            <ul class="subdirector">
              <li><a href="#"><span style="font-size:1.5em;">수석교사 : 한경숙</span></a></li>
            </ul>
            <ul class="departments cf">								
              <li><a href="#"><span style="font-size:1.8em;">교감 : 김순복</span></a></li>
              
              <li class="department dep-a" style="font-size: 1.5em;">
                <a href="#"><span>1-1<br>정 해 옥<br>(학년부장)</span></a>
                <ul class="sections">
                  <li class="section"><a href="#">
                  	<span>
		  				1-2<br>
		  				박 영 애<br>
					</span></a>
				  </li>
				   <li class="section"><a href="#">
                  	<span>
		  				1-3<br>
		  				심 규 숙<br>
					</span></a>
				  </li>
                </ul>
              </li>
              <li class="department dep-b" style="font-size: 1.5em;">
                <a href="#"><span>2-1<br>안 병 덕<br>(학년부장)</span></a>
                <ul class="sections">
                  <li class="section"><a href="#">
                  	<span>
		  				2-2<br>
		  				임 혜 진(연구 부장)<br>
					</span></a>
				  </li>
				   <li class="section"><a href="#">
                  	<span>
		  				2-3<br>
		  				고 성 희<br>
					</span></a>
				  </li>
                </ul>
              </li>
              <li class="department dep-c" style="font-size: 1.5em;">
                <a href="#"><span>3-1<br>송 은 영<br>(학년부장)</span></a>
                <ul class="sections">
                  <li class="section"><a href="#">
                  	<span>
		  				3-2<br>
		  				신 용 일<br>
					</span></a>
				  </li>
				   <li class="section"><a href="#">
                  	<span>
		  				3-3<br>
		  				정 기 련<br>
					</span></a>
				  </li>
                </ul>
              </li>
              <li class="department dep-d" style="font-size: 1.5em;">
                <a href="#"><span>4-1<br>김 경 한<br>(학년, 진로부장)</span></a>
                <ul class="sections">
                  <li class="section"><a href="#">
                  	<span>
		  				4-2<br>
		  				한 윤 정<br>
					</span></a>
				  </li>
				   <li class="section"><a href="#">
                  	<span>
		  				4-3<br>
		  				엄 인 란<br>
					</span></a>
				  </li>
                </ul>
              </li>
              <li class="department dep-e" style="font-size: 1.5em;">
                <a href="#"><span>5-1<br>정 수 실<br>(학년, 체육부장)</span></a>
                <ul class="sections">
                  <li class="section"><a href="#">
                  	<span>
		  				5-2<br>
		  				김 승 현<br>
					</span></a>
				  </li>
				   <li class="section"><a href="#">
                  	<span>
		  				5-3<br>
		  				권 정 민<br>
					</span></a>
				  </li>
                </ul>
              </li>
              <li class="department dep-f" style="font-size: 1.5em;"> 
                <a href="#"><span>6-1<br>전 윤 정<br>(학년부장)</span></a>
                <ul class="sections">
                  <li class="section"><a href="#">
                  	<span>
		  				6-2<br>
		  				박 경 희<br>
					</span></a>
				  </li>
				   <li class="section"><a href="#">
                  	<span>
		  				6-3<br>
		  				김 정 선<br>
					</span></a>
				  </li>
                </ul>
              </li>
            </ul>
          </li>
        </ul>	
      </li>
    </ul>			
  </figure>
</div>
</div>
</div>
<div> <!--  style="margin-top: 15%; "margin-left: 10% -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<jsp:include page="../home/footer.jsp"></jsp:include>
</div>
	
</body>
</html>