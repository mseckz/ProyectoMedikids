<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%-- <head>
<sx:head />
</head> --%>
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header"><s:text name="consultorio.titulo" /></h1>
			</div>
		</div>
		<div class="bs">
			<h2 class="page-header">
				<s:text name="consultorio.registrar.titulo" />
			</h2>
			<s:form theme="bootstrap" action="editarConsultorio" namespace="/consultorios" cssClass="form-horizontal">
				<div class="row">
					<div class="col-md-5">
						<s:textfield name="consultorio.codigo" cssClass="form-control" key="consultorio.label.codigo"
						placeholder="%{getText('consultorio.placeholder.codigo')}" />
						<s:textfield name="consultorio.ubicacion" cssClass="form-control" key="consultorio.label.ubicacion"
						placeholder="%{getText('consultorio.placeholder.ubicacion')}" />
					</div>
					<div class="col-md-5">
						<s:select list="especialidades" name="consultorio.especialidad.id" 
						key="consultorio.label.especialidad" listKey="id" listValue="nombre" emptyOption="true" />
						<s:textarea name="consultorio.descripcion" cssClass="form-control" key="consultorio.label.descripcion"
						placeholder="%{getText('consultorio.placeholder.descripcion')}" />
					</div>
					<div class="col-md-4" ><s:submit cssClass="btn btn-default col-md-offset-1" value="%{getText('consultorio.button.grabar')}" /></div>
				</div>
			</s:form>
		</div>
		<div class="bs">
			<h2 class="page-header">
				<s:text name="consultorio.horarios.titulo" />
			</h2>
			<s:form theme="bootstrap" action="agregarMedicoHorario" namespace="/consultorios" cssClass="form-horizontal">
				<div class="row">
					<div class="col-md-5">
						<s:textfield cssClass="form-control" key="horario.label.codigo" name="horario.consultorio.id" value="" />
						
						<s:select list="turnos" name="horario.turno.id" 
						key="horario.label.turno" listKey="id" listValue="descripcion" emptyOption="true" />
						
						<s:select list="medicos" name="horario.medico.id" 
						key="horario.label.medico" listKey="id" listValue="nombreCompleto" emptyOption="true" />
					</div>
					<div class="col-md-5">
						<s:textfield cssClass="form-control" key="horario.label.especialidad" value="" />
						<s:select list="dias" name="horario.dia.id" 
						key="horario.label.dia" listKey="id" listValue="nombre" emptyOption="true" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 btn-group" role="group">
						<s:submit value="%{getText('horario.button.registrar')}"  cssClass="btn btn-primary" />

						<a href="<s:url action="borrarMedicoHorario" namespace="/consultorios" />" class="btn btn-primary">
							<s:text name="horario.button.borrarmedico" />
						</a>
						<a href="<s:url action="borrarTodos" namespace="/consultorios" />" class="btn btn-primary">
							<s:text name="horario.button.borrartodos" />
						</a>
					</div>
					<div class="col-md-3">
						<a href="<s:url action="editarHorario" namespace="/consultorios" />" class="btn btn-default btn-lg"><s:text name="horario.button.grabarhorario" /></a>>
					</div>
				</div>
			</s:form><hr>
			<s:property value="horaios.size()"/>
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<td>Horas</td>
						<td>Lunes</td>
						<td>Martes</td>
						<td>Miercoles</td>
						<td>Jueves</td>
						<td>Viernes</td>
						<td>Sabado</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>asd</td>
						<td>asd</td>
						<td>asd</td>
						<td>asd</td>
						<td>asd</td>
						<td>asd</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>