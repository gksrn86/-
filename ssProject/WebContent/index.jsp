<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!Doctype html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<style type="text/css">
		.navbar-brand .img-responsive  {
		    width:150px;
		    height: 80px;
		    padding-bottom: 30px;
		    
		}
		
		.navbar-default {
		    padding-top:10px;
		    padding-bottom:10px;
		}
		#bs-example-navbar-collapse-1{
			font-size: 20px;
		}
		.image .text{

			 position:absolute;
			 
			 top:35%;
			  
			 right: 10%;
			 
			 width:700px;
	  
			 font-size:25px;
		}

		#menu_btn{
			font-size:50px;
			color: #ffffff;
			background-color: #f0ad4e;
		}

	</style>
	
	
	<style type="text/css">
		.navbar-brand {
		 	padding: 0px;
		 	padding-top: 0px;
		 	padding-left: 5px;
		}
	</style>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	</script>
		
</head>
	<body>
	<nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-brand">
                    <a href="index.jsp"><img src="./img/siccha.png" class="img-responsive" /></a>
                </div>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                   
                    <%
		String id =(String)session.getAttribute("id");
		if(id == null){
	%>
	
	<li><a href="loginPage.jsp">로그인</a></li>
	<li><a href="signUp.jsp">회원가입</a></li>
	<%
		}else{
	%>
	<li><a href="selectPage.html">메뉴선정</a></li>
	<li><a href="Member.do?action=myPage">마이페이지</a></li>
	<li><a href="Board.do?action=list">문의게시판</a></li>
	<li><a href="Member.do?action=logout">로그아웃</a></li>
	<%
		}
	%>         
                </ul>
            </div>
        </div>
    </nav>
   <div class="image">
	<img alt="메인 사진" src="img/배경2.jpg" width="1887">
		<div class="text">
			<h1>당신의 음식고민!<br>메뉴선정으로 도와드립니다.</h1>
			<%
		id =(String)session.getAttribute("id");
		if(id == null){
	%>
		<button id="menu_btn" onclick="location.href='loginPage.jsp'">메뉴선정 하기</button>
	<%
		}else{
	%>
	<button id="menu_btn" onclick="location.href='selectPage.html'">메뉴선정 하기</button>
	<%
		}
	%>
			
		</div>
   </div>	
</body>
</html>