<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<head>
<sj:head />
</head>
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"><s:text name="citas.nuevo" /></h1>
			</div>
		</div>
		<s:form theme="bootstrap" cssClass="form-horizontal" action="registrarCita">
		<s:hidden value="%{historia.id}" name="cita.historiaClinica.id"/>
		<div class="bs">
			<div class="col-md-12">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><s:text name="citas.registrar.buscarpaciente" /></button>
				<button type="button" class="btn btn-success" >Registrar Paciente</button>
			</div><br>
			<h3 class="page-header">
				<s:text name="citas.registrar.paciente" />	
			</h3>
			<br>
			<s:if test="historia != null">
			<div class="row">
				<div class="col-md-3 col-md-offset-1">
					<img src="<s:url value="/images/perfil_fotos/user-default.png" />" style="width: 100px;height: 100px">
				</div>
				<div class="col-md-4">
					<div>
						<h4>DNI</h4>
						<p><s:property value="%{historia.dniPaciente}"/> </p>
					</div>
					<div>
						<h4>Nombre de Padre</h4>
						<s:if test="historia.nombrePadre != null">
							<p><s:property value="%{historia.nombreCompletoPadre()}"/> </p>
						</s:if>
						<s:else>
							<p>No hay datos</p>
						</s:else>
					</div>
				</div>
				<div class="col-md-4">
					<div>
						<h4>Nombre de Paciente</h4>
						<p><s:property value="%{historia.nombreCompletoPaciente()}"/> </p>
					</div>
					<div>
						<h4>Nombre de Madre</h4>
						<s:if test="historia.nombreMadre != null">
							<p><s:property value="%{historia.nombreCompletoMadre()}"/> </p>
						</s:if>
						<s:else>
							<p>No hay datos</p>
						</s:else>
					</div>
				</div>
			</div>
			</s:if>
		</div>
		<s:if test="historia != null">
		<div class="bs">
			<h3 class="page-header">
				<s:text name="citas.registrar.titulo" />
			</h3>
			<s:actionmessage/>
			<s:hidden name="cita.id" />
			<div class="form-group col-md-6">
				<s:textfield class="" key="citas.registrar.codigo" name="cita.codigo" cssClass="form-control" />
			</div>
			<div class="form-group col-md-6">
				<s:select list="@model.TipoReserva@values()" name="cita.tipoReserva" key="citas.registrar.tiporeserva" cssClass="form-control"/>
			</div>
			<div class="form-group col-md-6">
				<s:select list="especialidades" name="cita.consultorio.especialidad.id" key="citas.registrar.especialidad" listKey="id" 
				listValue="nombre" cssClass="form-control" id="especialidades" onchange="loadConsultorios()"
				headerValue="Elija especialidad" headerKey="-1"/>
			</div>
			<div class="form-group col-md-6">
				<s:select list="consultorios" id="consultorios" name="cita.consultorio.id" key="citas.registrar.consultorio" cssClass="form-control"
				headerValue="Elija consultorio" headerKey="-1"  listKey="id" listValue="codigo" onchange="obtenerFechasCitaLlenas()"/>
			</div>
			<div class="form-group col-md-6">
				<sj:datepicker id="fechaAtencion" parentTheme="bootstrap" key="citas.registrar.fechaatencion" name="cita.fechaAtencion"
	                              cssClass="form-control" showOn="focus" inputAppendIcon="calendar"
	                              displayFormat="dd/mm/yy" onChangeTopics="changeTopic" minDate="0" />
			</div>
			<div class="form-group col-md-6">
				<s:select list="horas" id="horas" name="cita.horaAtencion" key="citas.registrar.horaatencion" cssClass="form-control"
				headerValue="Elija hora" headerKey="-1"/>
			</div>
			<div class="form-group col-md-6">
				<s:textfield name="cita.monto" cssClass="form-control" key="citas.registrar.monto" />
			</div>
			<div class="row">
				<div class="col-md-4 col-md-offset-1">
					<s:submit key="citas.registrar.submit" cssClass="btn btn-default"/>
					<a href='<s:url action="iniciarCitas" />' class="btn btn-default">Cancelar</a>
				</div>
			</div>
		</div>
		</s:if>
	</s:form>
	</div>
	
	<jsp:include page="/WEB-INF/paginas/body/modulos/citas/include_buscar_hc_cita.jsp"></jsp:include>
		
	<script src="<s:url value="/externo/js/citas.js" />"></script>
	<script>
	window.onload = buscarPaciente;
	
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
