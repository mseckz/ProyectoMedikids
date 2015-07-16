<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<script src="jquery.js"></script>

<div id="page-wrapper">
	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					<s:text name="titulo.miperfil.usuario" />
				</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="col-lg-6">
					<table class="table table-hover table-striped">
						<tr>
							<td><s:text name="label.usuario.nombre" />:</td>
							<td><s:property value="#session.id_usuario" /></td>
						</tr>
						<tr>
							<td><s:text name="label.usuario.nombre" />:</td>
							<td><s:property value="#session.nombre_usuario" /></td>
						</tr>
						<tr>
							<td><s:text name="label.nombre_completo" />:</td>
							<td><s:property value="#session.nombre_completo" /></td>
						</tr>
						<tr>
							<td><s:text name="label.dni" />:</td>
							<td><s:property value="#session.dni" /></td>
						</tr>
						<tr>
							<td><s:text name="label.telefono" />:</td>
							<td><s:property value="#session.telefono" /></td>
						</tr>
						<tr>
							<td><s:text name="label.celular" />:</td>
							<td><s:property value="#session.celular" /></td>
						</tr>
						<tr>
							<td><s:text name="label.email" />:</td>
							<td><s:property value="#session.correo" /></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
