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
			</div>
			<h2 class="page-header">
				<s:text name="citas.buscar.titulo" />
			</h2>
			<br>
			<div class="row">
				<div class="col-md-12">
					<s:form theme="bootstrap" cssClass="form-horizontal">
					<div class="form-group col-md-5">
							<s:textfield name="citaFiltro.codigo" label="Codigo Cita" cssClass="form-control"/>
						</div>
						<div class="form-group col-md-3">
							<s:textfield name="citaFiltro.dni" label="DNI" cssClass="form-control"/>
						</div>
						<div class="form-group col-md-4">
							<s:textfield name="citaFiltro.nombres" key="citas.buscar.label.nombres" cssClass="form-control"/>
						</div>
						<div class="form-group col-md-4">
							<s:submit key="citas.buscar.submit" cssClass="btn btn-default"/>
						</div>
					</s:form>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered table-striped">
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
		     					<td><s:property value="consultorio.codigo" /></td>
		     					<td><s:property value="fechaAtencion" /></td>
		     					<td width="22%">
		     						<s:url action="cargarCita" id='seleccionar' namespace='citas' >
			      						<s:param name='cita.id'>
			      							<s:property value='id'/>
			      						</s:param>
		      						</s:url>
		      						<s:a href='%{seleccionar}' cssClass='btn btn-primary btn-sm' >Editar</s:a>
		      						<s:url action="cargarCita" id='seleccionar' namespace='citas' >
			      						<s:param name='cita.id'>
			      							<s:property value='id'/>
			      						</s:param>
		      						</s:url>
		      						<s:a href='%{seleccionar}' cssClass='btn btn-success btn-sm'>Generar</s:a>
		      						<s:url action="cargarCita" id='seleccionar' namespace='citas' >
			      						<s:param name='cita.id'>
			      							<s:property value='id'/>
			      						</s:param>
		      						</s:url>
		      						<s:a href='%{seleccionar}' cssClass='btn btn-danger btn-sm'>Cancelar</s:a>
		     					</td>
		     				</tr>
		     			</s:iterator>
		      		</tbody>
		      		</table>
		      	</div>
			</div>
		</div>
	</div>
</div>