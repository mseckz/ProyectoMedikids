<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Modulo de Gestión de Consultas</h1>
			</div>
		</div>
	</div>
	<h2> Consultas del dia Medico: Nombre</h2><hr>

	<div class="row" >
	<div class="col-lg-4">
		<table class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th>Consultas del Paciente</th>
				<th>Ver Consulta</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Specialidad: Pediatria Dia:22/05/2015</td>
				<td><a>ver Consulta</a></td>
			</tr>
			<tr>
				<td>Specialidad: Pediatria Dia:22/05/2015</td>
				<td><a>ver Consulta</a></td>
			</tr>
			<tr>
				<td>Specialidad: Pediatria Dia:22/05/2015</td>
				<td><a>ver Consulta</a></td>
			</tr>
			<tr>
				<td>Specialidad: Pediatria Dia:22/05/2015</td>
				<td><a>ver Consulta</a></td>
			</tr>
			<tr>
				<td>Specialidad: Pediatria Dia:22/05/2015</td>
				<td><a>ver Consulta</a></td>
			</tr>
			<tr>
				<td>Specialidad: Pediatria Dia:22/05/2015</td>
				<td><a>ver Consulta</a></td>
			</tr>
		</tbody>
		</table>
	</div>
	<div class="col-lg-1">
		<s:submit value="Grabar Consulta" cssClass="btn btn-default"></s:submit>
	</div>
	<div class="col-lg-6 table-bordered">
		<table class="table table-bordered table-hover table-striped">

		<tr>
			
				<form action="">
				<h3>Motivo de la Consulta</h3>
					<textarea class="form-control" rows="2"></textarea><hr>
					<label>Sintomas</label>
					<textarea class="form-control" rows="3"></textarea><hr>
					<label >Diagnostico</label>
					<textarea class="form-control" rows="3"></textarea><hr>
					<label>Receta Medica</label>
					<textarea class="form-control" rows="3"></textarea><hr>
					<label class="">Observaciones</label>
					<textarea class="form-control" rows="3"></textarea>
				</form>
			
		</tr>
		</table>
	</div>
	</div>
</div>