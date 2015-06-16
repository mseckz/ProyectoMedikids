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
			<div class="modal-body">
				<div class="col-lg-6">
					<s:textfield cssClass="form-control" key="label.nombre"
						placeholder="%{getText('placeholder.nombre')}" name="#" />
					<br>
					<s:textfield cssClass="form-control" key="label.apellido.paterno"
						placeholder="%{getText('placeholder.apellido.paterno')}" name="#" />
					<br>
				</div>
				<div class="col-lg-6">
					<s:textfield cssClass="form-control" key="label.apellido.materno"
						placeholder="%{getText('placeholder.apellido.materno')}" name="#" />
					<br>
					<s:textfield cssClass="form-control" key="label.dni"
						placeholder="%{getText('placeholder.dni')}" name="#" />
					<br>
				</div>
			</div>
			<div class="col-lg-12">
				<button type="button" class="btn btn-default">
					<s:text name="accion.buscar" />
				</button>
			</div>
			<br>
			<div class="col-lg-12">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					Cerrar</button>
				Aca debe ir la tabla
			</div>
		</div>
	</div>
</div>