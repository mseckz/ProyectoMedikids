<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- Modal -->
<div class="modal fade" id="buscarPersonal2" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog-mod" role="document">
		<div class="modal-content-mod">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					<s:text name="titulo.usuarios.buscar.personal.popup" />
				</h4>
			</div>
			<s:form theme="bootstrap" action="buscarPersonal"
				namespace="/usuarios-roles" id="buscarPer"
				data-target="#buscarPersonal" method="POST">
				<div class="modal-body">
					<div class="col-lg-4">
						<s:textfield name="persoUsuFiltro.nombres"
							key="Nombres"
							placeholder="Ingrese Nombre a Buscar"
							cssClass="form-control" />
					</div>
					<div class="col-lg-4">
						<s:textfield name="persoUsuFiltro.apellidos"
							key="Apellidos"
							placeholder="%{getText('placeholder.usuario.personal.apellido')}"
							cssClass="form-control" />
					</div>
					<div class="col-lg-4">
						<s:textfield name="persoUsuFiltro.dni"
							key="DNI"
							placeholder="%{getText('placeholder.usuario.personal.dni')}"
							cssClass="form-control" />
					</div>
				</div>
				<div class="col-lg-12">
					<div class="col-lg-2">
						<s:submit value="%{getText('accion.buscar')}"
							cssClass="btn btn-default col-md-offset-1" />
					</div>
					
				</div>
				
			</s:form>
			<br>
			<div class="table-responsive">
				<table class="table table-bordered table-hover table-striped"
					id="Personal">
					<thead>
						<tr>
							<th><s:text name="usu.campo.id" /></th>
							<th><s:text name="usu.campo.personal.nombre" /></th>
							<th><s:text name="usu.campo.personal.ape" /></th>
							<th><s:text name="usu.campo.personal.dni" /></th>
							<th><s:text name="usu.campo.accion" /></th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
<!-- 		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div> -->
	</div>
</div>


