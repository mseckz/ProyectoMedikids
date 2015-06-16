package model;

import java.io.Serializable;

public class Usuario implements Serializable{
	
	private static final long serialVersionUID = 2388130697698086449L;
	
	private String cuenta;
	private String contrasena;
	
	public String getCuenta() {
		return cuenta;
	}
	public void setCuenta(String cuenta) {
		this.cuenta = cuenta;
	}
	public String getContrasena() {
		return contrasena;
	}
	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}
	@Override
	public String toString() {
		return "Usuario [cuenta=" + cuenta + ", contrasena=" + contrasena + "]";
	}
	
	
	
}
