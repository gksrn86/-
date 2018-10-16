<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!Doctype html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<style>

.navbar-brand {
	padding: 0px;
}

.container {
	margin-top: 70px;
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

/* ------------------------------------------- */


/* ------------결과 버튼 스타일------------ */
.button {
	border-radius: 4px;
	background-color: #8bd1e0;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 28px;
	padding: 20px;
	width: 200px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}
</style>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var navItems = $('.admin-menu li > a');
		var navListItems = $('.admin-menu li');
		var allWells = $('.admin-content');
		var allWellsExceptFirst = $('.admin-content:not(:first)');
		allWellsExceptFirst.hide();
		navItems.click(function(e) {
			e.preventDefault();
			navListItems.removeClass('active');
			$(this).closest('li').addClass('active');
			allWells.hide();
			var target = $(this).attr('data-target-id');
			$('#' + target).show();
		});
	});
</script>
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
				<li><a href="selectPage1.html">메뉴선정</a></li>
				<li><a href="loginPage.jsp">로그인</a></li>
				<li><a href="signUp.jsp">회원가입</a></li>
				<li><a href="myPage.jsp">마이페이지</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container">

		<div class="row">

			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked admin-menu">

					<li class="active"><a href="" data-target-id="select"><i
							class="glyphicon glyphicon-user"></i>메뉴 선정</a></li>
					<li><a href="" data-target-id="profile"><i
							class="glyphicon glyphicon-user"></i>회원 정보 보기</a></li>
					<li><a href="" data-target-id="change-info"><i
							class="glyphicon glyphicon-lock"></i>회원 정보 변경</a></li>
					<li><a href="" data-target-id="settings"><i
							class="glyphicon glyphicon-cog"></i>회원 탈퇴</a></li>
					<li><a href="" data-target-id="logout"><i
							class="glyphicon glyphicon-log-out"></i>로그아웃</a></li>
				</ul>
			</div>

			<!------------ 메뉴 선정 페이지 ------------>
			<form action="Matching.do?action=maching" method="post">
			<div class="col-md-9  admin-content" id="select">
				<div class="panel panel-info" style="margin: 1em;">
					<div class="panel-heading" align="center">
						<h3 class="panel-title">대분류</h3>
					</div>
					<div class="panel-body" align="center">
						<label for="chk1"><input type="radio" name="mainCategory" value="1" id="chk1">식사류</label> 
						<label for="chk2"><input type="radio" name="mainCategory" value="2" id="chk2">안주류</label>
						<label for="chk3"><input type="radio" name="mainCategory" value="3" id="chk3">간편식</label>
					</div>
				</div>

				<div class="panel panel-info" style="margin: 1em;">
					<div class="panel-heading" align="center">
						<h3 class="panel-title">면 류 / 밥 류</h3>
					</div>
					<div class="panel-body" align="center">
						<label for="chk4"><input type="radio" name="menBob" value="4" id="chk4">면 류</label> 
						<label for="chk5"><input type="radio" name="menBob" value="5" id="chk5">밥 류</label>
					</div>
				</div>
				
				<div class="panel panel-info" style="margin: 1em;">
					<div class="panel-heading" align="center">
						<h3 class="panel-title">국물 선택</h3>
					</div>
					<div class="panel-body" align="center">
						<label for="chk6"><input type="radio" name="soup" value="6" id="chk6">국물 있음</label> 
						<label for="chk7"><input type="radio" name="soup" value="7" id="chk7">국물 없음</label>
					</div>
				</div>
				
				<div class="panel panel-info" style="margin: 1em;">
					<div class="panel-heading" align="center">
						<h3 class="panel-title">소재 선택</h3>
					</div>
					<div class="panel-body" align="center">
						<label for="chk18"><input type="radio" name="meat" value="18" id="chk18">육류 포함</label> 
						<label for="chk19"><input type="radio" name="meat" value="19" id="chk19">육류 제외</label><hr>
						<label for="chk16"><input type="radio" name="seafood" value="16" id="chk16">해산물 포함</label>
						<label for="chk17"><input type="radio" name="seafood" value="17" id="chk17">해산물 제외</label>
					</div>
				</div>
				
				<div class="panel panel-info" style="margin: 1em;">
					<div class="panel-heading" align="center">
						<h3 class="panel-title">옵션 선택</h3>
					</div>
					<div class="panel-body" align="center">
						<label for="chk8"><input type="radio" name="spicy" value="8" id="chk8">매운맛 있음</label> 
						<label for="chk9"><input type="radio" name="spicy" value="9" id="chk9">매운맛 없음</label><hr>
						<label for="chk21"><input type="radio" name="hot" value="21" id="chk21">따뜻한 음식</label>
						<label for="chk20"><input type="radio" name="hot" value="20" id="chk20">시원한 음식</label>
					</div>
				</div><br>
				<div align="center">
				<button type="submit" class="button">
					<span>결과 보기</span>
				</button>
				</div>
				<br><br><br>
			</div>
			</form>

			<div class="col-md-9  admin-content" id="profile">
				<div class="panel panel-info" style="margin: 1em;">
					<div class="panel-heading">
						<h3 class="panel-title">아이디</h3>
					</div>
					<div class="panel-body"></div>
				</div>
				<div class="panel panel-info" style="margin: 1em;">
					<div class="panel-heading">
						<h3 class="panel-title">이메일</h3>
					</div>
					<div class="panel-body"></div>
				</div>

			</div>
			<div class="col-md-9  admin-content" id="settings">
				<div class="panel panel-info" style="margin: 1em;">
					<div class="panel-heading">
						<h3 class="panel-title">회원 탈퇴</h3>
					</div>
					<div class="panel-body">
						정말로 탈퇴 하시겠습니까? <a href="#" class="label label-danger"
							onclick="event.preventDefault();
                                                     document.getElementById('memberLeave-form').submit();">
							<span>네</span>
						</a> <a href="/account" class="label label-success"><span>아니요</span></a>
					</div>
					<form id="memberLeave-form" action="#" method="POST"
						style="display: none;"></form>

				</div>
			</div>

			<div class="col-md-9  admin-content" id="change-info">
				<form action="/info" method="post">
					<div class="panel panel-info" style="margin: 1em;">
						<div class="panel-heading">
							<h3 class="panel-title">
								<label for="new_email" class="control-label panel-title">새로운
									이메일</label>
							</h3>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-sm-10">
									<input type="email" class="form-control" name="email"
										id="new_email">
								</div>
							</div>

						</div>
					</div>

					<div class="panel panel-info" style="margin: 1em;">
						<div class="panel-heading">
							<h3 class="panel-title">
								<label for="new_password" class="control-label panel-title">새로운
									패스워드</label>
							</h3>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-sm-10">
									<input type="password" class="form-control" name="password"
										id="new_password">
								</div>
							</div>

						</div>
					</div>


					<div class="panel panel-info" style="margin: 1em;">
						<div class="panel-heading">
							<h3 class="panel-title">
								<label for="confirm_password" class="control-label panel-title">패스워드
									확인</label>
							</h3>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-sm-10">
									<input type="password" class="form-control"
										name="password_confirmation" id="confirm_password">
								</div>
							</div>
						</div>
					</div>


					<div class="panel panel-info border" style="margin: 1em;">
						<div class="panel-body">
							<div class="form-group">
								<div class="pull-left">
									<input type="submit" class="form-control btn btn-primary"
										name="submit" id="submit">
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>

			<div class="col-md-9  admin-content" id="settings"></div>

			<div class="col-md-9  admin-content" id="logout">
				<div class="panel panel-info" style="margin: 1em;">
					<div class="panel-heading">
						<h3 class="panel-title">로그아웃</h3>
					</div>
					<div class="panel-body">
						정말로 로그아웃 하시겠습니까? <a href="#" class="label label-danger"
							onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
							<span>네</span>
						</a> <a href="/account" class="label label-success"><span>아니요</span></a>
					</div>
					<form id="logout-form" action="#" method="POST"
						style="display: none;"></form>

				</div>
			</div>
		</div>
	</div>
</head>
</body>
</html>