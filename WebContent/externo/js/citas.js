/**
 *  Funciones para el modulo de citas
 */
function loadConsultorios(){
		
	var especialidad = document.getElementById("especialidades");
	var idEspecialidad =  especialidad.options[especialidad.selectedIndex].value;
	
	if(idEspecialidad == -1){
		document.getElementById("monto").value="";
		return;
	}
	
	if(idEspecialidad == 1){
		document.getElementById("monto").value=120.0;
	}
	else{
		document.getElementById("monto").value=80.0;
	}
		
    $("#consultorios").get(0).options.length = 0;
    $("#consultorios").get(0).options[0] = new Option("Elija consultorio", "-1"); 

    $.ajax({
        type: "POST",
        url: "cargarConsultorios",
        data: "especialidad.id="+idEspecialidad,
        dataType: "json",
        success: function(data) {
        	$("#consultorios").get(0).options.length = 0;
            $("#consultorios").get(0).options[0] = new Option("Elija consultorio", "-1"); 

            $.each(data, function(index, item) {
                $("#consultorios").get(0).options[$("#consultorios").get(0).options.length] = new Option(item.codigo, item.id);
            });
        },
        error: function(error) {
            $("#consultorios").get(0).options.length = 0;

        }
    });  
}

function loadHorasDisponibles(){
	
	var consultorio = document.getElementById("consultorios");
	var idConsultorio =  consultorio.options[consultorio.selectedIndex].value;
	var fechaAtencion = document.getElementById("fechaAtencion").value;
	
	if(idConsultorio == -1){
		return;
	}
		
    $("#horas").get(0).options.length = 0;
    $("#horas").get(0).options[0] = new Option("Elija Hora", "-1"); 

    $.ajax({
        type: "POST",
        url: "cargarHoras",
        data: "cita.consultorio.id="+idConsultorio + "&cita.fechaAtencion=" + fechaAtencion,
        dataType: "json",
        success: function(data) {

        	$("#horas").get(0).options.length = 0;
            $("#horas").get(0).options[0] = new Option("Elija Hora", "-1"); 

            $.each(data, function(index, item) {
                $("#horas").get(0).options[$("#horas").get(0).options.length] = new Option(item, item);
            });
        },
        error: function(error) {
            $("#horas").get(0).options.length = 0;

        }
    });
}

function buscarPaciente(){
	
	$('#buscarHC').submit(function(event) {
        var $form = $("#buscarHC");
        var $target = $($form.attr('data-target'));
        $("#historias tbody").html("");
        
        $.ajax({
            type: $form.attr('method'),
            url: $form.attr('action'),
            data: $form.serialize(),
 			datatype : 'json',
            success: function(data, status) {
            	$('#myModal').modal('show');
				console.log(data);
            	var url = "http://localhost:8080/proyFinal/citas/citas/cargarPaciente.action?historia.id=";
            	
                for (var i = 0; i < data.length; i++) {
                    tr = $('<tr/>');
                    tr.append("<td>" + data[i].id + "</td>");
                    tr.append("<td>" + data[i].nombrePaciente + " " + data[i].apellidoPaternoPaciente + 
                    		" " + data[i].apellidoMaternoPaciente + "</td>");
                    tr.append("<td>" + data[i].dniPaciente + "</td>");
                    tr.append("<td><a href="+ url +data[i].id +">Seleccionar</a></td>");
                    $("#historias tbody").append(tr);
                }
            }
        });

        event.preventDefault();
    });
}

function cargarDatosCancelar(){
	$("button[name='mostrarCancelar']").click(function(event) {
		
		var target = $(event.target);
		var id = $(this).attr("id");

		$.ajax({
	        type: 'GET',
	        url:  "cargarCitaModal",
	        data: "cita.id="+id,
			datatype : 'json',
	        success: function(data, status) {
	        	
				console.log(data);
	        	
				document.getElementById("codigoCita").innerHTML = data.cita.codigo;
				document.getElementById("fechaAtencion").innerHTML = data.cita.fechaAtencion;
				document.getElementById("horaAtencion").innerHTML = data.cita.horaAtencion;
				document.getElementById("nombrePaciente").innerHTML = data.historia.nombrePaciente + ' ' + 
																	  data.historia.apellidoPaternoPaciente + ' ' + 
																	  data.historia.apellidoMaternoPaciente;
				document.getElementById("dniPaciente").innerHTML = data.historia.dniPaciente;
				
				document.getElementById("idCancelarCita").value = data.cita.id
				
				$('#modalCancelar').modal('show');
	        }
	    }); 
	});
}

function cargarDatosGenerarConsulta(){
	$("button[name='mostrarGenerarConsulta']").click(function(event) {
		document.getElementById("fechaAtencion");
		var target = $(event.target);
		var id = $(this).attr("id");

		$.ajax({
	        type: 'GET',
	        url:  "cargarCitaModal",
	        data: "cita.id="+id,
			datatype : 'json',
	        success: function(data, status) {
	        	
	        	
				document.getElementById("codigoCitaGC").innerHTML = data.cita.codigo;
				document.getElementById("fechaAtencionGC").innerHTML = data.cita.fechaAtencion;
				document.getElementById("horaAtencionGC").innerHTML = data.cita.horaAtencion;
				document.getElementById("nombrePacienteGC").innerHTML = data.historia.nombrePaciente + ' ' + 
																	  data.historia.apellidoPaternoPaciente + ' ' + 
																	  data.historia.apellidoMaternoPaciente;
				document.getElementById("dniPacienteGC").innerHTML = data.historia.dniPaciente;
				document.getElementById("montoGC").innerHTML = "S/. " + data.cita.monto;
				
				document.getElementById("idGenerarConsulta").value = data.cita.id
				
				$('#modalGenerarConsulta').modal('show');
	        }
	    }); 
	});
};

var fechasLlenas = [];

function obtenerFechasCitaLlenas(){
	var datepicker = document.getElementById("fechaAtencion");
	datepicker.value = "";
	
	var consultorios = document.getElementById("consultorios");
	var idConsultorio = consultorios.options[consultorios.selectedIndex].value;
	
	if(idConsultorio == -1){
		$('#fechaAtencion').prop('disabled', true);
		return;
	}
	else{
		$('#fechaAtencion').prop('disabled', false);
	}
	
	$.ajax({
        type: "POST",
        url: "getFechasCitasLlenas",
        data: "cita.consultorio.id="+idConsultorio,
        dataType: "json",
        success: function(data) {
        	console.log(data);
        	fechasLlenas = data;
        },
        error: function(error) {
           console.log(error);
        }
    });

}


function DisableSpecificDates(date) {

	 var m = date.getMonth();
	 var d = date.getDate();
	 var y = date.getFullYear();
	 
	 // First convert the date in to the mm-dd-yyyy format 
	 // Take note that we will increment the month count by 1 
	 var currentdate =  y + '-' + (m+1) + '-' + d;
	 console.log(currentdate);
	 
	  // We will now check if the date belongs to disableddates array 
	 for (var i = 0; i < fechasLlenas.length; i++) {
	 
		 // Now check if the current date is in disabled dates array. 
		 if ($.inArray(currentdate, fechasLlenas) != -1 ) {
			 return [false];
		 }
	 }	 
}

function obtenerNombreMedico(){
	
	var comboHoras = document.getElementById("horas");
	var hora =  comboHoras.options[comboHoras.selectedIndex].value;
	
	var consultorio = document.getElementById("consultorios");
	var idConsultorio =  consultorio.options[consultorio.selectedIndex].value;
	
	if(hora == -1 || idConsultorio == -1){
		document.getElementById("nombreMedico").value = "";
		return;
	}
	
    $.ajax({
        type: "POST",
        url: "mostrarMedico",
        data: "cita.consultorio.id="+idConsultorio + "&cita.horaAtencion=" + hora,
        dataType: "json",
        success: function(data) {
        	console.log(data);
        	document.getElementById("nombreMedico").value = data;
        },
        error: function(error) {
            console.log(error);

        }
    });
}
