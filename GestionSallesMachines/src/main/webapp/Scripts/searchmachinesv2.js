$(document).ready(function() {
			$("#salle").change(function() {
				var salle = $("#salle").val();
			console.log(salle);
				$.ajax({
					url: "./MachineController",
					data: { op: "searchv2", salle: salle },
					type: 'POST',
					success: function(data) {

						remplir(data);

					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus);
						

					}
				});
			});
			
			
			$("#generate").click(function() {				
		
						//alert("Good job!", "User added successfully!", "success");
						$.ajax({
							url: "./GenerateReportController",
							data: { op: "searchv2"},
							type: 'POST',
							success: function(data) {
								swal("PDF generated !", {
								      icon: "success",
								    });
								remplir(data);
							},
							error: function(jqXHR, textStatus, errorThrown) {
								console.log(textStatus);
								//swal("Error!", "User not added", "error");
							}
						}); 
			});
			
			});

			function remplir(data) {
				var ligne = "";
				for (var i = 0; i < data.length; i++) {

					ligne += "<tr><td>" + data[i].id + "</td><td>" + data[i].reference + "</td><td>" + data[i].marque + "</td><td>" + data[i].dateAchat + "</td><td>" + data[i].prix + "</td><td>" + data[i].salle.code + "_" + data[i].salle.type + "</td></tr>";
				}
				//alert(ligne);		
				//swal("Good job!", "User added successfully!", "success");																														
				$("#yes").html(ligne);
			}