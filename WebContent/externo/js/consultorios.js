
function nuevoConsultorio(){
	$("button[name='btnRegistrar']").click(function(event) {

		$.ajax({
	        type: 'GET',
	        url:  "nuevoConsultorio",
			datatype : 'json',
	        success: function(data) {
	        	
				console.log(data);
	        	
				document.getElementById("codigo").value = data.codigo;
				
				$('#modalRegistrar').modal('show');
	        }
	    }); 
	});
}