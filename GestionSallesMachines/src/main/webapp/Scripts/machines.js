$(document).ready(function() {
	$.ajax({
		url: "./MachineController",
		data: { op: "load" },
		type: 'POST',
		success: function(data) {
			remplir(data);
		}
	});


	$("#add").click(function() {
		if (($("#reference").val() != "" && $("#marque").val() != "" && $("#prix").val() != "") && $("#s1").css('color') == 'rgb(0, 128, 0)' && $("#s2").css('color') == 'rgb(0, 128, 0)') {
			var reference = $("#reference").val();
			var marque = $("#marque").val();
	        var dateAchat = $("#dateAchat").val();
	        var prix = $("#prix").val();
	        var salle=$("#salle").val();
	        $.ajax({
	            url: "./MachineController",
	            data: {reference: reference, marque: marque, prix: prix, dateAchat: dateAchat,salle: salle},
	            type: 'POST',
	            success: function (data, textStatus, jqXHR) {
					swal("Machine added successfully !", {
						icon: "success",
					});
	                remplir(data);
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
					alert(textStatus);
	                console.log(textStatus);
	            }
	        });
        }
	});
	

});

$("#yes").on("click", "#delete", function() {
	var id = $(this).closest('tr').find('td').eq(0).text();

	swal({
		title: "Are you sure?",
		text: "Do you want to delete this record !",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {

				$.ajax({
					url: "./MachineController",
					data: { op: "delete", id: id },
					type: 'POST',
					success: function(data) {
						swal("Machine deleted successfully !", {
							icon: "success",
						});
						remplir(data);
					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus);
						swal("Error!", "Machine not deleted", "error");
					}
				});


			}
		});
});

$("#yes").on("click","#update",function () {
			
			$("#reference").val("");
			$("#marque").val("");
			$("#prix").val("");
			
			var id=$(this).closest('tr').find('td').eq(0).text();
			var reference2=$(this).closest('tr').find('td').eq(1).text();
			var marque2=$(this).closest('tr').find('td').eq(2).text();
			var dateAchat2=$(this).closest('tr').find('td').eq(3).text();
			var prix2=$(this).closest('tr').find('td').eq(4).text();
			var salle2=$(this).closest('tr').find('td').eq(5).text();
			
			
			swal({
				title: "Are you sure?",
				text: "Do you want to update this record !",
				 icon: "warning",
				  buttons: true,
				  dangerMode: true,
			})	
			
			
			.then((willDelete) => {
			  if (willDelete) {
				  	$("#reference").val(reference2);
					$("#marque").val(marque2);
					$("#dateAchat").val(formatDate(dateAchat2));
					$("#prix").val(prix2);
					$("#salle").val(salle2);
					
					$("#edit").removeAttr("hidden");
					$("#add").hide();
					
					$("#edit").click(function() {
						if (($("#reference").val() != "" && $("#marque").val() != "" && $("#prix").val() != "") && $("#s1").css('color') == 'rgb(0, 128, 0)' && $("#s2").css('color') == 'rgb(0, 128, 0)') {
							
							var reference = $("#reference").val();
							var marque = $("#marque").val();
					        var dateAchat = $("#dateAchat").val();
					        var prix = $("#prix").val();
					        var salle=$("#salle").val();
							
							$.ajax({
								
								url: "./MachineController",
								data: { op:"update",id:id,reference: reference, marque: marque, prix: prix, dateAchat: dateAchat,salle: salle},
								type: 'POST',
								success: function(data) {
									swal("Machine updated successfully !", {
									      icon: "success",
									    });
									remplir(data);
								},
								error: function(jqXHR, textStatus, errorThrown) {
									console.log(textStatus);
									swal("Error!", "Machine not added", "error");
								}
							});
						}
					});
			  } 
			});		
		});





function remplir(data) {
	var ligne = "";
	var j = "";
	for (var i = 0; i < data.length; i++) {

		ligne += "<tr><td>" + data[i].id + "</td><td>" + data[i].reference + "</td><td>" + data[i].marque + "</td><td>" + data[i].dateAchat + "</td><td>" + data[i].prix + "</td><td>" + data[i].salle.code + "_" + data[i].salle.type + "</td><td><bouton class='btn btn-warning btn-icon-split' id='update' val=" + data[i].id + "><span class='icon text-white-50'><i class='fas fa-exclamation-triangle'></i></span><span class='text'>Modifier</span></bouton></td><td><bouton class='btn btn-danger btn-icon-split' id='delete' val=" + data[i].id + "><span class='icon text-white-50'><i class='fas fa-trash'></i></span><span class='text'>Supprimer</span></bouton></td></tr>";
	}
	//alert(ligne);		
	//swal("Good job!", "User added successfully!", "success");																														
	$("#yes").html(ligne);
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