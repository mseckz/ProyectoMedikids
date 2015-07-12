<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<!-- Modal -->
<div class="modal fade" id="include_buscar_usuario_rol" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog-mod">
		<div class="modal-content-mod">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					<s:text name="titulo.buscar.usuarios" />
				</h4>
			</div>

			<div class="modal-body">
				<div class="col-lg-6">
					<s:textfield cssClass="form-control" key="label.nombre.usuario"
						placeholder="%{getText('placeholder.nombre.usuario')}"
						name="usuarioFiltro.nombreUsuario" />
					<br>
					<s:textfield cssClass="form-control" key="label.nombre.personal"
						placeholder="%{getText('placeholder.nombre.personal')}"
						name="usuarioFiltro.nombres" />
					<br>
				</div>
				<div class="col-lg-6">
					<s:textfield cssClass="form-control" key="label.apellido.personal"
						placeholder="%{getText('placeholder.apellido.personal')}"
						name="usuarioFiltro.apellidos" />
					<br>
					<s:textfield cssClass="form-control" key="label.dni.personal"
						placeholder="%{getText('placeholder.dni.personal')}"
						name="usuarioFiltro.dni" />
					<br>
				</div>
				<div class="col-lg-3">
					<s:select cssClass="form-control" list="roles" listKey="idRol"
						listValue="descripcion" key="label.tipo.rol"
						name="usuarioFiltro.rol.idRol" headerKey="100" headerValue="%{getText('mensaje.selecciona.rol')}" />
					<br>
				</div>
			</div>
			<div class="col-lg-12">
				<s:submit cssClass="btn btn-default"
					value="%{getText('accion.buscar')}" />
			</div>
		</div>
	</div>
</div>