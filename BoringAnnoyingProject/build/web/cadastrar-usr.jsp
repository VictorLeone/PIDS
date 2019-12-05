<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <link type="text/css" href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="http://www.godtur.no/godtur/js/jquery-ui-1.8.18.custom.min.js"></script>
        <link href="css/popup.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"  />
        <title>Door Flex</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='https://fonts.googleapis.com/css?family=Rubik' rel='stylesheet'>
        <link rel='icon' href='images/favicon.png' type='image/x-icon' sizes="16x16" />

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/validation.js"></script>

    </head>
    <body>
        <script>
            $(function () {
                $('input[name=dob]').datepicker();
            });
        </script>

        <nav class="navbar">
            <a class="navbar-brand" href="principal.html">
                <img src="images/logo-branca.png" alt="Door Flex" class="logo-nav">
            </a>
        </nav>

        <div class="card" style="width: 40%; margin: auto; min-width:350px;">

            <div class="cardContainer"> 

                <div class="text-center">
                    <h1 class="titulo">Novo Signed™</h1>
                </div>
                <div class="container-fluid">
                    <form  name="frmAddUser" action="UserController" onsubmit="return validateFormUsr()"  method="POST">
                        <div class="form-group">

                            <div class="row">
                                <div class="col-sm"> 
                                    <label>Usuário</label>
                                    <input id="un" type="text" class="form-control" name="nickname"  placeholder="Nome de usuário" value="<c:out value="${user.nickname}" />" />
                                </div>
                                <div class="col-sm"> 
                                    <label>Senha</label>
                                    <input id="ps" type="password" class="form-control" name="password"  placeholder="Senha de acesso"  value="<c:out value="${user.password}" />" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm">
                                    <label>Nome</label>
                                    <input id="nm" type="text" class="form-control" name="firstName"  placeholder="Primeiro nome" value="<c:out value="${user.firstName}" />" /> 
                                </div>
                                <div class="col-sm">
                                    <label>Sobreome</label>
                                    <input id="sn" type="text" class="form-control" name="lastName"  placeholder="Sobrenome" value="<c:out value="${user.lastName}" />" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm">
                                    <label>CPF</label>
                                    <input id="dc" type="text" data-mask="000.000.000-00" class="form-control" name="documento" placeholder="000.000.000-00"  value="<c:out value="${user.document}" />" />

                                </div>
                                <div class="col-sm">
                                    <label>Data de  nascimento</label>
                                    <input id="dn" type="text" class="form-control" placeholder="DD/MM/AAAA" name="dob" data-mask="00/00/0000" data-date-format="dd/MM/yyyy" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${user.dob}" />" />
                                </div>
                            </div>
                            <label>Endereço</label>
                            <input id="ad" type="text" class="form-control" name="adress"  value="<c:out value="${user.adress}" />" />
                            <div class="row">
                                <div class="col-sm">
                                    <label>Celular</label>
                                    <input id="pn" type="text" data-mask="(00) 0 0000-0000" class="form-control" name="phone" placeholder="(00) 00000-0000"  value="<c:out value="${user.phone}" />" />
                                </div>
                                <div class="col-sm">
                                    <label>E-mail</label>
                                    <input id="em" type="text" class="form-control" name="email"  placeholder="Ex: sign@meup.com" value="<c:out value="${user.email}" />" />
                                </div>
                            </div>
                                                            <label>Imagem de perfil</label>
                            <input id="ppic" type="text" class="form-control" name="profilepic" placeholder="Ex: https://mypic.com/img.png" value="<c:out value="${user.imgDir}" />" />
                        </div>
                        <div class="text-center">
                            <!--                                <button class="btn botao" data-toggle="modal" data-target="#myModal">Cadastrar</button>-->
                            <button class="btnCad" id="cadbt">Cadastrar</button>
                        </div>
                                </form>
                </div>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.mask.min.js"></script>
    </body> 

</html>
