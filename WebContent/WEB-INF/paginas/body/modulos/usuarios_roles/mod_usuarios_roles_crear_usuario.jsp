<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<script src="jquery.js"></script>
<%-- <script>
	$(function() {
		$("#Buscar_HC").load("buscarPersonal.jsp");
	});
</script> --%>

<div id="page-wrapper">
	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					<s:text name="titulo.crear.usuario" />
				</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="bs">
					<h2 class="page-header">
						<s:text name="titulo.datos.usuario" />
					</h2>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="form-group ">
					<label class="  control-label"
						for="editarUsuarios_usuarioRol_personal_id"><s:text
							name="label.usuario.busqueda.personal" /></label>
					<div class="  controls">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#buscarPersonal">
							<s:text name="label.usuario.buscar" />
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
		<s:form action="editarUsuarios" namespace="/usuarios-roles" theme="bootstrap">
			<div class="col-lg-12">
					<div class="col-lg-6">
						<s:hidden value="%{personal.id}" name="usuarioRol.personal.id" /> 
						<s:textfield cssClass="form-control" key="label.usuario.personal.nombre"
							placeholder="%{getText('placeholder.usuario.personal.nombre')}"
							value="%{personal.nombreCompleto}"
							readonly="true" />
						<br>
						<s:textfield cssClass="form-control" key="label.usuario.nombre"
							placeholder="%{getText('placeholder.usuario.nombre')}"
							name="usuarioRol.nombreUsuario" />
						<br>
						<s:textfield cssClass="form-control"
							key="label.usuario.contrasena"
							placeholder="%{getText('placeholder.usuario.contrasena')}"
							name="usuarioRol.contrasena" />
						<br>
						<s:select cssClass="form-control" list="roles" listKey="idRol"
							listValue="descripcion" key="label.tipo.rol"
							name="usuarioRol.rol.idRol" headerKey="100"
							headerValue="%{getText('mensaje.selecciona.rol')}" />
						<br>
					</div>
					<div class="col-lg-12">
						<br>
						<div class="col-lg-10"></div>
						<div class="col-lg-2">
							<s:submit value="%{getText('accion.crear')}"
								cssClass="btn btn-lg btn-primary btn-block" />
						</div>
					</div>
					<s:actionmessage />
					<s:actionerror />
				</div>
			</s:form>
		</div>
	</div>
</div>
<jsp:include
	page="/WEB-INF/paginas/body/modulos/usuarios_roles/buscarPersonal.jsp"></jsp:include>

<script>
	window.onload = function() {

		$('#buscarPer')
				.submit(
						function(event) {//buscar cons es el id del form que se ejecuta en el popup
							var $form = $("#buscarPer");
							var $target = $($form.attr('data-target'));

							$
									.ajax({
										type : $form.attr('method'),
										url : $form.attr('action'),
										data : $form.serialize(),
										datatype : 'json',
										success : function(data, status) {
											console.log(data);

											$('#buscarPersonal').modal('show');//buscarCOnsulttorio es el action del form del popup

											var lista = data;//consultorios es el nombre del objecto(la lista de consultorios) en el action que recibe la lista
											var url = "http://localhost:8080/proyFinal/usuarios-roles/usuarios-roles/cargarPersonal.action?personal.id=";

											for (var i = 0; i < lista.length; i++) {
												tr = $('<tr/>');
												tr.append("<td>" + lista[i].id
														+ "</td>");
												tr.append("<td>"
														+ lista[i].nombres
														+ "</td>");
												tr.append("<td>"
														+ lista[i].apellidos
														+ "</td>");
												tr.append("<td>" + lista[i].dni
														+ "</td>");
												tr
														.append("<td><a href="+ url +lista[i].id +">Seleccionar</a></td>");
												$("#Personal tbody").append(tr);// consultorios es el nombre del objecto(la lista de consultorios) en el action que recibe la lista
											}

										}
									});

							event.preventDefault();
						});
	}

	
</script>