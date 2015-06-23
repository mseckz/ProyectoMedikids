package model;

public class Asistente extends Personal {
	
	private static final long serialVersionUID = 1L;
	
	private Medico medicoAsignado;

	public Medico getMedicoAsignado() {
		return medicoAsignado;
	}

	public void setMedicoAsignado(Medico medicoAsignado) {
		this.medicoAsignado = medicoAsignado;
	}
	
	

}
