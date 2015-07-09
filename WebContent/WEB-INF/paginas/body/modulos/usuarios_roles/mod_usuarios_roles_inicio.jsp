<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<script src="jquery.js"></script>
<%-- <script>
	$(function() {
		$("#Buscar_HC").load("include_buscar_usuario_rol.jsp");
	});
</script> --%>


<head>
<sx:head />
</head>
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					<s:text name="titulo.1.roles" />
				</h1>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-lg-4">
				<s:text name="parrafo.p.usuarios-2" />
			</div>
			<div class="col-lg-4">
				<!-- Para Llamar al Pop up Buscar Historia -->

				<!-- Button trigger modal -->
				<button type="button" class="btn btn-lg btn-primary"
					data-toggle="modal" data-target="#include_buscar_usuario_rol">
					<s:text name="accion.buscarUsuario" />
				</button>
				<s:form action="buscarUsuarios" namespace="/usuarios-roles"
					theme="bootstrap">
					<jsp:include
						page="/WEB-INF/paginas/body/reutilizables/include_buscar_usuario_rol.jsp"></jsp:include>
				</s:form>
				<!-- Fin del Popup Buscar Historia -->
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-lg-4">
				<s:text name="parrafo.p.usuarios-1" />
			</div>
			<div class="col-lg-4">
				<s:form action="crearUsuarios" namespace="/usuarios-roles">
					<s:submit value="%{getText('accion.crearUsuario')}"
						cssClass="btn btn-lg btn-primary btn-block" />
				</s:form>
			</div>
		</div>
		<br>
		<s:actionmessage />
		<s:actionerror />

		<!-- listado de resultado de busqueda -->
		<div class="col-lg-12">
			<s:if test="! usuarios.empty">
				<h3>
					<s:text name="titulo.resultado.busqueda" />
				</h3>
				<div class="table-responsive">
					<hr />
					<table class="table table-bordered table-hover table-striped">
						<thead>
							<tr class="titulos">
								<th><s:text name="usu.campo.id" /></th>
								<th><s:text name="usu.campo.nombre.usuario" /></th>
								<th><s:text name="usu.campo.personal.nombre" /></th>
								<th><s:text name="usu.campo.personal.ape" /></th>
								<th><s:text name="usu.campo.personal.dni" /></th>
								<th><s:text name="usu.campo.rol" /></th>
								<th><s:text name="usu.campo.estado" /></th>
							</tr>
						</thead>
						<s:iterator value="usuarios" status="status">
							<tr>
								<td><s:property value="id" /></td>
								<td><s:property value="nombreUsuario" /></td>
								<td><s:property value="personal.nombres" /></td>
								<td><s:property value="personal.apellidos" /></td>
								<td><s:property value="personal.dni" /></td>
								<td><s:property value="rol.descripcion" /></td>
								<td><s:if test="estado">
										<s:text name="usu.campo.estado.activo" />
									</s:if> <s:else>
										<s:text name="usu.campo.estado.desactivo" />
									</s:else></td>
								<td><s:url action="desactivarUsuario" id="desactivar" namespace="/usuarios-roles">
										<s:param name="usuarioRol.id">
											<s:property value="id" />
										</s:param>
									</s:url> <s:a href="%{desactivar}" cssClass="btn btn-default">
										<s:text name="accion.desactivar.inicial" />
									</s:a></td>
							</tr>
						</s:iterator>
					</table>
				</div>
			</s:if>
		</div>
	</div>
</div>
