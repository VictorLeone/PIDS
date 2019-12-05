<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>NOT WORKING PROPERLY</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='https://fonts.googleapis.com/css?family=Rubik' rel='stylesheet'>
        <link rel='icon' href='images/favicon.png' type='image/x-icon' sizes="16x16" />

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    
    </head>
    <body id="main">
        <div class="container-fluid">
            <nav class="navbar">
                <a class="navbar-brand" href="principal.html">
                    <img src="images/logo-branca.png" alt="Door Flex" class="logo-nav">
                </a>
            </nav>

            <div class="row" id="row">
                <div class="col-3">
                    <div class="perfil fixed-photo">
                        <div>
                            <img src="images/perfil.png">
                        </div>
                        <div class="center">
                            <p><b>Nome: </b> Administrador do sistema</p>
                            <p><b>Código: </b> 00</p>	
                        </div>				
                    </div>
                    <div class="botoes text-center fixed-buttons">
                        <a href="cadastrar-visitante.html"><button type="button" class="btn botao">Cadastrar Visitantes</button></a>
                        <a href="lista-visitantes.html"><button type="button" class="btn botao">Lista de Visitantes</button></a>
                        <a href="gerar-chave.html"><button type="button" class="btn botao">Gerar Chaves</button></a>
                        <a href="ultimas-visitas.html"><button type="button" class="btn botao">Últimas Visitas</button></a>
                        <a href="index.html"><button type="button" class="btn botao">Sair</button></a>
                    </div>

                    
                </div>
                <div class="col-9 main-image">
                    <div class="row">
                        <c:forEach items="${products}" var="product">
                            <div class="col-md-3 col-lg-5 px-0" style="max-width:210px">
                                <div class="card">
                                    <h5><img src="<c:out value="${product.pdImg}" />" alt="Avatar" style="width:197px;height:197px;opacity:0.85;padding:9px;"></h5>
                                    <div class="cardContainer">
                                        <h5 style="margin-bottom: 0px;"><b><c:out value="${product.pdName}" /></b></h5>    
                                        <p><c:out value="${product.pdPrice}" /></p>    
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>


                </div>
            </div>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript">
            h = (window.innerHeight - 80).toString() + "px";
            document.getElementById("row").style.height = h;
        </script>
    </body>
</html>