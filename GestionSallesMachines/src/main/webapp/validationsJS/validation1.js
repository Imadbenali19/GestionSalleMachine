var vername = /^[A-Z a-z-éçàèâ' ]{3,100}$/;
var verpassword = /^[a-zA-Z0-9?.@-_]{3,}$/;

function validNom() {
	if (!vername.test(document.getElementById("login").value)) {
		event.preventDefault();
		//document.getElementById("add").setAttribute("disabled", "disabled");
		document.getElementById("s1").innerHTML = "Login non valide!";
		document.getElementById("s1").style.color = "red";
	} else {
		document.getElementById("s1").innerHTML = "Login valide!";
		document.getElementById("s1").style.color = "green";
		//document.getElementById("add").removeAttribute("disabled");
	}
	
}

function validPassword() {
	if (!verpassword.test(document.getElementById("password").value)) {
		//document.getElementById("add").setAttribute("disabled", "disabled");
		event.preventDefault();
		document.getElementById("s2").innerHTML = "Mot de passe non valide!";
		document.getElementById("s2").style.color = "red";
	} else {
		document.getElementById("s2").innerHTML = "Mot de passe valide!";
		document.getElementById("s2").style.color = "green";
		//document.getElementById("add").removeAttribute("disabled");
	}
	
}

function validConfPassword() {
	if (document.getElementById("password").value != document.getElementById("rpassword").value || document.getElementById("rpassword").value == "") {
		event.preventDefault();
		//document.getElementById("add").setAttribute("disabled", "disabled");
		document.getElementById("s3").innerHTML = "Mots de passe differents!";
		document.getElementById("s3").style.color = "red";
	} else {
		document.getElementById("s3").innerHTML = "Mots de passe pareils!";
		document.getElementById("s3").style.color = "green";
		//document.getElementById("add").removeAttribute("disabled");
	}
	
}

function valid() {
	validNom();
	validPassword();
	validConfPassword();

}