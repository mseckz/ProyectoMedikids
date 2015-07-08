package model;

import java.io.Serializable;

public class CitaFiltro implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String dni;
	private String nombre;
	private String codigoCita;
	
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getCodigoCita() {
		return codigoCita;
	}
	public void setCodigoCita(String codigoCita) {
		this.codigoCita = codigoCita;
	}
	
}
