<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"><s:text name="citas.titulo" /></h1>
			</div>
		</div>
		<div class="bs">
			<h2 class="page-header">
				<s:text name="citas.buscar.titulo" />
			</h2>
			<div class="row">
				<a href='<s:url action="inicializarCita" namespace="/citas" />' class="btn btn-primary"><s:text name="citas.nuevo" /></a>
			</div><br>
			<div class="row">
				<s:form theme="bootstrap" cssClass="form-horizontal">
					<div class="form-group col-md-4">
						<s:textfield name="citaFiltro.dni" key="DNI" cssClass="form-control"/>
					</div>
					<div class="form-group col-md-4">
						<s:textfield name="citaFiltro.nombres" key="citas.buscar.label.nombres" cssClass="form-control"/>
					</div>
					<div class="form-group col-md-4">
						<s:submit key="citas.buscar.submit" cssClass="btn btn-default"/>
					</div>
				</s:form>
			</div>
			<div class="row">
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
	     					<td><s:property value="historiaClinica.nombreComleto" /></td>
	     					<td><s:property value="consultorio.codigo" /></td>
	     					<td><s:property value="fechaAtencion" /></td>
	     					<td>
	     						<%-- <s:url action="cargarCita" id='seleccionar' namespace='citas' >
		      						<s:param name='cita.id'>
		      							<s:property value='id'/>
		      						</s:param>
	      						</s:url>
	      						<s:a href='%{seleccionar}' cssClass='btn btn-primary'>Seleccionar</s:a> --%>
	     					</td>
	     				</tr>
	     			</s:iterator>
	      		</tbody>
	      		</table>
			</div>
		</div>
	</div>
</div>