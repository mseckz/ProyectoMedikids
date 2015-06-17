package model;

import java.io.Serializable;

public class HistoriaClinica implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String codigo;
	private String dniPaciente;
	private String nombrePaciente;
	private String apellidos;
	private String nombreCompleto;
	private String nombreApod;
	private String apellidosApod;
	private String direccion;
	private String telefono;
	private String fechaNacPaciente;
	private Integer edadPaciente;
	private boolean sexoPaciente;
	private TipoSangre tipoSangre;
	private String alergias;
	private String Antecedentes;
	private String observaciones;
	private String fechaRegistro; 
	private boolean estado;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getDniPaciente() {
		return dniPaciente;
	}
	public void setDniPaciente(String dniPaciente) {
		this.dniPaciente = dniPaciente;
	}
	public String getNombrePaciente() {
		return nombrePaciente;
	}
	public void setNombrePaciente(String nombrePaciente) {
		this.nombrePaciente = nombrePaciente;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getNombreCompleto() {
		return nombreCompleto;
	}
	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}
	public String getNombreApod() {
		return nombreApod;
	}
	public void setNombreApod(String nombreApod) {
		this.nombreApod = nombreApod;
	}
	public String getApellidosApod() {
		return apellidosApod;
	}
	public void setApellidosApod(String apellidosApod) {
		this.apellidosApod = apellidosApod;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getFechaNacPaciente() {
		return fechaNacPaciente;
	}
	public void setFechaNacPaciente(String fechaNacPaciente) {
		this.fechaNacPaciente = fechaNacPaciente;
	}
	public Integer getEdadPaciente() {
		return edadPaciente;
	}
	public void setEdadPaciente(Integer edadPaciente) {
		this.edadPaciente = edadPaciente;
	}
	public boolean isSexoPaciente() {
		return sexoPaciente;
	}
	public void setSexoPaciente(boolean sexoPaciente) {
		this.sexoPaciente = sexoPaciente;
	}
	public TipoSangre getTipoSangre() {
		return tipoSangre;
	}
	public void setTipoSangre(TipoSangre tipoSangre) {
		this.tipoSangre = tipoSangre;
	}
	public String getAlergias() {
		return alergias;
	}
	public void setAlergias(String alergias) {
		this.alergias = alergias;
	}
	public String getAntecedentes() {
		return Antecedentes;
	}
	public void setAntecedentes(String antecedentes) {
		Antecedentes = antecedentes;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
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
