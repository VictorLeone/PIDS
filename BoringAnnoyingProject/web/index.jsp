<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>SignMe UP!™ Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<link href='https://fonts.googleapis.com/css?family=Rubik' rel='stylesheet'>
	<link rel='icon' href='images/favicon.png' type='image/x-icon' sizes="16x16" />

	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
</head>
<body id="login">
	<div class="container-fluid">
		<div class="row" id="row">
			<div class="col-md-8 col-sm-6 index-image sm-hide">
			</div>
			<div class="col-md-4 col-sm-6 center">
				<form  name="frmLogin" action="LoginController" onsubmit="return validateLogin()" method="POST">
					<div class="text-center logo">
						<img src="images/logo-azul.png">
					</div>
                                                        
					<div class="form-group">
						<label>Usuário</label>
						<input id="usr" type="text" class="form-control" name="nickname">

						<label>Senha</label>
						<input id="pass" type="password" class="form-control" name="upass">
					</div>
					<div class="text-center">
						<a href=""><button type="submit" class="btn botao">Entrar</button></a>
					</div>
                                                      
					<br/>
					<div class="text-center">
						<a href="cadastrar-usr.jsp"><button type="button" class="btn botao">Cadastrar</button></a>
					</div>
  </form>
				
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <script src="js/validation.js"></script>
        <script src="js/localstorage.js"></script>
        <script>onLogOut();</script>
	<script type="text/javascript">
		h = window.innerHeight.toString() + "px";
		document.getElementById("row").style.height = h;
	</script>
        
</body>
</html>