<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="modal fade" id="modalDetalle" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content-mod">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					Consulta de Paciente
				</h4>
			</div>
			<div class="modal-body row">
				<div class="col-md-12">
					<div class="col-md-6">
						<h4>Medico:</h4>
						<p id="nombreCompleto"></p>
					</div>
					<div class="col-md-6">
						<h4>Fecha de Registro</h4>
						<p id="fechaRegistro"></p>
					</div>
					<div class="col-md-12">
						<div>
							<h4>Motivo Consulta</h4>
							<p id="motivoConsulta" ></p>
						</div>
						<div>
							<h4>Sintomas</h4>
							<p id="sintomas"></p>
						</div>
						<div>
							<h4>Diagnostico</h4>
							<p id="diagnostico"></p>
						</div>
						<div>
							<h4>Observaciones</h4>
							<p id="obs"></p>
						</div>
					</div>
					
				</div>	
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Regresar</button>
	        </div>
		</div>
	</div>
</div>