<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<jsp:include page="../home/head.jsp"></jsp:include>
</head>
<body>
	<div style="height:1000px; width: 100%; float:left; margin-top:5%;">
	<div>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	</div>
	<div style="width:20%; height:1000px; float:left; margin-top:5%; ">
	</div>
	<div style="height:800px; float:left;  margin-top:5%; width:60%">
		<div>
			<img alt="login_img" src="${pageContext.request.contextPath}/resources//img/login/login_img3.jpg" class="board_img" style="width:100%; border-radius: 7%;">
		</div>
	<div id="content" style="float:left; margin-top: 50px; width:100%; border-radius:5%" > <!-- border: 1px solid gold; -->
		<div style="background: #F2EDE6; border-radius:5%; height:120px; padding:2.5%">
			<div style="margin-left: 5%; ">
				<font face="Comic Sans MS" >
					<font size="15px"><strong>Login</strong></font>&nbsp;
					 <font size="5px"> for</font>&nbsp;
					 <font size="20px" color="#53caf5"><strong>School Crayon</strong></font>
				</font>
				<div><img alt="" src=""></div>
			</div>
		</div>
		<div style="margin-top: 20px; margin-left: 5%">

			<form action="<c:url value="/j_spring_security_check"/>" method="post">

				<div style="float:left;">
					<font face="Comic Sans MS" size="5px">
						ID : <br/><br> 
						PW : <br/> <br/>
					</font>
				</div>
				<div style="float:left;">
					<font face="Comic Sans MS" size="5px">
						<input type="text" name="id" id="id" /><br/><br>
						<input type="password" name="pw" id="pw"/> <br/> <br/>
					</font>
				</div>
				<div style="float:left; margin-right: 5%; float:right;">
					<input class="btn btn-default" type="submit" value="로 그 인" style="color:#53caf5; font:20px Comic Sans MS;"><br><br>
				</div>

			</form>
		</div>
	</div>
	</div>
	<div style="width:20%">
	</div>
	</div>
		<div style="float:left; width:100%;">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<jsp:include page="../home/footer.jsp"></jsp:include>
		</div>
</body>
</html>