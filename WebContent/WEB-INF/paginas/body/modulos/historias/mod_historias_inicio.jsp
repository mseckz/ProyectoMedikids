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
				
				<jsp:include page="/WEB-INF/paginas/body/reutilizables/include_buscar_hc.jsp"></jsp:include>

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
	</div>
</div>
