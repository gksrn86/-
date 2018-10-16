<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="edu.smu.ss.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.insert-Result{
	color: red;
}
</style>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
<style>
.container {
	margin-top: 70px;
	float: left;
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
</style>
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
				<li><a href="Board.do?action=list">문의게시판</a></li>
				<li><a href="Member.do?action=logout">로그아웃</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container">

		<div class="row">

			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked admin-menu">
					<li class="active"><a href="" data-target-id="insertMenu"><i
							class="glyphicon glyphicon-user"></i>메뉴 추가</a></li>
					<li><a href="" data-target-id="profile"><i
							class="glyphicon glyphicon-user"></i>회원 정보 보기</a></li>
					<li><a href="" data-target-id="change-info"><i
							class="glyphicon glyphicon-lock"></i>회원 정보 변경</a></li>
					<li><a href="" data-target-id="settings"><i
							class="glyphicon glyphicon-cog"></i>회원 탈퇴</a></li>
				</ul>
			</div>

			<div class="col-md-9  admin-content" id="insertMenu">
				<div class="panel panel-info" style="margin: 1em;">
					<div class="panel-heading">
						<h3 class="panel-title">메뉴 추가</h3>
					</div>
					<div class="panel-body">
						<form action="Matching.do?action=insertMenu" method="post">
							<table>
								<tr>
									<td>메뉴 이름</td>
									<td><input type="text" name="fname"></td>
								</tr>
								<tr>
									<td>대분류</td>
									<td><select name="mainCategory">
											<option value="1">식사류</option>
											<option value="2">안주류</option>
											<option value="3">간편식</option>
									</select></td>
								</tr>
								<tr>
									<td>면 / 밥</td>
									<td><select name="menBob">
											<option value="4">면 류</option>
											<option value="5">밥 류</option>
									</select></td>
								</tr>
								<tr>
									<td>국물 선택</td>
									<td><select name="soup">
											<option value="6">국물 있음</option>
											<option value="7">국물 없음</option>
									</select></td>
								</tr>
								<tr>
									<td>소재 선택</td>
									<td><select name="meat">
											<option value="18">육류 포함</option>
											<option value="19">육류 제외</option>
									</select></td>
								</tr>
								<tr>
									<td>소재 선택</td>
									<td><select name="seafood">
											<option value="16">해산물 포함</option>
											<option value="17">해산물 제외</option>
									</select></td>
								</tr>
								<tr>
									<td>옵션 선택</td>
									<td><select name="spicy">
											<option value="8">매운맛 있음</option>
											<option value="9">매운맛 없음</option>
									</select></td>
								</tr>
								<tr>
									<td>온도 선택</td>
									<td><select name="hot">
											<option value="21">따뜻한 음식</option>
											<option value="20">시원한 음식</option>
									</select></td>
								</tr>
							</table>
							<p>
								<br> <input type="submit" value="메뉴 등록">
						</form>
					</div>
					<p>
					<c:if test="${insertResult == 'success'}">
							<h5 class="insert-Result">메뉴가 추가되었습니다.</h5>
						</c:if>
					</p>
				</div>
			</div>

			<div class="col-md-9  admin-content" id="profile">

				<div class="panel panel-info" style="margin: 1em;">
					<div class="panel-heading">
						<h3 class="panel-title">아이디</h3>
					</div>
					<div class="panel-body">${member.id }</div>
				</div>
				<div class="panel panel-info" style="margin: 1em;">
					<div class="panel-heading">
						<h3 class="panel-title">이메일</h3>
					</div>
					<div class="panel-body">${member.email }</div>
				</div>

			</div>
			<div class="col-md-9  admin-content" id="settings">

				<div class="panel panel-info" style="margin: 1em;">
					<div class="panel-heading">
						<h3 class="panel-title">회원 탈퇴</h3>
					</div>
					<div class="panel-body">
						정말로 탈퇴 하시겠습니까? <a href="Member.do?action=delete"
							class="label label-danger"> <span>네</span>
						</a> <a href="index.jsp" class="label label-success"><span>아니요</span></a>
					</div>
					<form id="memberLeave-form" action="#" method="POST"
						style="display: none;"></form>

				</div>

			</div>

			<div class="col-md-9  admin-content" id="change-info">
				<form action="Member.do" method="post">
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
									<input type="hidden" name="action" value="update"> <input
										type="email" class="form-control" name="email" id="new_email">
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


		</div>
	</div>
</head>
</body>
</html>