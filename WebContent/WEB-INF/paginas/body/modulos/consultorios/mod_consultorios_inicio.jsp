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
			<s:form theme="bootstrap" action="editarConsultorio" namespace="/consultorios">
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
					<div class="col-md-4" ><s:submit cssClass="btn btn-default" value="Registrar" /></div>
				</div>
			</s:form>
		</div>
		<div class="bs">
			<h2 class="page-header">
				<s:text name="consultorio.horarios.titulo" />
			</h2>
			<s:form theme="bootstrap" action="" namespace="/horarios">
				
			</s:form>
		</div>
	</div>
</div>