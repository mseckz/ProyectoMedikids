<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header"><s:text name="consultorio.titulo" /></h1>
			</div>
		</div>
		<div class="bs">
			<h2 class="page-header">
				<s:text name="consultorio.registrar.titulo" />
			</h2>
			<s:form theme="bootstrap" action="editarConsultorio" namespace="/consultorios" cssClass="form-horizontal">
				<div class="row">
					<div class="col-md-5">
						<s:hidden name="consultorio.id" />
						<s:textfield name="consultorio.codigo" cssClass="form-control" key="consultorio.label.codigo"
						placeholder="%{getText('consultorio.placeholder.codigo')}" readonly="true"/>
						<s:textfield name="consultorio.ubicacion" cssClass="form-control" key="consultorio.label.ubicacion"
						placeholder="%{getText('consultorio.placeholder.ubicacion')}" />
					</div>
					<div class="col-md-5">
						<s:select list="especialidades" name="consultorio.especialidad.id" 
						key="consultorio.label.especialidad" listKey="id" listValue="nombre" emptyOption="true" />
						<s:textarea name="consultorio.descripcion" cssClass="form-control" key="consultorio.label.descripcion"
						placeholder="%{getText('consultorio.placeholder.descripcion')}" />
					</div>
					<div class="col-md-4" >
						<s:submit cssClass="btn btn-default col-md-offset-1" value="%{getText('consultorio.button.grabar')}" />
						<a href="<s:url action="resetearForm" namespace="consultorios" />" class="btn btn-default" >Limpiar Todo</a>
					</div>
				</div>
			</s:form>
		</div>
		<div class="bs">
			<h2 class="page-header">
				<s:text name="consultorio.horarios.titulo" />
			</h2>
			<div>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#buscarConsultorio">
				  <s:text name="consultorio.horario.buscar" />
				</button>
    		</div><br>
    		<s:if test="%{error}">
	    		<div class="row">
					<div class="alert alert-warning alert-dismissible" role="alert">
						 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						 <s:actionmessage/>
					</div>
	    		</div>
    		</s:if>
    		<div class="row">
    		<div class="col-md-12">
			<s:form theme="bootstrap" action="agregarMedicoHorario" namespace="/consultorios" cssClass="form-horizontal">
				<div class="row">
					<div class="col-md-5">
						<s:textfield cssClass="form-control" key="horario.label.codigo" value="%{consultorio.codigo}" readonly="true" />
						<s:hidden name="horario.consultorio.id" value="%{consultorio.id}" />
						
						<s:select list="turnos" name="horario.turno.id"
						key="horario.label.turno" listKey="id" listValue="descripcion" emptyOption="true"/>
						
						<s:select list="medicos" name="horario.medico.id" 
						key="horario.label.medico" listKey="id" listValue="nombreCompleto" emptyOption="true" id="medicosselect"/>
						<s:hidden id="nombreMedico" name="horario.medico.nombreCompleto"/>
					</div>
					<div class="col-md-5">
						<s:textfield cssClass="form-control" key="horario.label.especialidad" value="%{consultorio.especialidad.nombre}" readonly="true"/>
						<s:select list="dias" name="horario.dia.id" 
						key="horario.label.dia" listKey="id" listValue="nombre" emptyOption="true" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 btn-group" role="group">
						<s:submit value="%{getText('horario.button.registrar')}"  cssClass="btn btn-primary" />
						<a href="<s:url action="borrarTodos" namespace="/consultorios" />" class="btn btn-danger">
							<s:text name="horario.button.borrartodos" />
						</a>
					</div>
					<div class="col-md-3">
						<a href="<s:url action="editarHorario" namespace="/consultorios" />" class="btn btn-default btn-lg"><s:text name="horario.button.grabarhorario" /></a>
					</div>
				</div>
			</s:form>
			</div>
			</div><hr>
			<s:form action="removerMedicosHorario" method="POST" namespace="/consultorios">
				<div>
					<button type="submit" class="btn btn-primary">
						<s:text name="horario.button.borrarmedico" />
					</button>
				</div><br>
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<td>Horas</td>
							<td>Lunes</td>
							<td>Martes</td>
							<td>Miercoles</td>
							<td>Jueves</td>
							<td>Viernes</td>
							<td>Sabado</td>
						</tr>
					</thead>
					<tbody>
						<s:if test="!horarios.isEmpty">
							<tr>
								<td>Mañana</td>
								<s:iterator var="counter" begin="1" end="6">
									<s:set var="break" value = "%{false}" />
									
									<s:iterator value="horarios" status="status">
										<s:if test="turno.id == 1">
											<s:if test="!#break and dia.id == #counter">
												<td>
													<s:property value="medico.nombreCompleto" />
													<s:checkbox theme="simple" name="medicosSelected" fieldValue="%{#status.index}" />
												</td>
												<s:set var="break" value="%{true}" />
											</s:if>
										</s:if>
									</s:iterator>
									<s:if test="!#break">
										<td>libre</td>
									</s:if>
								</s:iterator>
							</tr>
							<tr>
								<td>Tarde</td>
								<s:iterator var="counter" begin="1" end="6">
									<s:set var="break" value = "%{false}" />
									
									<s:iterator value="horarios" status="status">
										<s:if test="turno.id == 2">
											<s:if test="!#break and dia.id == #counter">
												<td>
													<s:property value="medico.nombreCompleto" />
													<s:checkbox theme="simple" name="medicosSelected" fieldValue="%{#status.index}" />
												</td>
												<s:set var="break" value="%{true}" />
											</s:if>
										</s:if>
									</s:iterator>
									<s:if test="!#break">
										<td>libre</td>
									</s:if>
								</s:iterator>
							</tr>
						</s:if>
						<s:else>
							<tr>
								<td>Mañana</td>
								<s:iterator var="counter" begin="1" end="6">
									<td>libre</td>
								</s:iterator>
							</tr>
							<tr>
								<td>Tarde</td>
								<s:iterator var="counter" begin="1" end="6">
									<td>libre</td>
								</s:iterator>
							</tr>
						</s:else>
					</tbody>
				</table>
			</s:form>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/paginas/body/modulos/consultorios/buscarConsultorio.jsp"></jsp:include>

<script>
	
	 window.onload = function(){
		 function addEventsToHTML(){
			    var medicos = document.getElementById('medicosselect');
			    var txtnombreMed = document.getElementById('nombreMedico');
			    medicos.onchange = changeHandler;
			    function changeHandler(){
			    	txtnombreMed.value = this.options[this.selectedIndex].innerHTML;
			    }
			}
			
		function onload() {
		    var tds = document.getElementsByTagName("td");
		    for(var i = 0; i < tds.length; i++) {
		        tds[i].onclick = 
		                        function(td) { 
		                            return function() { 
		                                tdOnclick(td); 
		                            }; 
		                        }(tds[i]); 
		    }
		    var inputs = document.getElementsByTagName("input");
		    for(var i = 0; i < inputs.length; i++) {
		        inputs[i].onclick = 
		                        function(input){ 
		                            return function() { 
		                                inputOnclick(input); 
		                            };
		                        }(inputs[i]); 
		    }
		}
		
		function tdOnclick(td) {
		    for(var i = 0; i < td.childNodes.length; i++) {
		        if(td.childNodes[i].nodeType == 1) {
		            if(td.childNodes[i].nodeName == "INPUT") {
		                if(td.childNodes[i].checked) {
		                    td.childNodes[i].checked = false;
		                    td.style.backgroundColor = "transparent";
		                } else {
		                    td.childNodes[i].checked = true;
		                    td.style.backgroundColor = "green";
		                }
		            } else {
		                tdOnclick(td.childNodes[i]);
		            }
		        }
		    }
		}
		
		function inputOnclick(input) {
		    input.checked = !input.checked;
		    return false;
		}
		
	    $('#buscarCons').submit(function(event) {
	        var $form = $("#buscarCons");
	        var $target = $($form.attr('data-target'));
	 
	        $.ajax({
	            type: $form.attr('method'),
	            url: $form.attr('action'),
	            data: $form.serialize(),
	 			datatype : 'json',
	            success: function(data, status) {
	            	$('#buscarConsultorio').modal('show');
					console.log(data);
	            	var lista = data;
	            	var url = "http://localhost:8080/proyFinal/consultorios/consultorios/cargarConsultorio.action?consultorio.id=";
	            	
	                for (var i = 0; i < lista.length; i++) {
	                    tr = $('<tr/>');
	                    tr.append("<td>" + lista[i].codigo + "</td>");
	                    tr.append("<td>" + lista[i].ubicacion + "</td>");
	                    tr.append("<td>" + lista[i].especialidad.nombre + "</td>");
	                    tr.append("<td><a href="+ url +lista[i].id +">Seleccionar</a></td>");
	                    $("#consultorios tbody").append(tr);
	                }
	                
	            }
	        });
	 
	        event.preventDefault();
	    });

		
		addEventsToHTML();
		onload();
			
	 }
</script>