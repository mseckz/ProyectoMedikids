package model;

import java.io.Serializable;

public class Personal implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String dni;
	private String nombres;
	private String apellidos;
	private String telefono;
	private String celular;
	private String correo;
	private TipoPersonal tipoPersonal;
	private String urlCV;
	private Integer idMedicoAsignado;
	private String fechaRegistro;
	private boolean estado;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
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
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getCelular() {
		return celular;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public TipoPersonal getTipoPersonal() {
		return tipoPersonal;
	}
	public void setTipoPersonal(TipoPersonal tipoPersonal) {
		this.tipoPersonal = tipoPersonal;
	}
	public String getUrlCV() {
		return urlCV;
	}
	public void setUrlCV(String urlCV) {
		this.urlCV = urlCV;
	}
	public Integer getIdMedicoAsignado() {
		return idMedicoAsignado;
	}
	public void setIdMedicoAsignado(Integer idMedicoAsignado) {
		this.idMedicoAsignado = idMedicoAsignado;
	}
	public String getFechaRegistro() {
		return fechaRegistro;
	}
	public void setFechaRegistro(String fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
}
