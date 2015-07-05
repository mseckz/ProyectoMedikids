<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<head>
<sj:head/>
</head>
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"><s:text name="citas.nuevo" /></h1>
			</div>
		</div>
		<s:form theme="bootstrap" cssClass="form-horizontal">
		<div class="bs">
			<h3 class="page-header">
				<s:text name="citas.registrar.paciente" />	
			</h3>
			<div>
				<button class="btn btn-primary" type="button"><s:text name="citas.registrar.buscarpaciente" /></button>
			</div><br>
			<div class="row">
				<div class="form-group col-md-5">
					<s:textfield key="citas.registrar.dni" cssClass="form-control" value="%{hc.dni}"/>
				</div>
				<div class="form-group col-md-5">
					<s:textfield key="citas.registrar.nombre" cssClass="form-control" value="%{hc.nombreCompleto}"/>
				</div>
			</div>
		</div>
		<div class="bs">
			<h3 class="page-header">
				<s:text name="citas.registrar.titulo" />
			</h3>
			<div class="form-group col-md-6">
				<s:select list="@model.TipoReserva@values()" name="cita.tipoReserva" key="citas.registrar.tiporeserva" cssClass="form-control"/>
			</div>
			<div class="form-group col-md-6">
				<s:select list="especialidades" name="especialidad.id" key="citas.registrar.especialidad" listKey="id" 
				listValue="nombre" cssClass="form-control" id="especialidades" onchange="loadConsultorios()"
				headerValue="Elija especialidad" headerKey="-1"/>
			</div>
			<div class="form-group col-md-6">
				<s:select list="consultorios" id="consultorios" name="cita.consultorio.id" key="citas.registrar.consultorio" cssClass="form-control"
				headerValue="Elija consultorio" headerKey="-1"/>
			</div>
			<div class="form-group col-md-6">
				<sj:datepicker id="fechaAtencion" parentTheme="bootstrap" key="citas.registrar.fechaatencion" name="cita.fechaAtencion"
	                              cssClass="form-control" showOn="focus" inputAppendIcon="calendar"
	                              displayFormat="dd/mm/yy" onChangeTopics="changeTopic" />
			</div>
			<div class="form-group col-md-6">
				<s:textfield name="cita.monto" cssClass="form-control" key="citas.registrar.monto" />
			</div>
			<div class="form-group col-md-6">
				<s:select list="horas" id="horas" name="cita.fechaAtencion" key="citas.registrar.horaatencion" cssClass="form-control"
				headerValue="Elija hora" headerKey="-1"/>
			</div>
			<div class="row">
				<div class="col-md-4 col-md-offset-1">
					<s:submit key="citas.registrar.submit" cssClass="btn btn-default"/>
				</div>
			</div>
		</div>
	</s:form>	
	</div>
	
		
	<script src="<s:url value="/externo/js/citas.js" />"></script>
	<script>
	var changeTimer = false;

	$("#fechaAtencion").on("keyup" ,function(){
	        if(changeTimer !== false) clearTimeout(changeTimer);
	        changeTimer = setTimeout(function(){
	        	loadHorasDisponibles();
	            changeTimer = false;
	        },300);
	});
	
	$.subscribe('changeTopic', function(event,data) {
		loadHorasDisponibles();
	});
	</script>
</div>
