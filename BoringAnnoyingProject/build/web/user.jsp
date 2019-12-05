<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <link type="text/css" href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="http://www.godtur.no/godtur/js/jquery-ui-1.8.18.custom.min.js"></script>
        <title>Add new user</title>
    </head>
    <body>
        <script>
            $(function () {
                $('input[name=dob]').datepicker();
            });
        </script>

        <form method="POST" action='UserController' name="frmAddUser">

                        User Name : <input
                type="text" name="nickname"
                value="<c:out value="${user.nickname}" />" /> <br /> 
                                    Password : <input
                type="text" name="password"
                value="<c:out value="${user.password}" />" /> <br /> 
            First Name : <input
                type="text" name="firstName"
                value="<c:out value="${user.firstName}" />" /> <br /> 
            Last Name : <input
                type="text" name="lastName"
                value="<c:out value="${user.lastName}" />" /> <br /> 
            Document : <input
                type="text" name="document"
                value="<c:out value="${user.document}" />" /> <br /> 
            Phone : <input
                type="text" name="phone"
                value="<c:out value="${user.phone}" />" /> <br /> 
            Adress : <input
                type="text" name="adress"
                value="<c:out value="${user.adress}" />" /> <br /> 
            DOB : <input
                type="text" placeholder="dd/MM/yyyy" name="dob" data-date-format="dd/MM/yyyy"
                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${user.dob}" />" /> <br /> 
            Email : <input type="text" name="email"
                           value="<c:out value="${user.email}" />" /> <br /> 
                        Picture : <input
                type="text" name="imgDir"
                value="<c:out value="${user.imgDir}" />" /> <br /> 

            <input type="submit" value="Submit" />
        </form>
    </body>
</html>