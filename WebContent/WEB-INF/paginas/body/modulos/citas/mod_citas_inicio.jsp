<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="page-wrapper" style="padding-bottom: 100px;">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"><s:text name="citas.titulo" /></h1>
			</div>
		</div>
		<div class="bs">
			<div class="row">
				<div class="col-md-4">
					<a href='<s:url action="inicializarCita" namespace="/citas" />' class="btn btn-primary btn-lg">
						<s:text name="citas.nuevo" />
					</a>
				</div>
			</div><br>
			<div>
				<s:actionmessage/>
			</div>
			
			<h2 class="page-header">
				<s:text name="citas.buscar.titulo" />
			</h2>
			<br>
			<div class="row">
				<div class="col-md-12">
					<s:form theme="bootstrap" cssClass="form-horizontal" action="buscarCita" method="POST">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group col-md-5">
									<s:textfield name="citaFiltro.codigo" label="Codigo Cita" cssClass="form-control"/>
								</div>
								<div class="form-group col-md-3">
									<s:textfield name="citaFiltro.dni" label="DNI" cssClass="form-control"/>
								</div>
								<div class="form-group col-md-4">
									<s:textfield name="citaFiltro.nombre" key="citas.buscar.label.nombres" cssClass="form-control"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-2 col-md-offset-1">
								<s:submit key="citas.buscar.submit" cssClass="btn btn-default"/>
							</div>
						</div>						
					</s:form>
				</div>
			</div>
			<hr>
			<s:if test="!citas.isEmpty">
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered table-hover table-condensed">
		      		<thead>
		      			<tr>
		      				<th>Codigo</th>
		      				<th>Paciente</th>
		      				<th>Consultorio</th>
		      				<th>Fecha Atencion</th>
		      				<th>Accion</th>
		      			</tr>
		      		</thead>
		      		<tbody>
		     			<s:iterator value="citas" status="status">
		     				<tr>
		     					<td><s:property value="codigo" /></td>
		     					<td><s:property value="%{historiaClinica.nombreCompletoPaciente()}"/></td>
		     					<td width="15%"><s:property value="consultorio.codigo" /></td>
		     					<td width="20%"><s:date name="fechaAtencion" format="dd/MM/yyyy" />  &nbsp;<s:property value="horaAtencion" /></td>
		     					<td width="15%">
		     						<s:url action="cargarCita" id='editar' namespace='citas'  >
			      						<s:param name='cita.id'>
			      							<s:property value='id'/>
			      						</s:param>
		      						</s:url>
		      						<s:a href='%{editar}' cssClass='btn btn-primary' title="Editar" >
		      							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
		      						</s:a>
		      						<button class="btn btn-success" name="mostrarGenerarConsulta" title="Generar consulta" id="<s:property value="id" />">
		      							<span class="glyphicon glyphicon-file" aria-hidden="true"></span>
		      						</button>
		      						<button class="btn btn-danger" name="mostrarCancelar" title="Cancelar cita" id="<s:property value="id" />">
		      							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
		      						</button>
		     					</td>
		     				</tr>
		     			</s:iterator>
		      		</tbody>
		      		</table>
		      	</div>
			</div>
			</s:if>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/paginas/body/modulos/citas/modalCancelarCita.jsp"></jsp:include>
<jsp:include page="/WEB-INF/paginas/body/modulos/citas/modalGenerarConsulta.jsp"></jsp:include>
<script src="<s:url value="/externo/js/citas.js" />"></script>
<script>

window.onload = function(){
	cargarDatosCancelar();
	cargarDatosGenerarConsulta();
}

</script>