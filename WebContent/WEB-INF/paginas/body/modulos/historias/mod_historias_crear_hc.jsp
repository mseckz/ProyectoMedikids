<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<head>
<sx:head />
</head>
<div id="page-wrapper">
	<div class="container-fluid">
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
					</h2>
					<br>
					<div class="col-lg-5">
						<s:textfield cssClass="form-control" key="label.nombre"
							placeholder="%{getText('placeholder.nombre')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.apellido.paterno"
							placeholder="%{getText('placeholder.apellido.paterno')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.apellido.materno"
							placeholder="%{getText('placeholder.apellido.materno')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.dni"
							placeholder="%{getText('placeholder.dni')}" name="#" />
						<br>
					</div>
					<div class="col-lg-5">
						<s:textfield cssClass="form-control" key="label.edad"
							placeholder="%{getText('placeholder.edad')}" name="#" />
						<br>
						<s:select cssClass="form-control"
							list="#{'Masculino':'Masculino', 'Femenino':'Femenino'}"
							key="label.sexo" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.direccion"
							placeholder="%{getText('placeholder.direccion')}" name="#" />
						<br>
						<!-- https://struts.apache.org/docs/datetimepicker.html 
						Para que revisen la libreria añadida es struts2-dojo-plugin-2.3.24-->
						<sx:datetimepicker key="label.fecha.nac"
							displayFormat="dd-MM-yyyy" name="#" />
						<br>
					</div>
					<div class="col-lg-2">
						<img align="center" class="img-thumbnail-foto" alt="" src="#">
						<p></p>
						<div>
							<s:submit align="center" cssClass="btn btn-default"
								value="%{getText('accion.buscarfoto')}" />
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="bs">
					<s:textarea rows="10" cssClass="form-control"
						key="label.observaciones" name="#" />
				</div>
			</div>
			<br>

		</div>
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
					<div class="col-lg-5">
						<s:textfield cssClass="form-control" key="label.nombre"
							placeholder="%{getText('placeholder.nombre')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.apellido.paterno"
							placeholder="%{getText('placeholder.apellido.paterno')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.apellido.materno"
							placeholder="%{getText('placeholder.apellido.materno')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.dni"
							placeholder="%{getText('placeholder.dni')}" name="#" />
						<br>
					</div>
					<div class="col-lg-5">
						<s:textfield cssClass="form-control" key="label.telefono"
							placeholder="%{getText('placeholder.telefono')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.email"
							placeholder="%{getText('placeholder.email')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.direccion"
							placeholder="%{getText('placeholder.direccion')}" name="#" />
						<br>
					</div>
					<div class="col-lg-2">
						<img align="center" class="img-thumbnail-foto" alt="" src="#">
						<p></p>
						<div>
							<s:submit align="center" cssClass="btn btn-default"
								value="%{getText('accion.buscarfoto')}" />
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
			<div class="col-lg-12">
				<div class="bs">
					<h2 class="page-header">
						<s:text name="titulo.datos.madre" />
					</h2>
					<br>
					<div class="col-lg-5">
						<s:textfield cssClass="form-control" key="label.nombre"
							placeholder="%{getText('placeholder.nombre')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.apellido.paterno"
							placeholder="%{getText('placeholder.apellido.paterno')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.apellido.materno"
							placeholder="%{getText('placeholder.apellido.materno')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.dni"
							placeholder="%{getText('placeholder.dni')}" name="#" />
						<br>
					</div>
					<div class="col-lg-5">
						<s:textfield cssClass="form-control" key="label.telefono"
							placeholder="%{getText('placeholder.telefono')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.email"
							placeholder="%{getText('placeholder.email')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.direccion"
							placeholder="%{getText('placeholder.direccion')}" name="#" />
						<br>
					</div>
					<div class="col-lg-2">
						<img align="center" class="img-thumbnail-foto" alt="" src="#">
						<p></p>
						<div>
							<s:submit align="center" cssClass="btn btn-default"
								value="%{getText('accion.buscarfoto')}" />
						</div>
					</div>
				</div>
			</div>
			<!-- Fin de datos Madre -->
			<!-- Fin de datos Madre -->
			<!-- Fin de datos Madre -->
			<!-- Inicio Datos Apoderado -->
			<!-- Inicio Datos Apoderado -->
			<div class="col-lg-12">
				<div class="bs">
					<h2 class="page-header">
						<s:text name="titulo.datos.apoderado" />
					</h2>
					<br>
					<div class="col-lg-5">
						<s:textfield cssClass="form-control" key="label.nombre"
							placeholder="%{getText('placeholder.nombre')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.apellido.paterno"
							placeholder="%{getText('placeholder.apellido.paterno')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.apellido.materno"
							placeholder="%{getText('placeholder.apellido.materno')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.dni"
							placeholder="%{getText('placeholder.dni')}" name="#" />
						<br>
					</div>
					<div class="col-lg-5">
						<s:textfield cssClass="form-control" key="label.telefono"
							placeholder="%{getText('placeholder.telefono')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.email"
							placeholder="%{getText('placeholder.email')}" name="#" />
						<br>
						<s:textfield cssClass="form-control" key="label.direccion"
							placeholder="%{getText('placeholder.direccion')}" name="#" />
						<br>
					</div>
					<div class="col-lg-2">
						<img align="center" class="img-thumbnail-foto" alt="" src="#">
						<p></p>
						<div>
							<s:submit align="center" cssClass="btn btn-default"
								value="%{getText('accion.buscarfoto')}" />
						</div>
					</div>
					<!-- Fin de datos Apoderado -->
					<!-- Fin de datos Apoderado -->
					<!-- Fin de datos Apoderado -->
				</div>
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
						<s:select cssClass="form-control"
							list="#{'A+':'A+', 'A-':'A-','B+':'B+', 'B-':'B-','O+':'O+', 'O-':'O-','AB+':'AB+', 'AB-':'AB-'}"
							key="label.tipo.sangre" name="#" />
						<br>
					</div>
					<div class="col-lg-10"></div>
					<br>
					<div class="col-lg-12">
						<div class="bs">
							<br>
							<s:textarea rows="10" cssClass="form-control"
								key="label.alergias" name="#" />
						</div>
					</div>

					<br>
					<div class="col-lg-12">
						<div class="bs">
							<s:textarea rows="10" cssClass="form-control"
								key="label.antecedentes.hereditarios" name="#" />
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
	</div>
</div>