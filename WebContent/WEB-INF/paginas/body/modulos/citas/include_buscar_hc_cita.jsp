<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog-mod">
		<div class="modal-content-mod">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					<s:text name="titulo.buscar.historias" />
				</h4>
			</div>
			
			<div class="modal-body row">
				<div class="col-lg-12">
					<s:form theme="bootstrap" cssClass="form-horizontal" action="buscarHistoria" id="buscarHC" 
        			data-target="#myModal" method="POST">
						<div class="col-lg-6">
							<s:textfield cssClass="form-control" key="label.nombre"
								placeholder="%{getText('placeholder.nombre')}" name="hcFiltro.nombrePaciente" />
							<br>
							<s:textfield cssClass="form-control" key="label.apellido.paterno"
								placeholder="%{getText('placeholder.apellido.paterno')}" name="hcFiltro.apellidoPaternoPaciente" />
							<br>
						</div>
						<div class="col-lg-6">
							<s:textfield cssClass="form-control" key="label.apellido.materno"
								placeholder="%{getText('placeholder.apellido.materno')}" name="hcFiltro.apellidoMaternoPaciente" />
							<br>
							<s:textfield cssClass="form-control" key="label.dni"
								placeholder="%{getText('placeholder.dni')}" name="hcFiltro.dniPaciente" />
							<br>
						</div>
						<div class="col-md-offset-10">
							<s:submit cssClass="btn btn-default" value="%{getText('accion.buscar')}"/>
						</div>
					</s:form><br>
					<table class="table table-bordered table-striped" id="historias">
			      		<thead>
			      			<tr>
			      				<th>Id</th>
			      				<th>Nombre</th>
			      				<th>DNI</th>
			      				<th>Accion</th>
			      			</tr>
			      		</thead>
			      		<tbody>
			      		</tbody>
			      	</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
		</div>
	</div>
</div>