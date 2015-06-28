<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<script src="jquery.js"></script>
<script>
	$(function() {
		$("#Buscar_HC").load("include_buscar_hc.jsp");
	});
</script>


<head>
<sx:head />
</head>
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					<s:text name="titulo.1.historias" />
				</h1>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-lg-4">
				<s:text name="parrafo.p.historias-2" />
			</div>
			<div class="col-lg-4">
				<!-- Para Llamar al Pop up Buscar Historia -->

				<!-- Button trigger modal -->
				<button type="button" class="btn btn-lg btn-primary"
					data-toggle="modal" data-target="#myModal">
					<s:text name="accion.buscarHistoria" />
				</button>
				<s:form action="buscarHC" namespace="/historias" theme="bootstrap">
					<jsp:include
						page="/WEB-INF/paginas/body/reutilizables/include_buscar_hc.jsp"></jsp:include>
				</s:form>
				<!-- Fin del Popup Buscar Historia -->
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-lg-4">
				<s:text name="parrafo.p.historias-1" />
			</div>
			<div class="col-lg-4">
				<s:form action="crearHistorias" namespace="/historias">
					<s:submit value="%{getText('accion.crearHistoria')}"
						cssClass="btn btn-lg btn-primary btn-block" />
				</s:form>
			</div>
		</div>
		<br>
		<s:actionmessage />
		<s:actionerror />

		<!-- listado de resultado de busqueda -->
		<div class="col-lg-12">
			<s:if test="! historias.empty">
				<h3>
					<s:text name="titulo.resultado.busqueda" />
				</h3>
				<div class="table-responsive">
					<hr />
					<table class="table table-bordered table-hover table-striped">
						<thead>
							<tr class="titulos">
								<th><s:text name="hc.campo.id" /></th>
								<th><s:text name="hc.campo.nombre" /></th>
								<th><s:text name="hc.campo.ape_pat" /></th>
								<th><s:text name="hc.campo.ape_mat" /></th>
								<th><s:text name="hc.campo.dni" /></th>
								<th><s:text name="hc.campo.edad" /></th>
								<th><s:text name="hc.campo.tipoSangre" /></th>
								<th><s:text name="hc.campo.estado" /></th>
							</tr>
						</thead>
						<s:iterator value="historias" status="status">
							<tr>
								<td><s:property value="id" /></td>
								<td><s:property value="nombrePaciente" /></td>
								<td><s:property value="apellidoPaternoPaciente" /></td>
								<td><s:property value="apellidoMaternoPaciente" /></td>
								<td><s:property value="dniPaciente" /></td>
								<td><s:property value="edadPaciente" /></td>
								<td><s:property value="tipoSangre.nombreTipoSangre" /></td>
								<td><s:if test="estado">
										<s:text name="hc.campo.estado.activo" />
									</s:if> <s:else>
										<s:text name="hc.campo.estado.desactivo" />
									</s:else></td>
								<td><s:url action="desactivarHC" id="desactivar">
										<s:param name="historiaclinica.id">
											<s:property value="id" />
										</s:param>
									</s:url> <s:a href="%{desactivar}">
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
