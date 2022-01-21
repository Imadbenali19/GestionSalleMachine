$(document).ready(function() {
			$.ajax({
				url: "./UserController",
				data: { op: "load" },
				type: 'POST',
				success: function(data) {
					remplir(data);
				}
			});
		
		
			$("#add").click(function() {
				if( ($("#login").val() != "" && $("#password").val() != "") && $("#s1").css('color') == 'rgb(0, 128, 0)' && $("#s2").css('color') == 'rgb(0, 128, 0)' && $("#s3").css('color') == 'rgb(0, 128, 0)'){
					
						var login = $("#login").val();
						var password = $("#password").val();
						var admin = $("#admin").val();
						var j = 0;
						if (admin == "Oui") {
							j = 1;
						}
						//swal("Good job!", "User added successfully!", "success");
						$.ajax({
							url: "./UserController",
							data: { login: login, password: password, isAdmin: j },
							type: 'POST',
							success: function(data) {
								swal("User added successfully !", {
								      icon: "success",
								    });
								
								remplir(data);
								
							},
							error: function(jqXHR, textStatus, errorThrown) {
								console.log(textStatus);
								//swal("Error!", "User not added", "error");
							}
						});
					
				}
			});
			
			
			$("#generate").click(function() {				
		
						//alert("Good job!", "User added successfully!", "success");
						$.ajax({
							url: "./GenerateReportController",
							data: { op: "user"},
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
				var login=$(this).closest('tr').find('td').eq(1).text();
				
				
					swal({
						title: "Are you sure?",
						text: "Do you want to delete this record !",
						 icon: "warning",
						  buttons: true,
						  dangerMode: true,
					})	
					.then((willDelete) => {
					  if (willDelete) {
						  if(login!='admin'){
							  $.ajax({
									url: "./UserController",
									data: { op:"delete",id:id},
									type: 'POST',
									success: function(data) {
										swal("User deleted successfully !", {
									      icon: "success",
									    });
										remplir(data);
									},
									error: function(jqXHR, textStatus, errorThrown) {
										console.log(textStatus);
										swal("Error!", "User not deleted", "error");
									}
								});
						  }else{
							  swal("Admin cannot be deleted!", {
							      icon: "error",
							    });
						  }  
					    
					  } 
				});			
		});				
		
		
		

		$("#yes").on("click","#update",function (){
			
			$("#login").val("");
			$("#password").val("");
			$("#rpassword").val("");
			
			var id=$(this).closest('tr').find('td').eq(0).text();
			var login2=$(this).closest('tr').find('td').eq(1).text();
			var password2=$(this).closest('tr').find('td').eq(2).text();
			var admin2=$(this).closest('tr').find('td').eq(3).text();
			$('#password').attr('type','text');
			$('#rpassword').attr('type','text');
			
			swal({
				title: "Are you sure?",
				text: "Do you want to update this record !",
				 icon: "warning",
				  buttons: true,
				  dangerMode: true,
			})	
			
			
			.then((willDelete) => {
			  if (willDelete) {
				  	$("#login").val(login2);
					$("#password").val(password2);
					$("#admin").val(admin2);
					$("#edit").removeAttr("hidden");
					$("#add").hide();
					$("#edit").click(function() {
						if( ($("#login").val() != "" && $("#password").val() != "") && $("#s1").css('color') == 'rgb(0, 128, 0)' && $("#s2").css('color') == 'rgb(0, 128, 0)' && $("#s3").css('color') == 'rgb(0, 128, 0)'){
							
							var login = $("#login").val();
							var password = $("#password").val();
							var admin = $("#admin").val();
							var i=0;
							if (admin == "Oui") {
								i = 1;
							}
							console.log(id);
							$.ajax({
								
								url: "./UserController",
								data: { op:"update",id:id,login: login, password: password, isAdmin: i },
								type: 'POST',
								success: function(data) {
									swal("User updated successfully !", {
									      icon: "success",
									    });
									remplir(data);
								},
								error: function(jqXHR, textStatus, errorThrown) {
									console.log(textStatus);
									swal("Error!", "User not added", "error");
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
				j = "Non";
				if (data[i].isAdmin == 1) {
					j = "Oui";
				}
				ligne += "<tr><td>" + data[i].id + "</td><td>" + data[i].login + "</td><td>" + data[i].password + "</td><td>" + j + "</td><td><bouton class='btn btn-warning btn-icon-split' id='update' val=" + data[i].id + "><span class='icon text-white-50'><i class='fas fa-exclamation-triangle'></i></span><span class='text'>Modifier</span></bouton></td><td><bouton class='btn btn-danger btn-icon-split' id='delete' val=" + data[i].id + "><span class='icon text-white-50'><i class='fas fa-trash'></i></span><span class='text'>Supprimer</span></bouton></td></tr>";
			}
			//alert(ligne);		
			//swal("Good job!", "User added successfully!", "success");																														
			$("#yes").html(ligne);
		}

