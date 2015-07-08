<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="modal fade" id="modalGenerarConsulta" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content-mod">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					Cancelar Cita
				</h4>
			</div>
			<div class="modal-body row">
				<div class="col-md-6">
					<div>
						<h4>Codigo Cita</h4>
						<p id="codigoCitaGC"></p>
					</div>
					<div>
						<h4>Fecha de Atencion</h4>
						<p id="fechaAtencionGC"></p>
					</div>
					<div>
						<h4>Hora de Atencion</h4>
						<p id="horaAtencionGC" ></p>
					</div>
				</div>
				<div class="col-md-6">
					<div>
						<h4>Nombre de Paciente</h4>
						<p id="nombrePacienteGC"></p>
					</div>
					<div>
						<h4>DNI Paciente</h4>
						<p id="dniPacienteGC"></p>
					</div>
					<div>
						<h4>Monto</h4>
						<p id="montoGC"></p>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<s:form action="generarConsulta" method="POST" id="formGenerarConsulta">
					<s:hidden name="cita.id" id="idGenerarConsulta"/>
					<button type="button" class="btn btn-default" data-dismiss="modal">Regresar</button>
                	<button type="submit" class="btn btn-success" >Generar Consulta</button>
				</s:form>
	        </div>
		</div>
	</div>
</div>