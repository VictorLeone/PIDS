<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<title>Admin: SignMe Up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<link href='https://fonts.googleapis.com/css?family=Rubik' rel='stylesheet'>
	<link rel='icon' href='images/favicon.png' type='image/x-icon' sizes="16x16" />

	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<nav class="navbar">
	   <a class="navbar-brand" href="principal.html">
	    <img src="images/logo-branca.png" alt="Door Flex" class="logo-nav">
	  </a>
	</nav>
	<div >
		<div class="text-center">
			<h1 class="titulo">Signeds</h1>

			 <table class="table">
			    <thead>
				<tr>
<!--                <th>User Id</th>-->
                <th>Usuário</th>
                <th>Senha</th>
<!--                <th>User document</th>-->
                <th>Nome</th>
                <th>Sobrenome</th>
<!--                <th>DOB</th>-->
<!--                <th>User adress</th>
                <th>User phone</th>-->
                <th>E-mail</th>
<!--                <th>Img Directory</th>-->
                <th>Admin</th>
                <th>Editar</th>
                <th>Excluir</th>
			      </tr>
			    </thead>
			    <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
<!--                    <td><c:out value="${user.userid}" /></td>-->
                    <td><c:out value="${user.nickname}" /></td>
                    <td><c:out value="${user.password}" /></td>
<!--                    <td><c:out value="${user.document}" /></td>-->
                    <td><c:out value="${user.firstName}" /></td>
                    <td><c:out value="${user.lastName}" /></td>
<!--                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${user.dob}" /></td>-->
<!--                    <td><c:out value="${user.adress}" /></td>-->
<!--                    <td><c:out value="${user.phone}" /></td>-->
                    <td><c:out value="${user.email}" /></td>
<!--                    <td><c:out value="${user.imgDir}" /></td>-->
                    <td><c:out value="${user.admin}" /></td>
                    <td><a href="UserController?action=edit&userId=<c:out value="${user.userid}"/>"><img class="icon" src="images/edit.png"></a></td>
                    <td><a href="UserController?action=delete&userId=<c:out value="${user.userid}"/>"><img class="icon" src="images/delete.png"></a></td>
                </tr>
            </c:forEach>
			    </tbody>
			  </table>	
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.mask.min.js"></script>
 
<div class="botoes text-center">
<a href="cadastrar-usr.jsp"><button type="button" class="btn botao">Cadastrar usuário</button></a>
</div>
</body>
</html>