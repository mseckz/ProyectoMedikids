package model;

import java.io.Serializable;

public class Rol implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer idRol;
	private String descripcion;
	
	
	public Integer getIdRol() {
		return idRol;
	}
	public void setIdRol(Integer idRol) {
		this.idRol = idRol;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
}
