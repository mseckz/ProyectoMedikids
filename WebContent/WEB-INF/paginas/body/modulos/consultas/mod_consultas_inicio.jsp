<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Modulo de Gestión de Consultas</h1>
			</div>
		</div>
	<div class="col-lg-12" id="divRegistrar">
		<h2> Consultas </h2><hr>
		<s:actionmessage />
			<s:form theme="bootstrap" action="agregarPersonal" namespace="/personal" cssClass="form-horizontal" method="post" enctype="multipart/form-data">
				<%-- <div class="row">
					<div class="col-md-5">
						<s:textfield name="personal.dni" key="Dni" cssClass="form-control"  placeholder="47765562"></s:textfield>
						<s:textfield name="personal.nombres" key="Nombres" cssClass="form-control"  placeholder="Nombres"></s:textfield>
						<s:textfield name="personal.apellidos" key="Apellidos" cssClass="form-control"  placeholder="Apellidos"></s:textfield>
					</div>
					
					<div class="col-md-4">
						<s:submit value="Buscar Historia" cssClass="btn btn-default"></s:submit>
					</div>
				</div> --%>
				<div class="row">
					<div class="col-md-5">
						<s:select list="consultorios" name="idConsultorio" listValue="codigo" listKey="id" 
							headerKey="-1" headerValue="Seleccione Consultorio" id="cboConsultorio"
							onchange="loadColaCitas()"/>
					</div>
				</div>
			</s:form>
			<hr>
		<table class="table table-bordered table-hover table-striped" id="tblCitas">
		<thead>
			<tr>
				<th>Codigo Cita</th>
				<th>Fecha Atencion</th>
				<th>Hora Atencion</th>
				<th>Paciente</th>
				<th>Consulta</th>
			</tr>
		</thead>
		<tbody>
		<%-- <s:iterator value="citasPorConsultorio" status="status">
			<tr>
				<td><s:property value="codigo" /></td>
				<td><s:property value="fechaAtencion" /></td>
				<td><s:property value="horaAtencion" /></td>
				<td><s:property value="%{historiaClinica.nombreCompletoPaciente()}" /> Degui</td>
				<td><a>ver HC</a></td>
			</tr>
		</s:iterator> --%>
		</tbody>
		</table>
		<div id="mensaje">
		</div>
	</div>
</div>

</div>
<script src="<s:url value="/externo/js/consultas.js" />"></script>
<script>
</script>