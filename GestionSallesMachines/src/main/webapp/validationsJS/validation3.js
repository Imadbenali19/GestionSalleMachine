

var vermarque = /^[A-Z a-z-éçàèâ' 0-9 ]{1,20}$/;
var verreference = /^(?=.*[A-Z a-z])[A-Z a-z 0-9]{2,20}$/;

function validReference(){
	if (!verreference.test(document.getElementById("reference").value)) {
		event.preventDefault();
		//document.getElementById("add").setAttribute("disabled", "disabled");
		document.getElementById("s1").innerHTML = "Reference non valide!";
		document.getElementById("s1").style.color = "red";
	} else {
		document.getElementById("s1").innerHTML = "Reference valide!";
		document.getElementById("s1").style.color = "green";
		//document.getElementById("add").removeAttribute("disabled");
	}
	
}


function validMarque() {
	if (!vermarque.test(document.getElementById("marque").value)) {
		event.preventDefault();
		//document.getElementById("add").setAttribute("disabled", "disabled");
		document.getElementById("s2").innerHTML = "Marque non valide!";
		document.getElementById("s2").style.color = "red";
	} else {
		document.getElementById("s2").innerHTML = "Marque valide!";
		document.getElementById("s2").style.color = "green";
		//document.getElementById("add").removeAttribute("disabled");
	}
	
}



function valid() {
	validReference();
	validMarque();
}

function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();
	
	    if (month.length < 2) 
	        month = '0' + month;
	    if (day.length < 2) 
	        day = '0' + day;
	
	    return [year, month, day].join('-');
	}