function validateLogin() {
    var usrName = document.forms["frmLogin"]["nickname"].value;
    var usrPass = document.forms["frmLogin"]["upass"].value;

    if ((usrName == "") || (usrPass == "")) {
        if (usrName == "") {
            document.getElementById('usr').style.borderColor = "red";
        } else {
            document.getElementById('usr').style.borderColor = "green";
        }
        if (usrPass == "") {
            document.getElementById('pass').style.borderColor = "red";
        }else {
            document.getElementById('pass').style.borderColor = "green";
        }
        alert("Para fazer login é necessário informar todos os campos.");
        return false;
    }
}

function validateFormPd() {
    var prName = document.forms["frmAddPd"]["pkgname"].value;
    var prVal = document.forms["frmAddPd"]["pkgvalue"].value;
    var prDesc = document.forms["frmAddPd"]["pkgdescription"].value;
    var prImg = document.forms["frmAddPd"]["pkgimgpath"].value;
    if ((prName == "") ||
            (prVal == "") ||
            (prDesc == "") ||
            (prImg == ""))
    {
        if (prName == "") {
            document.getElementById('pkgnm').style.borderColor = "red";
        } else {
            document.getElementById('pkgnm').style.borderColor = "green";
        }
        if (prVal == "") {
            document.getElementById('pkgvl').style.borderColor = "red";
        } else {
            document.getElementById('pkglv').style.borderColor = "green";
        }
        if (prDesc == "") {
            document.getElementById('pkgdc').style.borderColor = "red";
        } else {
            document.getElementById('pkgdc').style.borderColor = "green";
        }
        if (prImg == "") {
            document.getElementById('pkgimg').style.borderColor = "red";
        } else {
            document.getElementById('pkgimg').style.borderColor = "green";
        }
        alert("Para cadastrar um pacote de vantagens, é necessário informar todos os campos.");
        return false;
    }

}

function validateFormUsr() {
    var nickname = document.forms["frmAddUser"]["nickname"].value;
    var password = document.forms["frmAddUser"]["password"].value;
    var firstname = document.forms["frmAddUser"]["firstName"].value;
    var lastname = document.forms["frmAddUser"]["lastName"].value;
    var documento = document.forms["frmAddUser"]["documento"].value;
    var phone = document.forms["frmAddUser"]["phone"].value;
    var email = document.forms["frmAddUser"]["email"].value;
    var adress = document.forms["frmAddUser"]["adress"].value;
    var dob = document.forms["frmAddUser"]["dob"].value;

    if ((nickname == "") ||
            (password == "") ||
            (firstname == "") ||
            (lastname == "") ||
            (documento == "") ||
            (phone == "") ||
            (email == "") ||
            (adress == "") ||
            (dob == ""))
    {
        if (nickname == "") {
            document.getElementById('un').style.borderColor = "red";
        } else {
            document.getElementById('un').style.borderColor = "green";
        }
        if (password == "") {
            document.getElementById('ps').style.borderColor = "red";
        } else {
            document.getElementById('ps').style.borderColor = "green";
        }
        if (firstname == "") {
            document.getElementById('nm').style.borderColor = "red";
        } else {
            document.getElementById('nm').style.borderColor = "green";
        }
        if (lastname == "") {
            document.getElementById('sn').style.borderColor = "red";
        } else {
            document.getElementById('sn').style.borderColor = "green";
        }
        if (documento == "") {
            document.getElementById('dc').style.borderColor = "red";
        } else {
            document.getElementById('dc').style.borderColor = "green";
        }
        if (phone == "") {
            document.getElementById('pn').style.borderColor = "red";
        } else {
            document.getElementById('pn').style.borderColor = "green";
        }
        if (email == "") {
            document.getElementById('em').style.borderColor = "red";
        } else {
            document.getElementById('em').style.borderColor = "green";
        }
        if (adress == "") {
            document.getElementById('ad').style.borderColor = "red";
        } else {
            document.getElementById('ad').style.borderColor = "green";
        }
        if (dob == "") {
            document.getElementById('dn').style.borderColor = "red";
        } else {
            document.getElementById('dn').style.borderColor = "green";
        }
        alert("Parece que algo deu errado. Tente preencher todos os campos! :)");
        return false;
    }
}