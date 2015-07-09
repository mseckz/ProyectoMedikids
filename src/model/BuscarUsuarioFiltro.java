package model;

import java.io.Serializable;

public class BuscarUsuarioFiltro implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7085190822665685854L;
	
	private String nombreUsuario;
	private String nombres;
	private String apellidos;
	private String dni;
	private Rol rol;
	
	public String getNombreUsuario() {
		return nombreUsuario;
	}
	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public Rol getRol() {
		return rol;
	}
	public void setRol(Rol rol) {
		this.rol = rol;
	}
	
	
	
	

}
