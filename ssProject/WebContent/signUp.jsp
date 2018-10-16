<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!Doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
body {
	background-image: url('./img/�α��� ���.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	width: 100%;
	height: 100vh;
	overflow: auto;
}

/*-----for border----*/
.container {
	font-family: Roboto, sans-serif;
	background-color: white;
	border-style: 1px solid grey;
	margin: 0 auto;
	text-align: center;
	opacity: 0.8;
	margin-top: 67px;
	box-shadow: 2px 5px 5px 0px #eee;
	max-width: 500px;
	padding-top: 10px;
	height: 550px;
	margin-top: 166px;
}

#id {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 22px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.idText {
	margin-left: 5px;
	font-family: sans-serif;
	font-size: 22px;
	margin-top: 20px;
}

.heading {
	text-decoration: bold;
	text-align: center;
	font-size: 40px;
	color: #F96;
	padding-top: 15px;
	margin-bottom: 20px;
}

#hr {
	margin-bottom: 30px;
}

#email {
	margin-top: 30px;
	margin-bottom: 30px;
	font-size: 22px;
}

.mail {
	margin-left: 6px;
	font-family: sans-serif;
	font-size: 22px;
}

.pass {
	margin-top: 9px;
	font-size: 22px;
	font-family: sans-serif;
	margin-left: 6px;
	margin-top: 23px;
}

#password {
	margin-top: 20px;
	margin-bottom: 30px;
	font-size: 22px;
}

.pno {
	font-size: 25px;
	margin-left: -13px;
	margin-top: 10px;
	color: #ff9;
}

.btn.btn-primary {
	background: #f0ad4e none repeat scroll 0 0;
	border-color: #f0ad4e;
	color: #ffffff;
	font-size: 20px;
	width: 300px;
	height: 50px;
	line-height: 50px;
	padding: 0;
}

.btn.btn-primary.reset {
	background: #ff9900 none repeat scroll 0 0;
}
</style>
</head>
<body>

	<div class="container">
	<form action="Member.do?action=save" method="post">
		<header class="heading"> ȸ������</header>
		<hr id="hr"></hr>

		<div class="row ">

			<div class="col-sm-12">
				<div class="row">
					<div class="col-xs-4">
						<label class="mail">�̸��� :</label>
					</div>
					<div class="col-xs-8">
						<input type="email" name="email" id="email"
							placeholder="�̸����� �Է��ϼ���" class="form-control">
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="row">
					<div class="col-xs-4">
						<label class="idText">���̵� :</label>
					</div>
					<div class="col-xs-8">
						<input type="text" name="id" id="id" placeholder="���̵� �Է����ּ���"
							class="form-control ">
					</div>
				</div>
			</div>

			<div class="col-sm-12">
				<div class="row">
					<div class="col-xs-4">
						<label class="pass">�н����� :</label>
					</div>
					<div class="col-xs-8">
						<input type="password" name="password" id="password"
							placeholder="�н����带 �Է����ּ���" class="form-control">
					</div>
				</div>
			</div>

		</div>
		<div class="col-sm-12">
			<button type="submit" class="btn btn-primary">�����ϱ�</button>
		</div>
		</form>
		<p><br>
			<a href="index.jsp">Ȩ���� ���ư���</a>
		</p>
	</div>
	
</body>
</html>