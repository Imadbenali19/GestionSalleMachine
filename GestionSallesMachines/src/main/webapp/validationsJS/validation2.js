var vertype = /^[A-Z a-z-éçàèâ' ]{1,20}$/;
var vercode = /^(?=.*[A-Z a-z])[A-Z a-z 0-9]{2,20}$/;

function validCode() {
	if (!vercode.test(document.getElementById("code").value)) {
		event.preventDefault();
		//document.getElementById("add").setAttribute("disabled", "disabled");
		document.getElementById("s1").innerHTML = "Code non valide!";
		document.getElementById("s1").style.color = "red";
	} else {
		document.getElementById("s1").innerHTML = "Code valide!";
		document.getElementById("s1").style.color = "green";
		//document.getElementById("add").removeAttribute("disabled");
	}
	
}


function validType() {
	if (!vertype.test(document.getElementById("type").value)) {
		event.preventDefault();
		//document.getElementById("add").setAttribute("disabled", "disabled");
		document.getElementById("s2").innerHTML = "Type non valide!";
		document.getElementById("s2").style.color = "red";
	} else {
		document.getElementById("s2").innerHTML = "Type valide!";
		document.getElementById("s2").style.color = "green";
		//document.getElementById("add").removeAttribute("disabled");
	}
	
}



function valid() {
	validCode();
	validType();
	

}