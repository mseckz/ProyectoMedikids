/**
 *  Funciones para el modulo de consultas
 */

var citas = [];
var url = "http://localhost:8080/proyFinal/consultas/consultas/obtenerHistoria.action?cita.id=";
var div = document.getElementById("mensaje");

function loadColaCitas(){
		
	var consultorios = document.getElementById("cboConsultorio");
	var idConsultorio =  consultorios.options[consultorios.selectedIndex].value;
	div.innerHTML = "";
	
	if(idConsultorio == -1){
		$("#tblCitas tbody").html("");
		div.innerHTML = div.innerHTML + "<p><strong>Elija Consultorio</strong></p>";
		return;
	}

    $.ajax({
        type: "POST",
        url: "listaCitasEnCola",
        data: "consultorio.id="+idConsultorio,
        dataType: "json",
        success: function(data) {
        	if(data.length > 0){
        		console.log(data);
            	crearTablaCitas(data);
        	}
        	else{	
        		div.innerHTML = div.innerHTML + "<p><strong>No hay citas programadas</strong></p>";
        	}
        	
        },
        error: function(error) {
            console.log(error);
        }
    });  
}

function crearTablaCitas(citas){
	$("#tblCitas tbody").html("");
	
	for (var i = 0; i < citas.length; i++) {
        tr = $('<tr/>');
        tr.append("<td>" + citas[i].codigo + "</td>");
        tr.append("<td>" + citas[i].fechaAtencion + "</td>");
        tr.append("<td>" + citas[i].horaAtencion + "</td>");
        tr.append("<td>" + citas[i].historiaClinica.nombrePaciente + " " + citas[i].historiaClinica.apellidoPaternoPaciente + 
        		" " + citas[i].historiaClinica.apellidoMaternoPaciente + "</td>");
        tr.append("<td><a href="+ url +citas[i].id +">Seleccionar</a></td>");
        $("#tblCitas tbody").append(tr);
    }
}


function verDetalleConsulta(){
	$("button[name='mostrarDetalle']").click(function(event) {
		
		var target = $(event.target);
		var id = $(this).attr("id");

		$.ajax({
	        type: 'GET',
	        url:  "verDetalleConsulta",
	        data: "consulta.id="+id,
			datatype : 'json',
	        success: function(data, status) {
	        	console.log(data);
	        	
	        	var date = moment(data.fechaRegistro);
	        	
				document.getElementById("nombreCompleto").innerHTML = data.personalMedico.nombreCompleto;
				document.getElementById("fechaRegistro").innerHTML = moment(date).format("DD/MM/YYYY");
				document.getElementById("motivoConsulta").innerHTML = data.motivo;
				document.getElementById("sintomas").innerHTML = data.sintomas;
				document.getElementById("diagnostico").innerHTML = data.diagnostico;
				document.getElementById("obs").innerHTML = data.observaciones;
				
				$('#modalDetalle').modal('show');
	        }
	    }); 
	});
};