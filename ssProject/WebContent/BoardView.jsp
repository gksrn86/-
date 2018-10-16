<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
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
	   <table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
	    <thead>
	      <tr>
	        <td colspan="3" style="background-color: #eeeeee; text-align:center;">게시판 글보기</td>	        
	      </tr>
	     </thead>
	     <tbody>
	    <tr><td style="width: 20%;">번호</td>
	     <td colspan="2" style="min-heiget: 100px; text-align: center;">${result.num}</td></tr>
	     <tr>
	     <td style="width: 20%;">글 제목</td>
	     <td colspan="2" style="min-heiget: 100px; text-align: center;">${result.title}</td>
	     </tr>
	       <tr>
	     <td style="width: 20%;">작성자</td>
	     <td colspan="2" style="min-heiget: 100px; text-align: center;">${result.write}</td>
	     </tr>
	     <tr>
	     <td style="width: 20%;">작성일자</td>
	     <td colspan="2" style="min-heiget: 100px; text-align: center;">${result.wdate}</td>
	     </tr>
	     <tr>
	     <td style="width: 20%;">내용</td>
	     <td colspan="2" style="min-heiget: 100px; text-align: center;">${result.cont}</td>
	     </tr>
	     </tbody>
	   </table>
	   <%
		String id =(String)session.getAttribute("id");
	    String write = (String)request.getAttribute("write");
		if(id.equals(write)){
	%>
	    <a href="Board.do?action=updateview&num=${result.num}" class="btn btn-primary">수정</a>
	    <a href="Board.do?action=delete&num=${result.num}" class="btn btn-primary">삭제</a>
	<%
		}else{
			
	%>
		
	<%
		}
	%>  
	</div>
   </div>
   <script src="https://code.jquery.com/jqery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>
</body>
</html>