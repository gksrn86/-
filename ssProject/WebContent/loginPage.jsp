<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!Doctype html>
<html>
<head>

	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<style type="text/css">
		body#LoginForm{ background-image:url('img/로그인 배경.jpg'); background-size:cover; padding:10px;}

.panel h2{ color:#444444; font-size:30px; margin:20px 0 8px 0;}
.panel p { color:#777777; font-size:20px; margin-bottom:30px; line-height:24px; margin-top: 40px;}
.login-form .form-control {
  background: #f7f7f7 none repeat scroll 0 0;
  border: 1px solid #d4d4d4;
  border-radius: 4px;
  font-size: 20px;
  height: 50px;
  line-height: 50px;
  margin-top: 40px;
}
.main-div {
  background: #ffffff none repeat scroll 0 0;
  border-radius: 2px;
  margin: 150px auto 30px;
  max-width: 38%;
  padding: 50px 70px 70px 71px;
  height: 600px;
}

.login-form .form-group {
  margin-bottom:10px;
}
.login-form{ text-align:center;}

.login-form  .btn.btn-primary {
  background: #f0ad4e none repeat scroll 0 0;
  border-color: #f0ad4e;
  color: #ffffff;
  font-size: 14px;
  width: 100%;
  height: 50px;
  line-height: 50px;
  padding: 0;
  margin-top: 40px;
}

.botto-text {
  color: #ffffff;
  font-size: 14px;
  margin: auto;
}
.login-form .btn.btn-primary.reset {
  background: #ff9900 none repeat scroll 0 0;
}
.back { text-align: left; margin-top:10px;}
.back a {color: #444444; font-size: 13px;text-decoration: none;}
	</style>

</head>
<body id="LoginForm">
	<div class="container">
	<%
		String msg = (String)request.getAttribute("msg");
	if(msg!=null){
		
	%>
	<%=msg %>
	<%
		}
	%>
	<form action="Member.do?action=login" method="post">
		<div class="login-form">
			<div class="main-div">
				<div class="panel">
					<h2>로그인 페이지</h2>
					<p>당신의 아이디와<br> 패스워드를 입력하세요</p>
				</div>
				<form id="Login">

					<div class="form-group">


						<input type="text" class="form-control" name="inputId"
							placeholder="아이디를 입력하세요">

					</div>

					<div class="form-group">

						<input type="password" class="form-control" name="inputPassword"
							placeholder="패스워드를 입력하세요">

					</div>
					
					<button type="submit" class="btn btn-primary">로그인</button>

				</form>
				</form>
			<p><br>
				<a href="index.jsp">홈으로 돌아가기</a>
			</p>
		</div>
	</div>
</body>
</html>
