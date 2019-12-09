<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ver Signeds™</title>
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
                                <img id="img" src="s" class="img-responsive" alt="">
                            </div>

                            <div class="profile-usertitle">
                                <div id="userid" class="profile-usertitle-name" style="display:none;">
                                    <p id="userid"> </p>
                                </div>
                                <div id="nome" class="profile-usertitle-name">
                                    <p id="nome"> </p>
                                </div>
                                <div id="sobrenome" class="profile-usertitle-job">
                                    <p id="sobrenome"></p>
                                </div>
                            </div>

                        </div>

                    <div class="botoes text-center fixed-buttons">
                        <a href="cadastrar-prd.jsp"><button type="button" class="btn botao">Cadastrar Sign Package</button></a>
                        <a href="ProductController?action=viewEditPd"><button type="button" class="btn botao">Ver e editar Packages</button></a>
                        <a href="index.jsp"><button type="button" class="btn botao">Sair</button></a>
                    </div>


                </div>
                <div class="col-9 main-image">
                    <div class="row">
                        <div class="window-title">
                            <h1 style="color:white">Ver e editar Signeds</h1>
                        </div>>
                        <c:forEach items="${users}" var="user">

                            <div class="card" style="width: 18rem;">
                                <img class="card-img-top" src="<c:out value="${user.imgDir}" />" alt="Card image cap">

                                <div class="card-body">
                                    <h5 class="card-title"><b><c:out value="${user.firstName} ${user.lastName}" /></b></h5>
                                    <h6><b><c:out value="${user.nickname}" /></b></h6>
                                    <p class="card-text"><c:out value="${user.email}" /></p>
                                </div>

                                <div class="card-body">

                                    <a href="UserController?action=update&userId=<c:out value="${user.userid}"/>"><img class="icon" src="images/edit.png"></a>
                                    <a href="UserController?action=delete&userId=<c:out value="${user.userid}"/>"><img class="icon" src="images/delete.png"></a>

                                </div>
                            </div> 

                        </c:forEach>
                    </div>

                    <div class="modal fade" id="modalCartao" tabindex="-1" role="dialog" aria-labelledby="modalCartao" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content" >
                                <div class="modal-header">
                                    <h5 class="modal-title" id="modalCartao">Pagamento</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <img class="ccard"src="images/card.png">
                                    <form class="needs-validation" novalidate>
                                        <div class="form-group">
                                            <label for="inputEmail4">Nome no cartão</label>
                                            <input type="email" class="form-control" id="nome" placeholder="Nome " required>
                                            <div class="invalid-feedback">
                                                Please choose a username.
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="inputAddress">Cartão</label>
                                                <input type="text" class="form-control" id="cartao" placeholder="0000 0000 0000 0000" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputPassword4">CPF</label>
                                                <input type="password" class="form-control" id="cpf" placeholder="000.000.000-00" required>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4">Data Validade</label>
                                                <input type="email" class="form-control" id="inputEmail4" placeholder="MM/AA" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputPassword4">CVV</label>
                                                <input type="password" class="form-control" id="inputPassword4" placeholder="CVV" required>
                                            </div>
                                        </div>
                                        <button class="btn btn-primary" type="submit">Submit form</button>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>



        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/localstorage.js"></script>

        <script>loadStuff();</script>

        <script type="text/javascript">
            h = (window.innerHeight - 80).toString() + "px";
            document.getElementById("row").style.height = h;
        </script>
        <script>
            // Example starter JavaScript for disabling form submissions if there are invalid fields
            (function () {
                'use strict';
                window.addEventListener('load', function () {
                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                    var forms = document.getElementsByClassName('needs-validation');
                    // Loop over them and prevent submission
                    var validation = Array.prototype.filter.call(forms, function (form) {
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                }, false);
            })();
        </script>
    </body>
</html>