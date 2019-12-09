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
        <title>Novo Signed Package™</title>
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

        <div class="card cadastro" style="width: 40%; margin: auto; min-width:350px;">

            <div class="cardContainer"> 

                <div class="text-center">
                    <h1 class="titulo">SignedPackage™ ++</h1>
                </div>
                <div class="container-fluid">
                    <form  name="frmAddPd" action="ProductController" onsubmit="return validateFormPd()"  method="POST">
                        <div class="form-group">
                            <div class="text-center">
                                <img id="imagem" src="" width="200px" >
                            </div>
                           <label>Imagem do pacote</label>
                            <input id="pkgimg" type="text" class="form-control" name="pkgimgpath" placeholder="Ex: https://mypic.com/img.png" value="<c:out value="${user.imgDir}" />" />
                            <label>Nome do pacote de vantagens</label>
                            <input id="pkgnm" type="text" class="form-control" name="pkgname"  placeholder="Sign package" value="<c:out value="${product.pdName}" />" />
    
                            <label>Valor do pacote</label>
                            <input id="pkgvl" type="number" class="form-control" name="pkgvalue" placeholder="Valor mensal"  value="<c:out value="${product.pdPrice}" />" />
                                
                            <label>Descrição do pacote</label>
                            <input id="pkgdc" type="text" class="form-control" name="pkgdescription"  value="<c:out value="${product.pdDesc}" />" />
                            
                        </div>
                        <div class="text-center">
                            <!--                                <button class="btn botao" data-toggle="modal" data-target="#myModal">Cadastrar</button>-->
                            <button class="btn botao" id="cadbt">Adicionar</button>
                        </div>
                                </form>
                </div>
            </div>
                        
        </div>
                        
        <script>           
            imagem = document.getElementById("imagem");
            campo = document.getElementById("pkgimg");
            
            campo.onblur = function() {
                imagem.src = campo.value;
            }
        </script>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.mask.min.js"></script>
    </body> 

</html>
