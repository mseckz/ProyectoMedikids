<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header"><s:text name="consultorio.titulo" /></h1>
			</div>
			<div class="col-md-12">
				<a href="<s:url action="nuevoConsultorio" />" class="btn btn-primary btn-lg">Nuevo Consultorio</a>
				<a href="<s:url action="irAHorarios" />" class="btn btn-primary btn-lg">Asignar Horarios</a>
			</div>
		</div>
		<hr>
		<div class="bs">
			<s:form theme="bootstrap" cssClass="form-horizontal" action="buscarConsultorioPrincipal" method="POST">
	        	<div class="row">
	        		<div class="col-md-4">
	        			<s:textfield name="conFiltro.codigo" key="consultorio.label.codigo" cssClass="form-control"/>
	        		</div>
	        		<div class="col-md-6">
	        			<s:select list="especialidades" name="conFiltro.especialidad.id" 
						key="consultorio.label.especialidad" listKey="id" listValue="nombre" emptyOption="true" />
	        		</div>
	        	</div>
				<div class="row">
					<s:submit value="%{getText('consultorio.button.buscar')}" cssClass="btn btn-default col-md-offset-1"/>
				</div>
			</s:form><br><br>
			<table class="table table-bordered table-striped" id="tblConsultorios">
	      		<thead>
	      			<tr>
	      				<th>Codigo</th>
	      				<th>Ubicacion</th>
	      				<th>Especialidad</th>
	      				<th>Accion</th>
	      			</tr>
	      		</thead>
	      		<tbody>
	     			<s:iterator value="consultorios" status="status">
	     				<tr>
	     					<td><s:property value="codigo" /></td>
	     					<td><s:property value="ubicacion" /></td>
	     					<td><s:property value="especialidad.nombre" /></td>
	     					<td>
	     						<s:url action="cargarConsultorioEditar" id='editar' namespace='consultorios' >
	      						<s:param name='consultorio.id'>
	      							<s:property value='id'/>
	      						</s:param>
	      					</s:url>
	      					<s:a href='%{editar}' cssClass='btn btn-primary' title="Editar" >
      							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
      						</s:a>
	     					</td>
	     				</tr>
	     			</s:iterator>
	      		</tbody>
	      	</table>
		</div>
	</div>
</div>
<script>
$(document).ready( function () {
    $('#tblConsultorios').DataTable(
    	{bFilter: false, bInfo: false}		
    );
} );
</script>

