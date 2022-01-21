  
function valid(){
	if(document.getElementById("date1").value > document.getElementById("date2").value){
		swal("Date 2 doit etre superieure a date 1 !", {
									      icon: "error",
			});
     	event.preventDefault();
   }
   
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