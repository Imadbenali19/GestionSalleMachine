$(document).ready(function() {
			$("#date1").change(function() {
			var date1 = $("#date1").val();
					var date2 = $("#date2").val();
				$.ajax({
					url: "./MachineController",
					data: { op: "searchv1", date1: date1, date2: date2 },
					type: 'POST',
					success: function(data) {

						remplir(data);

					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus);
						

					}
				});
			});
			
			$("#date2").change(function() {
			var date1 = $("#date1").val();
					var date2 = $("#date2").val();
				$.ajax({
					url: "./MachineController",
					data: { op: "searchv1", date1: date1, date2: date2 },
					type: 'POST',
					success: function(data) {

						remplir(data);

					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus);
						swal("Error!", "Donnez la date 1!", "error");	

					}
				});
			});

			$("#generate").click(function() {				
		
						//alert("Good job!", "User added successfully!", "success");
						$.ajax({
							url: "./GenerateReportController",
							data: { op: "searchv1"},
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