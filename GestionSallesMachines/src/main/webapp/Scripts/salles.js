$(document).ready(function() {
			$.ajax({
				url: "./SalleController",
				data: { op: "load" },
				type: 'POST',
				success: function(data) {
					remplir(data);
				}
			});
		
		
			$("#add").click(function() {
				if( ($("#code").val() != "" && $("#type").val() != "") && $("#s1").css('color') == 'rgb(0, 128, 0)' && $("#s2").css('color') == 'rgb(0, 128, 0)'){
					
						var code = $("#code").val();
						var type = $("#type").val();
						console.log(code);
						console.log(type);
						$.ajax({
							url: "./SalleController",
							data: { code: code, type: type },
							type: 'POST',
							success: function(data) {
								swal("Salle added successfully !", {
								      icon: "success",
								    });
								remplir(data);
							},
							error: function(jqXHR, textStatus, errorThrown) {
								console.log(textStatus);
								//swal("Error!", "Salle not added", "error");
							}
						});
					
				}
			});
			
			$("#generate").click(function() {				
		
						//alert("Good job!", "User added successfully!", "success");
						$.ajax({
							url: "./GenerateReportController",
							data: { op: "salle"},
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
			$("#yes").on("click","#delete",function (){
				var id=$(this).closest('tr').find('td').eq(0).text();
				
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
									url: "./SalleController",
									data: { op:"delete",id:id},
									type: 'POST',
									success: function(data) {
										swal("Salle deleted successfully !", {
									      icon: "success",
									    });
										remplir(data);
									},
									error: function(jqXHR, textStatus, errorThrown) {
										console.log(textStatus);
										swal("Error!", "Salle not deleted", "error");
									}
								});
						  
					    
					  } 
				});			
		});				
		
		
		

		$("#yes").on("click","#update",function (){
			
			$("#code").val("");
			$("#type").val("");
			
			var id=$(this).closest('tr').find('td').eq(0).text();
			var code2=$(this).closest('tr').find('td').eq(1).text();
			var type2=$(this).closest('tr').find('td').eq(2).text();
			
			
			swal({
				title: "Are you sure?",
				text: "Do you want to update this record !",
				 icon: "warning",
				  buttons: true,
				  dangerMode: true,
			})	
			
			
			.then((willDelete) => {
			  if (willDelete) {
				  	$("#code").val(code2);
					$("#type").val(type2);
					$("#edit").removeAttr("hidden");
					$("#add").hide();
					$("#edit").click(function() {
						if( ($("#code").val() != "" && $("#type").val() != "") && $("#s1").css('color') == 'rgb(0, 128, 0)' && $("#s2").css('color') == 'rgb(0, 128, 0)'){
							
							var code = $("#code").val();
							var type = $("#type").val();
							
							$.ajax({
								
								url: "./SalleController",
								data: { op:"update",id:id,code: code, type: type},
								type: 'POST',
								success: function(data) {
									swal("Salle updated successfully !", {
									      icon: "success",
									    });
									remplir(data);
								},
								error: function(jqXHR, textStatus, errorThrown) {
									console.log(textStatus);
									swal("Error!", "Salle not added", "error");
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
				
				ligne += "<tr><td>" + data[i].id + "</td><td>" + data[i].code + "</td><td>" + data[i].type + "</td><td><bouton class='btn btn-warning btn-icon-split' id='update' val=" + data[i].id + "><span class='icon text-white-50'><i class='fas fa-exclamation-triangle'></i></span><span class='text'>Modifier</span></bouton></td><td><bouton class='btn btn-danger btn-icon-split' id='delete' val=" + data[i].id + "><span class='icon text-white-50'><i class='fas fa-trash'></i></span><span class='text'>Supprimer</span></bouton></td></tr>";
			}
			//alert(ligne);		
			//swal("Good job!", "User added successfully!", "success");																														
			$("#yes").html(ligne);
		}

