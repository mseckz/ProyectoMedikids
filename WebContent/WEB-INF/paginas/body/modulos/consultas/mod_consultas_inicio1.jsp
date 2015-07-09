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
			<s:form theme="bootstrap" action="agregarPersonal" namespace="/personal" cssClass="form-horizontal" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-5">
						<s:textfield name="personal.dni" key="Dni" cssClass="form-control"  placeholder="47765562"></s:textfield>
						<s:textfield name="personal.nombres" key="Nombres" cssClass="form-control"  placeholder="Nombres"></s:textfield>
						<s:textfield name="personal.apellidos" key="Apellidos" cssClass="form-control"  placeholder="Apellidos"></s:textfield>
					</div>
					
					<div class="col-md-4">
						<s:submit value="Buscar Historia" cssClass="btn btn-default"></s:submit>
					</div>
				</div>
			</s:form>
			<hr>
		<table class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th>Codigo HC</th>
				<th>Dni</th>
				<th>Nombre</th>
				<th>Apellidos</th>
				<th>Ver Historia</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>HC1111</td>
				<td>4663352</td>
				<td>Degui</td>
				<td>Degui Degui</td>
				<td><a>ver HC</a></td>
			</tr>
			<tr>
				<td>HC1111</td>
				<td>4663352</td>
				<td>Degui</td>
				<td>Degui Degui</td>
				<td><a>ver HC</a></td>
			</tr>
			<tr>
				<td>HC1111</td>
				<td>4663352</td>
				<td>Degui</td>
				<td>Degui Degui</td>
				<td><a>ver HC</a></td>
			</tr>
			<tr>
				<td>HC1111</td>
				<td>4663352</td>
				<td>Degui</td>
				<td>Degui Degui</td>
				<td><a>ver HC</a></td>
			</tr>
			<tr>
				<td>HC1111</td>
				<td>4663352</td>
				<td>Degui</td>
				<td>Degui Degui</td>
				<td><a>ver HC</a></td>
			</tr>
			<tr>
				<td>HC1111</td>
				<td>4663352</td>
				<td>Degui</td>
				<td>Degui Degui</td>
				<td><a>ver HC</a></td>
			</tr>
		</tbody>
		</table>
		</div>
	</div>

</div>