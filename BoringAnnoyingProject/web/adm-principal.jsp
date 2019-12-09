<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>SignAdmin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='https://fonts.googleapis.com/css?family=Rubik' rel='stylesheet'>
        <link rel='icon' href='images/favicon.png' type='image/x-icon' sizes="16x16" />

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">

    </head>
    <body id="main">
        <div class="container-fluid">
            <nav class="navbar">
            
                    <img src="images/logo-branca.png" alt="Door Flex" class="logo-nav">
              
            </nav>

            <div class="row" id="row">
                <div class="col-3">


                    <div class="profile-sidebar">

                        <div class="profile-adminpic" name="teste">
                            <img id="img" src="${currentUser.imgDir}" class="img-responsive" alt="">
                        </div>

                        <div class="profile-usertitle">
                            <div id="userid" class="profile-usertitle-name" style="display:none;">
                                ${currentUser.userid}
                            </div>
                            <div id="nome" class="profile-usertitle-name">
                                ${currentUser.firstName}
                            </div>
                            <div id="sobrenome" class="profile-usertitle-job">
                                ${currentUser.lastName}
                            </div>
                            
                        </div>

                    </div>
                    <div class="botoes text-center fixed-buttons">
                        <a href="UserController?action=listUser"><button type="button" class="btn botao">Ver e editar Signeds</button></a>
                        <a href="ProductController?action=viewEditPd"><button type="button" class="btn botao">Ver e editar Packages</button></a>
                        <a href="cadastrar-prd.jsp"><button type="button" class="btn botao">Cadastrar Sign Package</button></a>
                        <a href="index.jsp"><button onclick="onLogOut()" type="button" class="btn botao">Sair</button></a>
                    </div>


                </div>
                <div class="col-9 main-image">
                    <div class="row">
                        <div class="window-title">
                            <h1 style="color:white;">SignMe UP! </h1>
                            <h2 style="color:white;">Página de administração. </h2>
                        </div>>

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
        <script src="js/localstorage.js"></script>
        <script> saveStuff()</script>
        <script type="text/javascript">
            h = (window.innerHeight - 80).toString() + "px";
            document.getElementById("row").style.height = h;
        </script>
    </body>
</html>