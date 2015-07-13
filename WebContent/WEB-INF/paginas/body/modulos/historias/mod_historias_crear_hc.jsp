<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<head>
<sx:head />
</head>

<div id="page-wrapper">

	<div class="container-fluid">
		<s:form action="editarHC" namespace="/historias" theme="bootstrap"
			enctype="multipart/form-data">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						<s:text name="titulo.crear.historias" />
					</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="bs">
						<h2 class="page-header">
							<s:text name="titulo.datos.paciente" />
							<%-- 	<s:hidden name="historiaclinica.id" /> --%>
						</h2>
						<br>
						<div class="col-lg-6">
							<s:textfield cssClass="form-control" key="label.nombre"
								placeholder="%{getText('placeholder.nombre')}"
								name="historiaclinica.nombrePaciente" />
							<br>
							<s:textfield cssClass="form-control" key="label.apellido.paterno"
								placeholder="%{getText('placeholder.apellido.paterno')}"
								name="historiaclinica.apellidoPaternoPaciente" />
							<br>
							<s:textfield cssClass="form-control" key="label.apellido.materno"
								placeholder="%{getText('placeholder.apellido.materno')}"
								name="historiaclinica.apellidoMaternoPaciente" />
							<br>
							<s:textfield cssClass="form-control" key="label.dni"
								placeholder="%{getText('placeholder.dni')}"
								name="historiaclinica.dniPaciente" />
							<br>
						</div>
						<div class="col-lg-6">
							<s:textfield cssClass="form-control" key="label.edad"
								placeholder="%{getText('placeholder.edad')}"
								name="historiaclinica.edadPaciente" />
							<br>
							<s:select cssClass="form-control"
								list="#{'0':'Masculino', '1':'Femenino'}" key="label.sexo"
								name="historiaclinica.sexoPaciente" />
							<br>
							<s:textfield cssClass="form-control" key="label.direccion"
								placeholder="%{getText('placeholder.direccion')}"
								name="historiaclinica.direccionPaciente" />
							<br>
							<!-- https://struts.apache.org/docs/datetimepicker.html 
						Para que revisen la libreria añadida es struts2-dojo-plugin-2.3.24-->
							<sx:datetimepicker key="label.fecha.nac"
								displayFormat="dd-MM-yyyy"
								name="historiaclinica.fechaNacPaciente" />
							<br>
						</div>
						<%-- <div class="col-lg-3">
							<div align="center">
								<img align="middle" class="img-thumbnail-foto" alt="" src="#">
							</div>

							<p></p>
							<div>
								<s:file key="accion.buscarfoto" cssClass="btn btn-default"
								name="fileUpload" />
								<br>
							</div>
						</div> --%>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="bs">
						<s:textarea rows="10" cssClass="form-control"
							key="label.observaciones" name="historiaclinica.observaciones" />
					</div>
				</div>
				<div class="col-lg-8">
					<div class="bs">
						<s:text name="label.condicion.hc.padre-madre-apoderado" />
					</div>
				</div>
				<div class="col-lg-12">
					<div class="col-lg-2">
						<button type="button" class="btn btn-sm btn-primary"
							onclick="$('.tab-resume-padre').slideToggle();"
							style="display: inline-block;">
							<s:text name="accion.mostrar.padre" />
						</button>
					</div>
					<div class="col-lg-2">
						<button type="button" class="btn btn-sm btn-primary"
							onclick="$('.tab-resume-madre').slideToggle();"
							style="display: inline-block;">
							<s:text name="accion.mostrar.madre" />
						</button>
					</div>
					<div class="col-lg-2">
						<button type="button" class="btn btn-sm btn-primary"
							onclick="$('.tab-resume-apoderado').slideToggle();"
							style="display: inline-block;">
							<s:text name="accion.mostrar.apoderado" />
						</button>
					</div>
				</div>
				<br>

			</div>
			<div class="tab-resume-padre" style="display: none;">
				<div class="row">
					<div class="col-lg-12">
						<div class="bs">
							<h2 class="page-header">
								<s:text name="titulo.datos.familiares" />
							</h2>
							<!-- Inicio Datos Padre -->
							<!-- Inicio Datos Padre -->
							<h2 class="page-header">
								<s:text name="titulo.datos.padre" />
							</h2>
							<br>
							<div class="col-lg-6">
								<s:textfield cssClass="form-control" key="label.nombre"
									placeholder="%{getText('placeholder.nombre')}"
									name="historiaclinica.nombrePadre" />
								<br>
								<s:textfield cssClass="form-control"
									key="label.apellido.paterno"
									placeholder="%{getText('placeholder.apellido.paterno')}"
									name="historiaclinica.apellidoPaternoPadre" />
								<br>
								<s:textfield cssClass="form-control"
									key="label.apellido.materno"
									placeholder="%{getText('placeholder.apellido.materno')}"
									name="historiaclinica.apellidoMaternoPadre" />
								<br>
								<s:textfield cssClass="form-control" key="label.dni"
									placeholder="%{getText('placeholder.dni')}"
									name="historiaclinica.dniPadre" />
								<br>
							</div>
							<div class="col-lg-6">
								<s:textfield cssClass="form-control" key="label.telefono"
									placeholder="%{getText('placeholder.telefono')}"
									name="historiaclinica.telefonoPadre" />
								<br>
								<s:textfield cssClass="form-control" key="label.email"
									placeholder="%{getText('placeholder.email')}"
									name="historiaclinica.correoPadre" />
								<br>
								<s:textfield cssClass="form-control" key="label.direccion"
									placeholder="%{getText('placeholder.direccion')}"
									name="historiaclinica.direccionPadre" />
								<br>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Fin de datos Padre -->
			<!-- Fin de datos Padre -->
			<!-- Fin de datos Padre -->
			<!-- Inicio Datos Madre -->
			<!-- Inicio Datos Madre -->
			<br>
			<div class="tab-resume-madre" style="display: none;">
				<div class="col-lg-12">
					<div class="bs">
						<h2 class="page-header">
							<s:text name="titulo.datos.madre" />
						</h2>
						<br>
						<div class="col-lg-6">
							<s:textfield cssClass="form-control" key="label.nombre"
								placeholder="%{getText('placeholder.nombre')}"
								name="historiaclinica.nombreMadre" />
							<br>
							<s:textfield cssClass="form-control" key="label.apellido.paterno"
								placeholder="%{getText('placeholder.apellido.paterno')}"
								name="historiaclinica.apellidoPaternoMadre" />
							<br>
							<s:textfield cssClass="form-control" key="label.apellido.materno"
								placeholder="%{getText('placeholder.apellido.materno')}"
								name="historiaclinica.apellidoMaternoMadre" />
							<br>
							<s:textfield cssClass="form-control" key="label.dni"
								placeholder="%{getText('placeholder.dni')}"
								name="historiaclinica.dniMadre" />
							<br>
						</div>
						<div class="col-lg-6">
							<s:textfield cssClass="form-control" key="label.telefono"
								placeholder="%{getText('placeholder.telefono')}"
								name="historiaclinica.telefonoMadre" />
							<br>
							<s:textfield cssClass="form-control" key="label.email"
								placeholder="%{getText('placeholder.email')}"
								name="historiaclinica.correoMadre" />
							<br>
							<s:textfield cssClass="form-control" key="label.direccion"
								placeholder="%{getText('placeholder.direccion')}"
								name="historiaclinica.direccionMadre" />
							<br>
						</div>
					</div>
				</div>
			</div>
			<!-- Fin de datos Madre -->
			<!-- Fin de datos Madre -->
			<!-- Fin de datos Madre -->
			<!-- Inicio Datos Apoderado -->
			<!-- Inicio Datos Apoderado -->
			<div class="tab-resume-apoderado" style="display: none;">
				<div class="col-lg-12">
					<div class="bs">
						<h2 class="page-header">
							<s:text name="titulo.datos.apoderado" />
						</h2>
						<br>
						<div class="col-lg-6">
							<s:hidden name="historiaclinica.id" />
							<s:textfield cssClass="form-control" key="label.nombre"
								placeholder="%{getText('placeholder.nombre')}"
								name="historiaclinica.nombreApoderado" />
							<br>
							<s:textfield cssClass="form-control" key="label.apellido.paterno"
								placeholder="%{getText('placeholder.apellido.paterno')}"
								name="historiaclinica.apellidoPaternoApoderado" />
							<br>
							<s:textfield cssClass="form-control" key="label.apellido.materno"
								placeholder="%{getText('placeholder.apellido.materno')}"
								name="historiaclinica.apellidoMaternoApoderado" />
							<br>
							<s:textfield cssClass="form-control" key="label.dni"
								placeholder="%{getText('placeholder.dni')}"
								name="historiaclinica.dniApoderado" />
							<br>
						</div>
						<div class="col-lg-6">
							<s:textfield cssClass="form-control" key="label.telefono"
								placeholder="%{getText('placeholder.telefono')}"
								name="historiaclinica.telefonoApoderado" />
							<br>
							<s:textfield cssClass="form-control" key="label.email"
								placeholder="%{getText('placeholder.email')}"
								name="historiaclinica.correoApoderado" />
							<br>
							<s:textfield cssClass="form-control" key="label.direccion"
								placeholder="%{getText('placeholder.direccion')}"
								name="historiaclinica.direccionApoderado" />
							<br>
						</div>
					</div>
					<!-- Fin de datos Apoderado -->
					<!-- Fin de datos Apoderado -->
					<!-- Fin de datos Apoderado -->
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="bs">
						<h2 class="page-header">
							<s:text name="titulo.datos.antecedentes" />
						</h2>
						<br>
						<div class="col-lg-2">
							<s:select cssClass="form-control" list="tipoSangres" listKey="id"
								listValue="nombreTipoSangre" key="label.tipo.sangre"
								name="historiaclinica.tipoSangre.id" />
							<br>
						</div>
						<div class="col-lg-10"></div>
						<br>
						<div class="col-lg-12">
							<div class="bs">
								<br>
								<s:textarea rows="10" cssClass="form-control"
									key="label.alergias" name="historiaclinica.alergias" />
							</div>
						</div>

						<br>
						<div class="col-lg-12">
							<div class="bs">
								<s:textarea rows="10" cssClass="form-control"
									key="label.antecedentes.hereditarios"
									name="historiaclinica.Antecedentes" />
							</div>
						</div>
						<div class="col-lg-12">
							<br>
							<div class="col-lg-10"></div>
							<div class="col-lg-2">
								<s:submit value="%{getText('accion.crear')}"
									cssClass="btn btn-lg btn-primary btn-block" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</s:form>
	</div>

</div>


