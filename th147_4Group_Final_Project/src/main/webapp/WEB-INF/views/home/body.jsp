<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sc" uri="http://www.springframework.org/security/tags" %>
<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide" style="height:100%;">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner" style="background:white;" >

		<!-- 1번째 페이지 -->
		<div class="item active">
			<!-- <div> height:450px; -->
				<div class="col-md-1004 text-center" style="float:left; margin-right:0.5%;  display:table; height:320px; width: 24%" data-image-focal-point="0.5,0.5">
					<img name="img_body1" src="${pageContext.request.contextPath}/resources/img_main/img_inner/1/b1_1.jpg" 
					class="img-responsive" style="margin-left: -0.4%;height:320px; width: auto; position: absolute; top: 0;"> <!-- data-image-resolution="1500w"  -->
				</div>
				<div class="col-md-1004 text-center" style="float:left; margin-right:0.5%;  display:table; height:320px; width: 25%" data-image-focal-point="0.5,0.5" >
					<img name="img_body2" src="${pageContext.request.contextPath}/resources/img_main/img_inner/1/b1_2.gif"
					 
					class="img-responsive" style="margin-left: 24.5%; height:320px; width: auto; position: absolute; top: 0;">
				</div>
				<div class="col-md-1004 text-center" style="float:left; margin-right:0.5%;  display:table; height:320px; width: 25%" data-image-focal-point="0.5,0.5">
					<img name="img_body3" src="${pageContext.request.contextPath}/resources/img_main/img_inner/1/b1_3.jpg" 
					class="img-responsive" style="margin-left: 50%; height:320px; width: auto; position: absolute; top: 0;">
				</div>
				<div class="col-md-1004 text-center" style="float:left; margin-right:0%; display:table; height:320px; width: 24%" data-image-focal-point="0.5,0.5"><!-- data-image-focal-point="0.5,0.5" -->
					<img name="img_body4" src="${pageContext.request.contextPath}/resources/img_main/img_inner/1/b1_4.jpg" 
					class="img-responsive" style="margin-left: 75.4%; height:320px; width: auto; position: absolute; top: 0;">
				</div>
			<!-- </div> -->
			<div class="container">
				<div class="carousel-caption">
				<!-- <font face="Comic Sans MS" size="17px">This homepage is Elementary school Page</font> -->
				</div>
			</div>
		</div>
		
		<!-- 2번째 페이지 -->
				<div class="item">
			<!-- <div> height:450px; -->
				<div class="col-md-1004 text-center" style="float:left; margin-right:0.5%;  display:table; height:320px; width: 24%" data-image-focal-point="0.5,0.5">
					<img name="img_body1" src="${pageContext.request.contextPath}/resources/img_main/img_inner/2/b2_1.jpg" 
					class="img-responsive" style="margin-left: -0.4%;height:320px; width: auto; position: absolute; top: 0;"> <!-- data-image-resolution="1500w"  -->
				</div>
				<div class="col-md-1004 text-center" style="float:left; margin-right:0.5%;  display:table; height:320px; width: 25%" data-image-focal-point="0.5,0.5" >
					<img name="img_body2" src="${pageContext.request.contextPath}/resources/img_main/img_inner/2/b2_2.png"
					 
					class="img-responsive" style="margin-left: 24.5%; height:320px; width: auto; position: absolute; top: 0;">
				</div>
				<div class="col-md-1004 text-center" style="float:left; margin-right:0.5%;  display:table; height:320px; width: 25%" data-image-focal-point="0.5,0.5">
					<img name="img_body3" src="${pageContext.request.contextPath}/resources/img_main/img_inner/2/b2_3.gif" 
					class="img-responsive" style="margin-left: 50%; height:320px; width: auto; position: absolute; top: 0;">
				</div>
				<div class="col-md-1004 text-center" style="float:left; margin-right:0%; display:table; height:320px; width: 24%" data-image-focal-point="0.5,0.5"><!-- data-image-focal-point="0.5,0.5" -->
					<img name="img_body4" src="${pageContext.request.contextPath}/resources/img_main/img_inner/2/b2_4.jpg" 
					class="img-responsive" style="margin-left: 75.4%; height:320px; width: auto; position: absolute; top: 0;">
				</div>
			<!-- </div> -->
			<div class="container">
				<div class="carousel-caption">
				<!-- <font face="Comic Sans MS" size="17px">This homepage is Elementary school Page</font> -->
				</div>
			</div>
		</div>
		
		<!-- 3번째 페이지 -->
		<div class="item">
			<!-- <div> height:450px; -->
				<div class="col-md-1004 text-center" style="float:left; margin-right:0.5%;  display:table; height:320px; width: 24%" data-image-focal-point="0.5,0.5">
					<img name="img_body1" src="${pageContext.request.contextPath}/resources/img_main/img_inner/3/b3_1.png" 
					class="img-responsive" style="margin-left: -0.4%;height:320px; width: auto; position: absolute; top: 0;"> <!-- data-image-resolution="1500w"  -->
				</div>
				<div class="col-md-1004 text-center" style="float:left; margin-right:0.5%;  display:table; height:320px; width: 25%" data-image-focal-point="0.5,0.5" >
					<img name="img_body2" src="${pageContext.request.contextPath}/resources/img_main/img_inner/3/b3_2.jpg"
					 
					class="img-responsive" style="margin-left: 24.5%; height:320px; width: auto; position: absolute; top: 0;">
				</div>
				<div class="col-md-1004 text-center" style="float:left; margin-right:0.5%;  display:table; height:320px; width: 25%" data-image-focal-point="0.5,0.5">
					<img name="img_body3" src="${pageContext.request.contextPath}/resources/img_main/img_inner/3/b3_3.png" 
					class="img-responsive" style="margin-left: 50%; height:320px; width: auto; position: absolute; top: 0;">
				</div>
				<div class="col-md-1004 text-center" style="float:left; margin-right:0%; display:table; height:320px; width: 24%" data-image-focal-point="0.5,0.5"><!-- data-image-focal-point="0.5,0.5" -->
					<img name="img_body4" src="${pageContext.request.contextPath}/resources/img_main/img_inner/3/b3_4.png" 
					class="img-responsive" style="margin-left: 75.4%; height:320px; width: auto; position: absolute; top: 0;">
				</div>
			<!-- </div> -->
			<div class="container">
				<div class="carousel-caption">
				<!-- <font face="Comic Sans MS" size="17px">This homepage is Elementary school Page</font> -->
				</div>
			</div>
		</div>
		

	</div>
	<!-- Controls -->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		<span class="icon-prev"></span>
	</a> <a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="icon-next"></span>
	</a>
</div>
<!-- /.carousel -->


<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container marketing" style="margin-bottom: 3px; box-shadow: 3px 3px 10px grey;"> <!-- style="margin-top:o%;" --> <!-- 추후 아footer가 래 여백은 지우기 -->

	<!-- Three columns of text below the carousel -->
	<div class="row">
		
		<a class="Curriculum" href="${pageContext.request.contextPath}/curriculum/curriListPro.do">
		<div class="col-md-4 text-center" style="margin-right:0.5%; background-color:white; height:180px;" >
			<img class="Curriculum_img" src="${pageContext.request.contextPath}/resources/img_main/main_5.jpg" style="height:170px;">
			 	
		</div>
		</a>
		
		<a class="student board" href="${pageContext.request.contextPath}/studentboard/studentProposalPro.do?s_pageNum=1">
		<div class="col-md-4 text-center" style="margin-right:0.5%; height:180px; display:table;">
			<div style="width:1%;text-align:center; height:110px; display:table-cell;vertical-align:middle;">
				<img class="Student_img" src="${pageContext.request.contextPath}/resources/img_main/teacherboard_img.png" style="height:60px;">
				<font color="#94BFB3">
					<h3><strong>학생 마당</strong></h3>
					<p>Student board</p>
				</font>
			</div>
		</div>
		</a>
		
		<a class="parent board" href="${pageContext.request.contextPath}/parentboard/list.do?boardCd=suggest">
		<div class="col-md-4 text-center" style="margin-right:0.5%; height:180px; display:table;">
			<div style="width:1%;text-align:center; height:110px; display:table-cell;vertical-align:middle;">
				<img class="Parent_img" src="${pageContext.request.contextPath}/resources/img_main/parentboard_img.png" style="height:60px;">
				<font color="#C5CF5A">
					<h3><strong>학부모 마당</strong></h3>
					<p>Parent board</p>
				</font>
			</div>
		</div>
		</a>
		
		<a class="enter school" href="#">
		<div class="col-md-4 text-center" style="margin-right:0.5%; height:180px; display:table;">
			<div style="width:1%;text-align:center; height:110px; display:table-cell;vertical-align:middle;">
				<img class="Enter_img" src="${pageContext.request.contextPath}/resources//img_main/studentboard_img.png" style="height:60px;">
				<font color="#F69C75">
					<h3><strong>진로진학</strong></h3>
					<p>Enter school</p>
				</font>
			</div>
		</div>
		</a>
	</div>
	
</div>
	