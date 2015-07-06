/**
 *  Funciones para el modulo de citas
 */
function loadConsultorios(){
		
	var especialidad = document.getElementById("especialidades");
	var idEspecialidad =  especialidad.options[especialidad.selectedIndex].value;
	
	if(idEspecialidad == -1){
		return;
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