<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<s:form action="cambiarPassword"  namespace="/usuario" theme="bootstrap">
				<div class="col-lg-12">
					<h1 class="page-header">
						<s:text name="titulo.miperfil.configuracion" />
					</h1>
				</div>
				<div class="col-lg-12">
					<div class="col-lg-5">
						<s:hidden value="%{#session.id_usuario}" name="cambioP.id" />
						<s:password name="cambioP.contrasena" cssClass="form-control"
							placeholder="%{getText('label.nuevo.password')}"
							key="label.ing.nuevo.password" />
						<br>
						<s:password name="cambioP.repcontrasena" cssClass="form-control"
							placeholder="%{getText('label.nuevo.repite.password')}"
							key="label.ing.nuevo.repite.password" />
						<br>
						<s:submit value="%{getText('accion.cambiar.contraseña')}"
							cssClass="btn btn-lg btn-primary btn-block" />
					</div>
				</div>
			</s:form>
			<s:actionmessage />
			<s:actionerror />
		</div>
	</div>
</div>