<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
	.tabs > li {
		background-color: gray;
	}
</style>
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<ul class="nav nav-pills tabs" role="tablist" >
				<s:url action="obtenerHistoria" id="irHistoria" >
					<s:param name="cita.id">
						<s:property value="%{cita.id}"/>
					</s:param>
				</s:url>
		    	<li role="presentation"><s:a href="%{irHistoria}" aria-controls="profile" role="tab" 
		    										>Datos de paciente</s:a></li>
		    	<li role="presentation" class="active"><a href="#">Agregar Consulta</a></li>
			</ul>
			
			<div class="tab-content">
			    <div role="tabpanel" class="tab-pane active" id="historia">
			    	
			    </div>
 			</div>
		</div>
		<div class="bs">
			<h3> Consultas del dia Medico: <s:property value="#session.nombre_completo"/></h3><hr>
			<div class="row" >
				<div class="col-md-4">
					<table class="table table-bordered table-hover table-striped">
					<thead>
						<tr>
							<th>Consultas del Paciente</th>
							<th>Ver Consulta</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="consultasRealizadas" status="status">
							<tr>
								<td><s:date name="fechaRegistro" format="dd/MM/yyyy"/></td>
								<td>
									<button class="btn btn-success" name="mostrarDetalle" title="Ver consulta" id="<s:property value="id" />">
		      							<span class="glyphicon glyphicon-file" aria-hidden="true"></span>
		      						</button>
								</td>
							</tr>
						</s:iterator>
					</tbody>
					</table>
				</div>
				<div class="col-md-6 col-md-offset-1">
					<div class="row">
						<h3>Agregar Consulta</h3><hr>
						<s:form action="registrarConsulta" method="POST" cssClass="form-horizontal" theme="bootstrap">
							<s:hidden name="consulta.historia.id" value="%{historia.id}"/>
							<s:hidden name="consulta.personalMedico.id" value="%{#session.id_usuario}" />
							<s:hidden name="consulta.cita.id" value="%{cita.id}"/>
							
							<div class="row">
								<div class="form-group">
									<s:textarea label="Motivo Consulta" cssClass="form-control" name="consulta.motivo"/>
								</div>
							</div>
							<div class="row">
								<div class="form-group">
									<s:textarea label="Sintomas" cssClass="form-control" name="consulta.sintomas"/>
								</div>
							</div>
							<div class="row">
								<div class="form-group">
									<s:textarea label="Diagnostico" cssClass="form-control" name="consulta.diagnostico"/>
								</div>
							</div>
							<div class="row">
								<div class="form-group">
									<s:textarea label="Receta Medica" cssClass="form-control" name="consulta.receta"/>
								</div>
							</div>
							<div class="row">
								<div class="form-group">
									<s:textarea label="Observaciones" cssClass="form-control" name="consulta.observaciones"/>
								</div>
							</div>
							<s:submit cssClass="btn btn-default" value="Grabar Consulta" />		
						</s:form>
					</div>	
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/paginas/body/modulos/consultas/modal_detalle_consulta.jsp"></jsp:include>
<script src="<s:url value="/externo/js/moment.js" />"></script>
<script src="<s:url value="/externo/js/consultas.js" />"></script>

<script>
window.onload = function(){
	verDetalleConsulta();
}
</script>