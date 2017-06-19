<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>D3.js bar chart with transitions</title>
<jsp:include page="../home/head.jsp"></jsp:include>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawStacked);

function drawStacked() {
	
	var k_talk = new Array();
	var k_write = new Array();
	var k_read = new Array();
	var k_gram = new Array();
	var k_novel = new Array();

	var e_talk = new Array();
	var e_write = new Array();
	var e_read = new Array();
	var e_gram = new Array();
	var e_novel = new Array();
	
	var m_math = new Array();
	var m_figure = new Array();
	var m_rule = new Array();
	
	var s_mol = new Array();
	var s_energy = new Array();	
	var s_life = new Array();	
	
	var h_eco = new Array();	
	var h_pol = new Array();	
	var h_law = new Array();	
	var h_soc = new Array();	
	
	for(var i = 0; i <= 6; i++){
		
		k_talk[i] = parseFloat((!document.getElementsByName("k_talk")[i]) ? 0 : document.getElementsByName("k_talk")[i].value);
		k_write[i] = parseFloat((!document.getElementsByName("k_write")[i]) ? 0 : document.getElementsByName("k_write")[i].value);
 		k_read[i] = parseFloat((!document.getElementsByName("k_read")[i]) ? 0 : document.getElementsByName("k_read")[i].value);
		k_gram[i] = parseFloat((!document.getElementsByName("k_grammar")[i]) ? 0 : document.getElementsByName("k_grammar")[i].value);
		k_novel[i] = parseFloat((!document.getElementsByName("k_novel")[i]) ? 0 : document.getElementsByName("k_novel")[i].value);
		
		e_talk[i] = parseFloat((!document.getElementsByName("e_talk")[i]) ? 0 : document.getElementsByName("e_talk")[i].value);
		e_write[i] = parseFloat((!document.getElementsByName("e_write")[i]) ? 0 : document.getElementsByName("e_write")[i].value);
 		e_read[i] = parseFloat((!document.getElementsByName("e_read")[i]) ? 0 : document.getElementsByName("e_read")[i].value);
		e_gram[i] = parseFloat((!document.getElementsByName("e_grammar")[i]) ? 0 : document.getElementsByName("e_grammar")[i].value);
		e_novel[i] = parseFloat((!document.getElementsByName("e_novel")[i]) ? 0 : document.getElementsByName("e_novel")[i].value);
		
		m_math[i] = parseFloat((!document.getElementsByName("m_math")[i]) ? 0 : document.getElementsByName("m_math")[i].value);
		m_figure[i] = parseFloat((!document.getElementsByName("m_figure")[i]) ? 0 : document.getElementsByName("m_figure")[i].value);
		m_rule[i] = parseFloat((!document.getElementsByName("m_rule")[i]) ? 0 : document.getElementsByName("m_rule")[i].value);
		
		s_mol[i] = parseFloat((!document.getElementsByName("s_mol")[i]) ? 0 : document.getElementsByName("s_mol")[i].value);
		s_energy[i] = parseFloat((!document.getElementsByName("s_energy")[i]) ? 0 : document.getElementsByName("s_energy")[i].value);
		s_life[i] = parseFloat((!document.getElementsByName("s_life")[i]) ? 0 : document.getElementsByName("s_life")[i].value);
		
		h_eco[i] = parseFloat((!document.getElementsByName("h_eco")[i]) ? 0 : document.getElementsByName("h_eco")[i].value);
		h_pol[i] = parseFloat((!document.getElementsByName("h_pol")[i]) ? 0 : document.getElementsByName("h_pol")[i].value);
		h_law[i] = parseFloat((!document.getElementsByName("h_law")[i]) ? 0 : document.getElementsByName("h_law")[i].value);
		h_soc[i] = parseFloat((!document.getElementsByName("h_soc")[i]) ? 0 : document.getElementsByName("h_soc")[i].value);

	}

      var data1 = google.visualization.arrayToDataTable([
        ['국어', '1-3주', '4-6주', '7-9주', '10-12주', '13-15주', '16-18주', '19-20주'],
        ['말하기/듣기', k_talk[0], k_talk[1], k_talk[2], k_talk[3], k_talk[4], k_talk[5], k_talk[6]],
        ['쓰기', k_write[0], k_write[1], k_write[2], k_write[3], k_write[4], k_write[5], k_write[6]],
        ['읽기', k_read[0], k_read[1], k_read[2], k_read[3], k_read[4], k_read[5], k_read[6]],
        ['문법', k_gram[0], k_gram[1], k_gram[2], k_gram[3], k_gram[4], k_gram[5], k_gram[6]],
        ['문학', k_novel[0], k_novel[1], k_novel[2], k_novel[3], k_novel[4], k_novel[5], k_novel[6]]
      ]);
      
      var data2 = google.visualization.arrayToDataTable([
        ['영어', '1-3주', '4-6주', '7-9주', '10-12주', '13-15주', '16-18주', '19-20주'],
        ['말하기/듣기', e_talk[0], e_talk[1], e_talk[2], e_talk[3], e_talk[4], e_talk[5], e_talk[6]],
        ['쓰기', e_write[0], e_write[1], e_write[2], e_write[3], e_write[4], e_write[5], e_write[6]],
        ['읽기', e_read[0], e_read[1], e_read[2], e_read[3], e_read[4], e_read[5], e_read[6]],
        ['문법', e_gram[0], e_gram[1], e_gram[2], e_gram[3], e_gram[4], e_gram[5], e_gram[6]],
        ['문학', e_novel[0], e_novel[1], e_novel[2], e_novel[3], e_novel[4], e_novel[5], e_novel[6]]
      ]);

      var data3 = google.visualization.arrayToDataTable([
        ['수학', '1-3주', '4-6주', '7-9주', '10-12주', '13-15주', '16-18주', '19-20주'],
        ['수와연산', m_math[0], m_math[1], m_math[2], m_math[3], m_math[4], m_math[5], m_math[6]],
        ['도형', m_figure[0], m_figure[1], m_figure[2], m_figure[3], m_figure[4], m_figure[5], m_figure[6]],
        ['규칙성', m_rule[0], m_rule[1], m_rule[2], m_rule[3], m_rule[4], m_rule[5], m_rule[6]]
      ]);
      
      var data4 = google.visualization.arrayToDataTable([
        ['과학', '1-3주', '4-6주', '7-9주', '10-12주', '13-15주', '16-18주', '19-20주'],
        ['물질', s_mol[0], s_mol[1], s_mol[2], s_mol[3], s_mol[4], s_mol[5], s_mol[6]],
        ['에너지', s_energy[0], s_energy[1], s_energy[2], s_energy[3], s_energy[4], s_energy[5], s_energy[6]],
        ['생명', s_life[0], s_life[1], s_life[2], s_life[3], s_life[4], s_life[5], s_life[6]]
      ]);
      
      var data5 = google.visualization.arrayToDataTable([
        ['사회', '1-3주', '4-6주', '7-9주', '10-12주', '13-15주', '16-18주', '19-20주'],
        ['경제', h_eco[0], h_eco[1], h_eco[2], h_eco[3], h_eco[4], h_eco[5], h_eco[6]],
        ['정치', h_pol[0], h_pol[1], h_pol[2], h_pol[3], h_pol[4], h_pol[5], h_pol[6]],
        ['법', h_law[0], h_law[1], h_law[2], h_law[3], h_law[4], h_law[5], h_law[6]],
        ['사회문화', h_soc[0], h_soc[1], h_soc[2], h_soc[3], h_soc[4], h_soc[5], h_soc[6]]
      ]);
      
      var options1 = {
        title: '국어교과상황',
        chartArea: {width: '50%'},
        isStacked: true,
      };
      
      var options2 = {
        title: '영어교과상황',
        chartArea: {width: '50%'},
        isStacked: true,
      };
      
      var options3 = {
        title: '수학교과상황',
        chartArea: {width: '50%'},
        isStacked: true,
      };
      
      var options4 = {
        title: '과학교과상황',
        chartArea: {width: '50%'},
        isStacked: true,
      };
      
      var options5 = {
        title: '사회교과상황',
        chartArea: {width: '50%'},
        isStacked: true,
      };
      
      var chart1 = new google.visualization.BarChart(document.getElementById('chart_div1'));
      var chart2 = new google.visualization.BarChart(document.getElementById('chart_div2'));
      var chart3 = new google.visualization.BarChart(document.getElementById('chart_div3'));
      var chart4 = new google.visualization.BarChart(document.getElementById('chart_div4'));
      var chart5 = new google.visualization.BarChart(document.getElementById('chart_div5'));
      
      chart1.draw(data1, options1);
      chart2.draw(data2, options2);
      chart3.draw(data3, options3);
      chart4.draw(data4, options4);
      chart5.draw(data5, options5);
    }
</script>
</head>

<body>
<!-- 전체구성 -->
	<div style="height:1100px; box-shadow: 0px 10px 8px 0px rgba(0, 0, 0, 0.25);"> <!-- body에 해당 -->
	
	<!-- 게시판 전체 상자 -->
	<div>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	
	<!-- 전체 상자 div-->
	<div class="main"> <!-- style="margin-top:2%;"-->
	
	<!-- 사이드바 -->
	<%-- <div class="Left_bar"style="margin-left: 3%; margin-right: 8%; margin-top:5%; height:1000px;" >
	<p class="shcoolinfo" id="schoolinfo_bar" ><font face="Bookman Old Style" size="5" color="#00c4ef"><b>Curriculum</b></font></p>
      	<ul class="side_bar" style="list-style:none; margin-left:-20px;" >
 					<li class="side_li"><a href="${pageContext.request.contextPath}/curriculum/signChartPro.do"><font face="휴먼엽서체" size="3" color="black">커리큘럼</font></a></li>                
 						<cl:if test="${ sessionScope.id ne 'principal' and  sessionScope.id ne 'submaster'}">
                	<li class="side_li"><a href="${pageContext.request.contextPath}/curriculum/curriListPro.do?grade=${ sessionScope.grade }&mClass=${ sessionScope.mClass }&level=Role_Teacher"><font face="휴먼엽서체" size="3" color="black">전자결재</font></a></li>
                	</cl:if>
                <cl:if test="${ sessionScope.id eq 'principal' }">
                	<li class="side_li"><a href="${pageContext.request.contextPath}/curriculum/principalListPro.do"><font face="휴먼엽서체" size="3" color="black">전자결재(교장)</font></a></li>
                </cl:if>
                <cl:if test="${ sessionScope.id eq 'submaster' }">
                	<li class="side_li"><a href="${pageContext.request.contextPath}/curriculum/principalListPro.do"><font face="휴먼엽서체" size="3" color="black">전자결재(교감)</font></a></li>
                </cl:if>
                	<li class="side_li"><a href="${pageContext.request.contextPath}/homeworkboard/boardList.do"><font face="휴먼엽서체" size="3" color="black">숙제/준비물</font></a></li>
                	<li class="side_li"><a href="${pageContext.request.contextPath}/schedule/selectAll.do"><font face="휴먼엽서체" size="3" color="black">학사일정</font></a></li>
                	<se:authorize ifAnyGranted="Role_Teacher">
					<li class="side_li"><a href="${pageContext.request.contextPath}/schedule/controllerSchedule.do"><font face="휴먼엽서체" size="3" color="black">학사일정수정</font></a></li>
					</se:authorize> 
              </ul>
	</div> --%>
	<div style="margin-top: 8%; margin-left: 10%;">
		<!-- 본문 시작 -->
		<div class="board_header"style="margin-left: 10%; width: 80%; height:150px;	
			padding-left:3%;">
				<!-- 본문 시작 -->
				<div style="float: left;"><font size="10px"><br><b>커리큘럼</b></font></div>
			<div style="float: left;">
					<img name="img_body1" src="${pageContext.request.contextPath}/resources//img/curriculum/b_10.jpg" class="board_img" style="height: auto; width:100px; margin-top:15%; margin-left:30%; margin-top:60%; ">
			</div>
		</div>
		<br>
	
	</div>
	
	<!-- 찾기부분 -->
	<form action="signChartPro.do" style="margin-left:17%">
		<select name="cuGrade" class="btn btn-default">
			<option value="1">1학년</option>
			<option value="2">2학년</option>
			<option value="3">3학년</option>
			<option value="4">4학년</option>
			<option value="5">5학년</option>
			<option value="6">6학년</option>
		</select>
		
		<select name="cuClass" class="btn btn-default">
			<option value="1">1반</option>
			<option value="2">2반</option>
			<option value="3">3반</option>
			<option value="4">4반</option>
			<option value="5">5반</option>
			<option value="6">6반</option>
		</select>

		<input class="btn btn-default" type="submit" value="차트출력"/>
	</form>
	
	<!-- 차트부분 -->
	
	<c:if test="${ res_chart ne null }">
		<div style="margin-left: 18%; font-size:20px; font-color:#00c4ef" ><b>${ res_chart }</b></div>
	</c:if>
  	
  	<c:if test="${ res_chart eq null }">
		
  	<div class="row">
  		<div id="chart_div1" ></div>
  		<div style="margin-left: 20%; margin-top: 5px">
			<table class="table" style="float:left">
				<tr>
					<th>과목</th>
					<td>1-3주</td>
					<td>4-6주</td>
					<td>7-9주</td>
					<td>10-12주</td>
					<td>13-15주</td>
					<td>16-18주</td>
					<td>19-20주</td>
				</tr>
				<tr>
					<th>말하기/듣기</th>
					<c:forEach var="i" items="${ selectKoreaList }" varStatus="status" begin="0" end="6">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>쓰기</th>
					<c:forEach var="i" items="${ selectKoreaList }" varStatus="status" begin="7" end="13">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>읽기</th>
					<c:forEach var="i" items="${ selectKoreaList }" varStatus="status" begin="14" end="20">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>문법</th>
					<c:forEach var="i" items="${ selectKoreaList }" varStatus="status" begin="21" end="27">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>문학</th>
					<c:forEach var="i" items="${ selectKoreaList }" varStatus="status" begin="28" end="34">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
			</table>
		</div>
  		<div id="chart_div2" ></div>
  		<div style="margin-left: 20%; margin-top: 5px">
			<table class="table">
				<tr>
					<th>과목</th>
					<td>1-3주</td>
					<td>4-6주</td>
					<td>7-9주</td>
					<td>10-12주</td>
					<td>13-15주</td>
					<td>16-18주</td>
					<td>19-20주</td>
				</tr>
				<tr>
					<th>말하기/듣기</th>
					<c:forEach var="i" items="${ selectEnglishList }" varStatus="status" begin="0" end="6">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>쓰기</th>
					<c:forEach var="i" items="${ selectEnglishList }" varStatus="status" begin="7" end="13">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>읽기</th>
					<c:forEach var="i" items="${ selectEnglishList }" varStatus="status" begin="14" end="20">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>문법</th>
					<c:forEach var="i" items="${ selectEnglishList }" varStatus="status" begin="21" end="27">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>문학</th>
					<c:forEach var="i" items="${ selectEnglishList }" varStatus="status" begin="28" end="34">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
			</table>
		</div>
		
		
 		<div id="chart_div3" ></div>
 		<div style="margin-left: 20%; margin-top: 5px">
			<table class="table">
				<tr>
					<th>과목</th>
					<td>1-3주</td>
					<td>4-6주</td>
					<td>7-9주</td>
					<td>10-12주</td>
					<td>13-15주</td>
					<td>16-18주</td>
					<td>19-20주</td>
				</tr>
				<tr>
					<th>수와연산</th>
					<c:forEach var="i" items="${ selectMathList }" varStatus="status" begin="0" end="6">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>도형</th>
					<c:forEach var="i" items="${ selectMathList }" varStatus="status" begin="7" end="13">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>규칙성</th>
					<c:forEach var="i" items="${ selectMathList }" varStatus="status" begin="14" end="20">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
			</table>
		</div>
	</div>

	<div class="row">
	
		<div id="chart_div4"></div>
		<div style="margin-left: 20%; margin-top: 5px">
			<table class="table">
				<tr>
					<th>과목</th>
					<td>1-3주</td>
					<td>4-6주</td>
					<td>7-9주</td>
					<td>10-12주</td>
					<td>13-15주</td>
					<td>16-18주</td>
					<td>19-20주</td>
				</tr>
				<tr>
					<th>물질</th>
					<c:forEach var="i" items="${ selectScienceList }" varStatus="status" begin="0" end="6">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>에너지</th>
					<c:forEach var="i" items="${ selectScienceList }" varStatus="status" begin="7" end="13">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>생명</th>
					<c:forEach var="i" items="${ selectScienceList }" varStatus="status" begin="14" end="20">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
			</table>
		</div>
		
		<div id="chart_div5"></div>
		<div style="margin-left: 20%; margin-top: 5px">
			<table class="table">
				<tr>
					<th>과목</th>
					<td>1-3주</td>
					<td>4-6주</td>
					<td>7-9주</td>
					<td>10-12주</td>
					<td>13-15주</td>
					<td>16-18주</td>
					<td>19-20주</td>
				</tr>
				<tr>
					<th>경제</th>
					<c:forEach var="i" items="${ selectHistoryList }" varStatus="status" begin="0" end="6">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>정치</th>
					<c:forEach var="i" items="${ selectHistoryList }" varStatus="status" begin="7" end="13">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>법</th>
					<c:forEach var="i" items="${ selectHistoryList }" varStatus="status" begin="14" end="20">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th>사회문화</th>
					<c:forEach var="i" items="${ selectHistoryList }" varStatus="status" begin="21" end="27">
					<c:if test="${ null ne i }">					
						<td><fmt:formatNumber value="${ i }" type="number" maxFractionDigits="0"/></td>
					</c:if>
					<c:if test="${ null eq i }">
						<td><fmt:formatNumber value="0" type="number" maxFractionDigits="0"/></td>
						0입니다.
					</c:if>
					</c:forEach>
				</tr>
			</table>
		</div>
		
	</div>


	<!-- 데이터 부분 -->
	<!-- KOREA -->

	<c:forEach var="i" items="${ selectKoreaList }" varStatus="status" begin="0" end="6">
		<input type="hidden" name="k_talk" value="${ i }" />
	</c:forEach>
	<br/>
	<c:forEach var="i" items="${ selectKoreaList }" varStatus="status" begin="7" end="13">
		<input type="hidden" name="k_write" value="${ i }" />
	</c:forEach>
	<br/>
	<c:forEach var="i" items="${ selectKoreaList }" varStatus="status" begin="14" end="20">
		<input type="hidden" name="k_read" value="${ i }" />
	</c:forEach>
	<br/>
	<c:forEach var="i" items="${ selectKoreaList }" varStatus="status" begin="21" end="27">
		<input type="hidden" name="k_grammar" value="${ i }" />
	</c:forEach>
	<br/>
	<c:forEach var="i" items="${ selectKoreaList }" varStatus="status" begin="28" end="34">
		<input type="hidden" name="k_novel" value="${ i }" />
	</c:forEach>
	
	<!-- ENGLISH -->

	<c:forEach var="i" items="${ selectEnglishList }" varStatus="status" begin="0" end="6">
		<input type="hidden" name="e_talk" value="${ i }" />
	</c:forEach>
	<br/>
	<c:forEach var="i" items="${ selectEnglishList }" varStatus="status" begin="7" end="13">
		<input type="hidden" name="e_write" value="${ i }" />
	</c:forEach>
	<br/>
	<c:forEach var="i" items="${ selectEnglishList }" varStatus="status" begin="14" end="20">
		<input type="hidden" name="e_read" value="${ i }" />
	</c:forEach>
	<br/>
	<c:forEach var="i" items="${ selectEnglishList }" varStatus="status" begin="21" end="27">
		<input type="hidden" name="e_grammar" value="${ i }" />
	</c:forEach>
	<br/>
	<c:forEach var="i" items="${ selectEnglishList }" varStatus="status" begin="28" end="34">
		<input type="hidden" name="e_novel" value="${ i }" />
	</c:forEach>

	<!-- MATH -->

	<c:forEach var="i" items="${ selectMathList }" varStatus="status" begin="0" end="6">
		<input type="hidden" name="m_math" value="${ i }" />
	</c:forEach>

	<c:forEach var="i" items="${ selectMathList }" varStatus="status" begin="7" end="13">
		<input type="hidden" name="m_figure" value="${ i }" />
	</c:forEach>

	<c:forEach var="i" items="${ selectMathList }" varStatus="status" begin="14" end="20">
		<input type="hidden" name="m_rule" value="${ i }" />
	</c:forEach>
	
	<!-- HISTORY -->

	<c:forEach var="i" items="${ selectHistoryList }" varStatus="status" begin="0" end="6">
		<input type="hidden" name="h_eco" value="${ i }" />
	</c:forEach>
	<c:forEach var="i" items="${ selectHistoryList }" varStatus="status" begin="7" end="13">
		<input type="hidden" name="h_pol" value="${ i }" />
	</c:forEach>
	<c:forEach var="i" items="${ selectHistoryList }" varStatus="status" begin="14" end="20">
		<input type="hidden" name="h_law" value="${ i }" />
	</c:forEach>
	<c:forEach var="i" items="${ selectHistoryList }" varStatus="status" begin="21" end="27">
		<input type="hidden" name="h_soc" value="${ i }" />
	</c:forEach>
	
	
	<!-- SCIENCE -->

	<c:forEach var="i" items="${ selectScienceList }" varStatus="status" begin="0" end="6">
		<input type="hidden" name="s_mol" value="${ i }" />
	</c:forEach>
	<c:forEach var="i" items="${ selectScienceList }" varStatus="status" begin="7" end="13">
		<input type="hidden" name="s_energy" value="${ i }" />
	</c:forEach>
	<c:forEach var="i" items="${ selectScienceList }" varStatus="status" begin="14" end="20">
		<input type="hidden" name="s_life" value="${ i }" />
	</c:forEach>
	
	</c:if>
		
	</div>
	</div>
	
	<div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/home_bootstrap.min.js"></script>
	</div>

</body>
</html>
