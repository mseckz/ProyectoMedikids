package model;

public class BuscarHCFiltro {

	private String nombrePaciente;//nom_paciente varchar(60) not null,
	private String apellidoPaternoPaciente;//apellido_paterno_paciente varchar(80) not null,
	private String apellidoMaternoPaciente;//apellido_materno_paciente varchar(80) not null,
	private String dniPaciente;//dni_paciente char(8) not null,
	
	public String getNombrePaciente() {
		return nombrePaciente;
	}
	public void setNombrePaciente(String nombrePaciente) {
		this.nombrePaciente = nombrePaciente;
	}
	public String getApellidoPaternoPaciente() {
		return apellidoPaternoPaciente;
	}
	public void setApellidoPaternoPaciente(String apellidoPaternoPaciente) {
		this.apellidoPaternoPaciente = apellidoPaternoPaciente;
	}
	public String getApellidoMaternoPaciente() {
		return apellidoMaternoPaciente;
	}
	public void setApellidoMaternoPaciente(String apellidoMaternoPaciente) {
		this.apellidoMaternoPaciente = apellidoMaternoPaciente;
	}
	public String getDniPaciente() {
		return dniPaciente;
	}
	public void setDniPaciente(String dniPaciente) {
		this.dniPaciente = dniPaciente;
	}
	
	
	
}
