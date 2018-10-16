<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="edu.smu.ss.dao.BoardDao" %>
<%@ page import="edu.smu.ss.vo.Board" %>
<%@ page import="java.util.ArrayList" %>
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
	   <form method="post" action="Board.do?action=save">
	   <table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
	    <thead>
	      <tr>
	        <th colspan="2" style="background-color: #eeeeee; text-align:center;">게시판 글쓰기</th>	        
	      </tr>
	     </thead>
	    <tbody>
	   	   <tr>
	   	   	  <jsp:useBean id="id" class="java.lang.String" scope="session"/>
	          <td><input type="text" class="form-control" placeholder="작성자" name="write" maxlength="100" value="<%=id%>" readonly/></td>
	       </tr>
	       <tr>
	          <td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="100"></td>
	       </tr>
	       <tr>
	          <td><textarea class="form-control" placeholder="글 내용" name="cont" maxlength="2048" style="height: 350px"></textarea></td>
	       </tr>
	     </tbody>
	   </table>
	     <input type="submit" class="btn btn-primary pull-right" value="글저장">
	   </form>   
	</div>
   </div>
   <script src="https://code.jquery.com/jqery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>
</body>
</html>