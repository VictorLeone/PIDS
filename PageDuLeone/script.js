        function validarIdade(){
		
				var idade = document.getElementById("idade");
          
        if(idade.value != ""){
          if(idade.value < 0){
            var popy = ("Você deve nascer antes de tentar tirar CNH.");
            document.getElementById('idade').style.borderColor = "red";

        }else{
          if(idade.value >= 18){
            var popy = ("Você pode TENTAR tirar CNH.");
                        document.getElementById('idade').style.borderColor = "green";
				}else{
          if((idade.value <= 17)&&(idade.value >=0)){
            var popy = ("Juvenil... Volte em "+(18-idade.value)+" anos!");        document.getElementById('idade').style.borderColor = "red";  
          }
        }}
				}else{
            var popy = ("Véi... Preenche sáporra.")
          document.getElementById('idade').style.borderColor = "red";
				}
                    document.getElementById("myPopup").innerHTML = popy;
			}

function popUpy() {
  var popup = document.getElementById("myPopup");
  popup.classList.toggle("show");
}

