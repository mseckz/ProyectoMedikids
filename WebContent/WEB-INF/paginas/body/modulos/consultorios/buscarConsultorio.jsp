<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- Modal -->
<div class="modal fade" id="buscarConsultorio" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog-mod" role="document">
    <div class="modal-content-mod">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        <s:form theme="bootstrap" cssClass="form-horizontal" action="buscarConsultorio" id="buscarCons" 
        	data-target="#buscarConsultorio" method="POST">
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
		</s:form><br>
      	<table class="table table-bordered table-striped" id="consultorios">
      		<thead>
      			<tr>
      				<th>Codigo</th>
      				<th>Ubicacion</th>
      				<th>Especialidad</th>
      				<th>Accion</th>
      			</tr>
      		</thead>
      		<tbody>
      		
     			<%-- <s:iterator value="consultorios" status="status">
     				<tr>
     					<td><s:property value="codigo" /></td>
     					<td><s:property value="ubicacion" /></td>
     					<td><s:property value="especialidad.nombre" /></td>
     					<td>
     						<s:url action="cargarConsultorio" id='seleccionar' namespace='consultorios' >
      						<s:param name='consultorio.id'>
      							<s:property value='id'/>
      						</s:param>
      					</s:url>
      					<s:a href='%{seleccionar}' cssClass='btn btn-primary'>Seleccionar</s:a>
     					</td>
     				</tr>
     			</s:iterator> --%>
      		</tbody>
      	</table>
      </div>    
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
