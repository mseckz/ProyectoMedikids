package model;

import java.io.Serializable;

public class HistoriaClinica implements Serializable{
		
	/**
	 * 
	 */
	private static final long serialVersionUID = -1498808806666021178L;
	
	private Integer id;//id_hc int identity(1,1) PRIMARY KEY,
	private String codigo;//cod_hc varchar(10) not null,
	private String nombrePaciente;//nom_paciente varchar(60) not null,
	private String apellidoPaternoPaciente;//apellido_paterno_paciente varchar(80) not null,
	private String apellidoMaternoPaciente;//apellido_materno_paciente varchar(80) not null,
	private String dniPaciente;//dni_paciente char(8) not null,
	private Integer edadPaciente;//edad int not null,
	private boolean sexoPaciente;//sexo bit not null,
	private String direccionPaciente;//direccion_paciente varchar(150) not null,
	private String fechaNacPaciente;//fecha_nac_paciente date not null,
	private String observaciones;//observ varchar(200),
	private String nombrePadre;//nom_padre varchar(60) not null,
	private String apellidoPaternoPadre;//apellido_paterno_padre varchar(80) not null,
	private String apellidoMaternoPadre;//apellido_materno_padre varchar(80) not null,
	private String dniPadre;//dni_padre char(8) not null,
	private String telefonoPadre;//telefono_padre varchar(11),
	private String correoPadre;//correo_padre varchar(100),
	private String direccionPadre;//direccion_padre varchar(150) not null,
	private String nombreMadre;//nom_madre varchar(60) not null,
	private String apellidoPaternoMadre;//apellido_paterno_madre varchar(80) not null,
	private String apellidoMaternoMadre;//apellido_materno_madre varchar(80) not null,
	private String dniMadre;//dni_madre char(8) not null,
	private String telefonoMadre;//telefono_madre varchar(11),
	private String correoMadre;//correo_madre varchar(100),
	private String direccionMadre;//direccion_madre varchar(150) not null,
	private String nombreApoderado;//nom_apoderado varchar(60) not null,
	private String apellidoPaternoApoderado;//apellido_paterno_apoderado varchar(80) not null,
	private String apellidoMaternoApoderado;//apellido_materno_apoderado varchar(80) not null,
	private String dniApoderado;//dni_apoderado char(8) not null,
	private String telefonoApoderado;//telefono_apoderado varchar(11),
	private String correoApoderado;//correo_apoderado varchar(100),
	private String direccionApoderado;//direccion_apoderado varchar(150) not null,,
	private TipoSangre tipoSangre;//id_tipo_sangre int not null,
	private String alergias;//alergias varchar(200),
	private String Antecedentes;//ant_hereditarios varchar(200),
	private String fechaRegistro;//fecha_registro datetime default GETDATE(),
	private boolean estado;//estado bit default 1,
	/*private String fotoPaciente;
	private String fotoPadre;
	private String fotoMadre;
	private String fotoApoderado;*/
	
	
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
	public String getDireccionPaciente() {
		return direccionPaciente;
	}
	public void setDireccionPaciente(String direccionPaciente) {
		this.direccionPaciente = direccionPaciente;
	}
	public String getFechaNacPaciente() {
		return fechaNacPaciente;
	}
	public void setFechaNacPaciente(String fechaNacPaciente) {
		this.fechaNacPaciente = fechaNacPaciente;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public String getNombrePadre() {
		return nombrePadre;
	}
	public void setNombrePadre(String nombrePadre) {
		this.nombrePadre = nombrePadre;
	}
	public String getApellidoPaternoPadre() {
		return apellidoPaternoPadre;
	}
	public void setApellidoPaternoPadre(String apellidoPaternoPadre) {
		this.apellidoPaternoPadre = apellidoPaternoPadre;
	}
	public String getApellidoMaternoPadre() {
		return apellidoMaternoPadre;
	}
	public void setApellidoMaternoPadre(String apellidoMaternoPadre) {
		this.apellidoMaternoPadre = apellidoMaternoPadre;
	}
	public String getDniPadre() {
		return dniPadre;
	}
	public void setDniPadre(String dniPadre) {
		this.dniPadre = dniPadre;
	}
	public String getTelefonoPadre() {
		return telefonoPadre;
	}
	public void setTelefonoPadre(String telefonoPadre) {
		this.telefonoPadre = telefonoPadre;
	}
	public String getCorreoPadre() {
		return correoPadre;
	}
	public void setCorreoPadre(String correoPadre) {
		this.correoPadre = correoPadre;
	}
	public String getDireccionPadre() {
		return direccionPadre;
	}
	public void setDireccionPadre(String direccionPadre) {
		this.direccionPadre = direccionPadre;
	}
	public String getNombreMadre() {
		return nombreMadre;
	}
	public void setNombreMadre(String nombreMadre) {
		this.nombreMadre = nombreMadre;
	}
	public String getApellidoPaternoMadre() {
		return apellidoPaternoMadre;
	}
	public void setApellidoPaternoMadre(String apellidoPaternoMadre) {
		this.apellidoPaternoMadre = apellidoPaternoMadre;
	}
	public String getApellidoMaternoMadre() {
		return apellidoMaternoMadre;
	}
	public void setApellidoMaternoMadre(String apellidoMaternoMadre) {
		this.apellidoMaternoMadre = apellidoMaternoMadre;
	}
	public String getDniMadre() {
		return dniMadre;
	}
	public void setDniMadre(String dniMadre) {
		this.dniMadre = dniMadre;
	}
	public String getTelefonoMadre() {
		return telefonoMadre;
	}
	public void setTelefonoMadre(String telefonoMadre) {
		this.telefonoMadre = telefonoMadre;
	}
	public String getCorreoMadre() {
		return correoMadre;
	}
	public void setCorreoMadre(String correoMadre) {
		this.correoMadre = correoMadre;
	}
	public String getDireccionMadre() {
		return direccionMadre;
	}
	public void setDireccionMadre(String direccionMadre) {
		this.direccionMadre = direccionMadre;
	}
	public String getNombreApoderado() {
		return nombreApoderado;
	}
	public void setNombreApoderado(String nombreApoderado) {
		this.nombreApoderado = nombreApoderado;
	}
	public String getApellidoPaternoApoderado() {
		return apellidoPaternoApoderado;
	}
	public void setApellidoPaternoApoderado(String apellidoPaternoApoderado) {
		this.apellidoPaternoApoderado = apellidoPaternoApoderado;
	}
	public String getApellidoMaternoApoderado() {
		return apellidoMaternoApoderado;
	}
	public void setApellidoMaternoApoderado(String apellidoMaternoApoderado) {
		this.apellidoMaternoApoderado = apellidoMaternoApoderado;
	}
	public String getDniApoderado() {
		return dniApoderado;
	}
	public void setDniApoderado(String dniApoderado) {
		this.dniApoderado = dniApoderado;
	}
	public String getTelefonoApoderado() {
		return telefonoApoderado;
	}
	public void setTelefonoApoderado(String telefonoApoderado) {
		this.telefonoApoderado = telefonoApoderado;
	}
	public String getCorreoApoderado() {
		return correoApoderado;
	}
	public void setCorreoApoderado(String correoApoderado) {
		this.correoApoderado = correoApoderado;
	}
	public String getDireccionApoderado() {
		return direccionApoderado;
	}
	public void setDireccionApoderado(String direccionApoderado) {
		this.direccionApoderado = direccionApoderado;
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
	/*public String getFotoPaciente() {
		return fotoPaciente;
	}
	public void setFotoPaciente(String fotoPaciente) {
		this.fotoPaciente = fotoPaciente;
	}
	public String getFotoPadre() {
		return fotoPadre;
	}
	public void setFotoPadre(String fotoPadre) {
		this.fotoPadre = fotoPadre;
	}
	public String getFotoMadre() {
		return fotoMadre;
	}
	public void setFotoMadre(String fotoMadre) {
		this.fotoMadre = fotoMadre;
	}
	public String getFotoApoderado() {
		return fotoApoderado;
	}
	public void setFotoApoderado(String fotoApoderado) {
		this.fotoApoderado = fotoApoderado;
	}*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


}
