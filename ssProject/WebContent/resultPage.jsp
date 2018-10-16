<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴 선정 결과</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://dl.dropboxusercontent.com/u/86701580/mypersonalcdn/renda/renda-icon-font.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<style>
.bg-info{
	background: none;
}


#profile {
	width: 800px;
}

.navbar-brand {
	padding: 0px;
}

.container {
	margin-top: 100px;
	float: none;
}

.panel-body {
	font-size: 20px;
}

.label.label-danger {
	margin-right: 10px;
}

.nav.nav-pills.nav-stacked.admin-menu {
	font-size: 20px;
}

.panel-title {
	font-size: 20px;
}

.top-line {
	background-color: gray;
	position: relative;
	height: 60px;
}

.navbar-brand .img-responsive {
	width: 150px;
	height: 50px;
	margin-bottom: 70px;
	margin-left: 370px;
}

.navbar-default {
	padding-top: 10px;
	padding-bottom: 10px;
}

#bs-example-navbar-collapse-1 {
	font-size: 20px;
	margin-right: 100px;
}

#profile {
	margin-top: 100px;
	align-content: center;
	align-items: center;
}

/* -------------------------------------------- */
#qid {
	padding: 10px 15px;
	-moz-border-radius: 50px;
	-webkit-border-radius: 50px;
	border-radius: 20px;
}

label.btn {
	padding: 18px 60px;
	white-space: normal;
	-webkit-transform: scale(1.0);
	-moz-transform: scale(1.0);
	-o-transform: scale(1.0);
	-webkit-transition-duration: .3s;
	-moz-transition-duration: .3s;
	-o-transition-duration: .3s
}

label.btn:hover {
	text-shadow: 0 3px 2px rgba(0, 0, 0, 0.4);
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-o-transform: scale(1.1)
}

label.btn-block {
	text-align: left;
	position: relative
}

label .btn-label {
	position: absolute;
	left: 0;
	top: 0;
	display: inline-block;
	padding: 0 10px;
	background: rgba(0, 0, 0, .15);
	height: 100%
}

label .glyphicon {
	top: 34%
}

.element-animation1 {
	animation: animationFrames ease .8s;
	animation-iteration-count: 1;
	transform-origin: 50% 50%;
	-webkit-animation: animationFrames ease .8s;
	-webkit-animation-iteration-count: 1;
	-webkit-transform-origin: 50% 50%;
	-ms-animation: animationFrames ease .8s;
	-ms-animation-iteration-count: 1;
	-ms-transform-origin: 50% 50%
}

.element-animation2 {
	animation: animationFrames ease 1s;
	animation-iteration-count: 1;
	transform-origin: 50% 50%;
	-webkit-animation: animationFrames ease 1s;
	-webkit-animation-iteration-count: 1;
	-webkit-transform-origin: 50% 50%;
	-ms-animation: animationFrames ease 1s;
	-ms-animation-iteration-count: 1;
	-ms-transform-origin: 50% 50%
}

.element-animation3 {
	animation: animationFrames ease 1.2s;
	animation-iteration-count: 1;
	transform-origin: 50% 50%;
	-webkit-animation: animationFrames ease 1.2s;
	-webkit-animation-iteration-count: 1;
	-webkit-transform-origin: 50% 50%;
	-ms-animation: animationFrames ease 1.2s;
	-ms-animation-iteration-count: 1;
	-ms-transform-origin: 50% 50%
}

.element-animation4 {
	animation: animationFrames ease 1.4s;
	animation-iteration-count: 1;
	transform-origin: 50% 50%;
	-webkit-animation: animationFrames ease 1.4s;
	-webkit-animation-iteration-count: 1;
	-webkit-transform-origin: 50% 50%;
	-ms-animation: animationFrames ease 1.4s;
	-ms-animation-iteration-count: 1;
	-ms-transform-origin: 50% 50%
}

@
keyframes animationFrames { 0% {
	opacity: 0;
	transform: translate(-1500px, 0px)
}

60%
{
opacity


:

 

1;
transform


:

 

translate


(30
px
,
0
px


)
}
80%
{
transform


:

 

translate


(-10
px
,
0
px


)
}
100%
{
opacity


:

 

1;
transform


:

 

translate


(0
px
,
0
px


)
}
}
@
-webkit-keyframes animationFrames { 0% {
	opacity: 0;
	-webkit-transform: translate(-1500px, 0px)
}

60%
{
opacity


:

 

1;
-webkit-transform


:

 

translate


(30
px
,
0
px


)
}
80%
{
-webkit-transform


:

 

translate


(-10
px
,
0
px


)
}
100%
{
opacity


:

 

1;
-webkit-transform


:

 

translate


(0
px
,
0
px


)
}
}
@
-ms-keyframes animationFrames { 0% {
	opacity: 0;
	-ms-transform: translate(-1500px, 0px)
}

60%
{
opacity


:

 

1;
-ms-transform


:

 

translate


(30
px
,
0
px


)
}
80%
{
-ms-transform


:

 

translate


(-10
px
,
0
px


)
}
100%
{
opacity


:

 

1;
-ms-transform


:

 

translate


(0
px
,
0
px


)
}
}
.modal-header {
	background-color: transparent;
	color: inherit
}

.modal-body {
	min-height: 205px
}

#loadbar {
	position: absolute;
	width: 62px;
	height: 77px;
	top: 2em
}

.blockG {
	position: absolute;
	background-color: #FFF;
	width: 10px;
	height: 24px;
	-moz-border-radius: 8px 8px 0 0;
	-moz-transform: scale(0.4);
	-moz-animation-name: fadeG;
	-moz-animation-duration: .8800000000000001s;
	-moz-animation-iteration-count: infinite;
	-moz-animation-direction: linear;
	-webkit-border-radius: 8px 8px 0 0;
	-webkit-transform: scale(0.4);
	-webkit-animation-name: fadeG;
	-webkit-animation-duration: .8800000000000001s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-direction: linear;
	-ms-border-radius: 8px 8px 0 0;
	-ms-transform: scale(0.4);
	-ms-animation-name: fadeG;
	-ms-animation-duration: .8800000000000001s;
	-ms-animation-iteration-count: infinite;
	-ms-animation-direction: linear;
	-o-border-radius: 8px 8px 0 0;
	-o-transform: scale(0.4);
	-o-animation-name: fadeG;
	-o-animation-duration: .8800000000000001s;
	-o-animation-iteration-count: infinite;
	-o-animation-direction: linear;
	border-radius: 8px 8px 0 0;
	transform: scale(0.4);
	animation-name: fadeG;
	animation-duration: .8800000000000001s;
	animation-iteration-count: infinite;
	animation-direction: linear
}

#rotateG_01 {
	left: 0;
	top: 28px;
	-moz-animation-delay: .33s;
	-moz-transform: rotate(-90deg);
	-webkit-animation-delay: .33s;
	-webkit-transform: rotate(-90deg);
	-ms-animation-delay: .33s;
	-ms-transform: rotate(-90deg);
	-o-animation-delay: .33s;
	-o-transform: rotate(-90deg);
	animation-delay: .33s;
	transform: rotate(-90deg)
}

#rotateG_02 {
	left: 8px;
	top: 10px;
	-moz-animation-delay: .44000000000000006s;
	-moz-transform: rotate(-45deg);
	-webkit-animation-delay: .44000000000000006s;
	-webkit-transform: rotate(-45deg);
	-ms-animation-delay: .44000000000000006s;
	-ms-transform: rotate(-45deg);
	-o-animation-delay: .44000000000000006s;
	-o-transform: rotate(-45deg);
	animation-delay: .44000000000000006s;
	transform: rotate(-45deg)
}

#rotateG_03 {
	left: 26px;
	top: 3px;
	-moz-animation-delay: .55s;
	-moz-transform: rotate(0deg);
	-webkit-animation-delay: .55s;
	-webkit-transform: rotate(0deg);
	-ms-animation-delay: .55s;
	-ms-transform: rotate(0deg);
	-o-animation-delay: .55s;
	-o-transform: rotate(0deg);
	animation-delay: .55s;
	transform: rotate(0deg)
}

#rotateG_04 {
	right: 8px;
	top: 10px;
	-moz-animation-delay: .66s;
	-moz-transform: rotate(45deg);
	-webkit-animation-delay: .66s;
	-webkit-transform: rotate(45deg);
	-ms-animation-delay: .66s;
	-ms-transform: rotate(45deg);
	-o-animation-delay: .66s;
	-o-transform: rotate(45deg);
	animation-delay: .66s;
	transform: rotate(45deg)
}

#rotateG_05 {
	right: 0;
	top: 28px;
	-moz-animation-delay: .7700000000000001s;
	-moz-transform: rotate(90deg);
	-webkit-animation-delay: .7700000000000001s;
	-webkit-transform: rotate(90deg);
	-ms-animation-delay: .7700000000000001s;
	-ms-transform: rotate(90deg);
	-o-animation-delay: .7700000000000001s;
	-o-transform: rotate(90deg);
	animation-delay: .7700000000000001s;
	transform: rotate(90deg)
}

#rotateG_06 {
	right: 8px;
	bottom: 7px;
	-moz-animation-delay: .8800000000000001s;
	-moz-transform: rotate(135deg);
	-webkit-animation-delay: .8800000000000001s;
	-webkit-transform: rotate(135deg);
	-ms-animation-delay: .8800000000000001s;
	-ms-transform: rotate(135deg);
	-o-animation-delay: .8800000000000001s;
	-o-transform: rotate(135deg);
	animation-delay: .8800000000000001s;
	transform: rotate(135deg)
}

#rotateG_07 {
	bottom: 0;
	left: 26px;
	-moz-animation-delay: .99s;
	-moz-transform: rotate(180deg);
	-webkit-animation-delay: .99s;
	-webkit-transform: rotate(180deg);
	-ms-animation-delay: .99s;
	-ms-transform: rotate(180deg);
	-o-animation-delay: .99s;
	-o-transform: rotate(180deg);
	animation-delay: .99s;
	transform: rotate(180deg)
}

#rotateG_08 {
	left: 8px;
	bottom: 7px;
	-moz-animation-delay: 1.1s;
	-moz-transform: rotate(-135deg);
	-webkit-animation-delay: 1.1s;
	-webkit-transform: rotate(-135deg);
	-ms-animation-delay: 1.1s;
	-ms-transform: rotate(-135deg);
	-o-animation-delay: 1.1s;
	-o-transform: rotate(-135deg);
	animation-delay: 1.1s;
	transform: rotate(-135deg)
}

@
-moz-keyframes fadeG { 0% {
	background-color: #000
}

100%
{
background-color


:

 

#FFF


    

}
}
@
-webkit-keyframes fadeG { 0% {
	background-color: #000
}

100%
{
background-color


:

 

#FFF


    

}
}
@
-ms-keyframes fadeG { 0% {
	background-color: #000
}

100%
{
background-color


:

 

#FFF


    

}
}
@
-o-keyframes fadeG { 0% {
	background-color: #000
}

100%
{
background-color


:

 

#FFF


    

}
}
@
keyframes fadeG { 0% {
	background-color: #000
}
100%
{
background-color


:

 

#FFF


    

}
}
</style>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>

<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="contain">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="navbar-brand">
					<a href="index.jsp"><img src="./img/siccha.png"
						class="img-responsive" /></a>
				</div>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="selectPage.html">메뉴선정</a></li>
					<li><a href="myPage.jsp">마이페이지</a></li>
					<li><a href="Board.do?action=list.jsp">문의게시판</a></li>
					<li><a href="Member.do?action=logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid bg-info">
		<div class="modal-dialog">
			<div class="modal-content" style="margin-top: 100px; margin-bottom: 100px">
				<div class="modal-header">
					<h3>
						<span class="label label-warning" id="qid">${result.size()}</span> 메뉴 선정 결과
					</h3>
				</div>
				<div class="modal-body">
					<div class="quiz" id="quiz" data-toggle="buttons">
						<c:if test="${result.size() == 0}">
							그런 메뉴 없습니다.
							<br>
							<a href="selectPage.html">메뉴 선택으로 돌아가기</a>
						</c:if>
						<c:forEach var="food" items="${result}" varStatus="i">
							<label
								class="element-animation${i.count} btn btn-lg btn-primary btn-block">
								<span class="btn-label"> <i
									class="glyphicon glyphicon-chevron-right"></i>
							</span> <input type="radio"
								onclick="location='Matching.do?action=img_search&fname=${food}'">${food}</label>
						</c:forEach>
					</div>
				</div>
				<div class="modal-footer text-muted">
					<span id="answer"></span>
				</div>
			</div>
		</div>
	</div>







	<%-- <c:forEach var="item" items="${list}">
		<h6>${item.title}
			<br> <img width="200px" height="200px" src="${item.link}">
			<img src="${item.thumbnail}">
		</h6>
		<hr>
	</c:forEach> --%>
</body>
</html>