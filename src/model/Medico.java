package model;

public class Medico extends Personal{

	private static final long serialVersionUID = 1L;
	
	private String cmp;
	private Especialidad especialidad;
	
	public String getCmp() {
		return cmp;
	}
	public void setCmp(String cmp) {
		this.cmp = cmp;
	}
	public Especialidad getEspecialidad() {
		return especialidad;
	}
	public void setEspecialidad(Especialidad especialidad) {
		this.especialidad = especialidad;
	}
	
	
}
