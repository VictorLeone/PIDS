function saveStuff() {
    console.log("OBJ:")
    img =  document.getElementById("img").src;
    nome =  document.getElementById("nome").innerHTML;
    sobrenome =  document.getElementById("sobrenome").innerHTML;
    userid =  document.getElementById("userid").innerHTML;
    nickname =  document.getElementById("nickname").innerHTML;

    
    
    localStorage.setItem('img', JSON.stringify(img));
    localStorage.setItem('nome', JSON.stringify(nome));
    localStorage.setItem('sobrenome', JSON.stringify(sobrenome));    
    localStorage.setItem('userid',userid);
    localStorage.setItem('nickname',nickname.replace(/ /g,''));
    console.log(nickname);
}

function loadStuff() {
  img = JSON.parse(localStorage.getItem('img'));
  nome = JSON.parse(localStorage.getItem('nome'));
  sobrenome = JSON.parse(localStorage.getItem('sobrenome'));
    userid = localStorage.getItem('userid');
 
    
    intUser = parseInt(userid);
  document.getElementById("img").src = img;
  document.getElementById("nome").innerHTML = nome;
  document.getElementById("sobrenome").innerHTML = sobrenome;
  document.getElementById("testeform").setAttribute("href","UserController?action=userEdit&userId="+intUser);
  
 
}

function del(pdid){
   userid = localStorage.getItem('userid');
   nickname = localStorage.getItem('nickname');
   intUser = parseInt(userid);
   document.getElementById("delreq"+pdid).setAttribute("href","ProductController?action=delFromUser&userid="+intUser+"&pdid="+pdid+"&nickname="+nickname);

}
function add(pdid){
   userid = localStorage.getItem('userid');
   nickname = localStorage.getItem('nickname');
   intUser = parseInt(userid);
   document.getElementById("addreq"+pdid).setAttribute("href","ProductController?action=addToUser&userid="+intUser+"&pdid="+pdid+"&nickname="+nickname);
   

}

function goBack() {
  window.history.back();
}

function onLogOut(){
    localStorage.clear();
}
