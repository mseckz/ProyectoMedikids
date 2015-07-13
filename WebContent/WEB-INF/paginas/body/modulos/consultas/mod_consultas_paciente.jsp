<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
	.tabs > li {
		background-color: gray;
	}
</style>
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<ul class="nav nav-pills tabs" role="tablist" style="padding-bottom: 30px;">
				<s:url action="obtenerDetalleConsulta" id="consultas" >
					<s:param name="historia.id">
						<s:property value="%{historia.id}"/>
					</s:param>
					<s:param name="cita.id">
						<s:property value="%{cita.id}"/>
					</s:param>
				</s:url>
		    	<li role="presentation" class="active"><a href="#" aria-controls="home" role="tab" 
		    										>Datos de paciente</a></li>
		    	<li role="presentation"><s:a href="%{consultas}" aria-controls="profile" role="tab" 
		    										>Agregar Consulta</s:a></li>
			</ul>
			
			<div class="tab-content">
			    <div role="tabpanel" class="tab-pane active" id="historia">
		    		<div class="col-lg-12">
		    			<h2>Paciente: <s:property value="%{historia.nombreCompletoPaciente()}" /></h2>
						<div class="col-lg-5">
							<h4><b>DNI:</b></h4>
							<p><s:property value="%{historia.dniPaciente}" /></p><br>
							<h4><b>Fecha de Nacimiento:</b></h4>
							<p><s:property value="%{historia.fechaNacPaciente}"/></p><br>
						</div>
						<div class="col-lg-4">
							<h4><b>Edad:</b></h4>
							<p><s:property value="%{historia.edadPaciente}"/></p><br>
							<h4><b>Sexo:</b></h4>
							<p><s:property value="%{historia.sexoPaciente == 0 ? 'Masculino' : 'Femenino' }"/></p><br>
						</div>
						
						<div class="col-lg-12">
							<h4><b>Observaciones</b></h4>
							<s:if test="historia.observaciones == null">
								<p>No hay observaciones</p><br>
							</s:if>
							<s:else>
								<p><s:property value="%{historia.observaciones}"/></p><br>
							</s:else>
						</div>
					</div>
					<div class="col-lg-12">
						<h2> Antecedentes </h2>
						<div class="col-lg-5">
							<h4><b>Tipo de Sangre</b></h4>
							<p><s:property value="%{historia.tipoSangre.nombreTipoSangre}"/></p><br>
						</div>
						<div class="col-lg-4">
							<h4><b>Alergias</b></h4>
							<s:if test="historia.alergias == null">
								<p>No hay alergias registradas</p><br>
							</s:if>
							<s:else>
								<p><s:property value="%{historia.alergias}"/></p><br>
							</s:else>
						</div>
					</div>
					<div class="col-lg-12">
						<h4><b>Antecedentes Hereditarios</b></h4>
						<s:if test="historia.Antecedentes == null">
							<p>No se encuentran antecedentes registrados</p><br>
						</s:if>
						<s:else>
							<p><s:property value="%{historia.Antecedentes}"/></p><br>
						</s:else>
					</div>
			    </div>
 			</div>
		</div>
	</div>	
</div>

<script>

</script>