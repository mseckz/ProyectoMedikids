<%@ taglib prefix="s" uri="/struts-tags"%>

	
<div class="container-fluid" style="margin-bottom: 100px;">
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
					<s:hidden name="consultorio.id" />
					<s:textfield name="consultorio.codigo" cssClass="form-control" key="consultorio.label.codigo"
					placeholder="%{getText('consultorio.placeholder.codigo')}" readonly="true"/>
					<s:textfield name="consultorio.ubicacion" cssClass="form-control" key="consultorio.label.ubicacion"
					placeholder="%{getText('consultorio.placeholder.ubicacion')}" />
				</div>
				<div class="col-md-5">
					<s:select list="especialidades" name="consultorio.especialidad.id" 
					key="consultorio.label.especialidad" listKey="id" listValue="nombre" headerKey="-1" headerValue="Elija especialidad" />
					<s:textarea name="consultorio.descripcion" cssClass="form-control" key="consultorio.label.descripcion"
					placeholder="%{getText('consultorio.placeholder.descripcion')}" />
				</div>
				<div class="col-md-4" >
					<s:submit cssClass="btn btn-default col-md-offset-1" value="%{getText('consultorio.button.grabar')}" />
					<a href="<s:url action="cancelarRegistro" />" class="btn btn-default" >Cancelar</a>
				</div>
			</div>
		</s:form>
		<br>
		<div>
			<s:actionmessage/>
		</div>
	</div>
</div>