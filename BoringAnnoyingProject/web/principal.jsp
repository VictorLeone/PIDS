<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>SignMe UP!™</title>
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

                        <div class="profile-userpic" name="teste">
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
                            <div id="nickname" class="profile-usertitle-job" style="display:none;">
                                ${currentUser.nickname}
                            </div>
                        </div>

                    </div>


                    <div class="botoes text-center fixed-buttons">
                        <a href="ProductController?action=listPd"><button type="button" class="btn botao">Assinar</button></a>
                        <a id="testeform" href=""><button type="button" class="btn botao">Editar Perfil</button></a>
                        <a href="index.jsp"><button onclick="onLogOut()" type="button" class="btn botao">Sair</button></a>
                    </div>

                </div>
                <div class="col-9 main-image">
                    <div class="row">
                        <div class="window-title">
                            <h1 style="color:white">Meus SignedPackages</h1>
                        </div>
                        <c:forEach items="${products}" var="product">
                            <div class="card" style="width: 18rem;">
                                <img class="card-img-top" src="<c:out value="${product.pdImg}" />" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title"><b><c:out value="${product.pdName}" /></b></h5>
                                    <h6><b><c:out value="R$ ${product.pdPrice},00" /></b></h6>
                                    <p class="card-text"><c:out value="${product.pdDesc}" /></p>
                                </div>

                                <div class="card-body">
                                    <a id="delreq${product.pdid}" onmouseover="del(${product.pdid})"><img class="icon" src="images/delete.png">Cancelar</a>

                                </div>
                            </div> 
                        </c:forEach>
                    </div>
                </div>
            </div>

            <script src="js/jquery.min.js"></script>
            <script src="js/popper.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/localstorage.js"></script>
            <script>saveStuff()</script>
            <script>loadStuff()</script>
 
            <script type="text/javascript">
                h = (window.innerHeight - 80).toString() + "px";
                document.getElementById("row").style.height = h;
            </script>
    </body>
</html>