package model;

import java.io.Serializable;

public class Cita implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String codigo;
	private HistoriaClinica historiaClinica;
	private Personal personalRegistro;
	private String tipoReserva;
	private Consultorio consultorio;
	private String fechaRegistro;
	private String fechaAtencion;
	private Double monto;
	private Integer estadoCita;
	
	
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
	public HistoriaClinica getHistoriaClinica() {
		return historiaClinica;
	}
	public void setHistoriaClinica(HistoriaClinica historiaClinica) {
		this.historiaClinica = historiaClinica;
	}
	public Personal getPersonalRegistro() {
		return personalRegistro;
	}
	public void setPersonalRegistro(Personal personalRegistro) {
		this.personalRegistro = personalRegistro;
	}
	public String getTipoReserva() {
		return tipoReserva;
	}
	public void setTipoReserva(String tipoReserva) {
		this.tipoReserva = tipoReserva;
	}
	public Consultorio getConsultorio() {
		return consultorio;
	}
	public void setConsultorio(Consultorio consultorio) {
		this.consultorio = consultorio;
	}
	public String getFechaRegistro() {
		return fechaRegistro;
	}
	public void setFechaRegistro(String fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}
	public String getFechaAtencion() {
		return fechaAtencion;
	}
	public void setFechaAtencion(String fechaAtencion) {
		this.fechaAtencion = fechaAtencion;
	}
	public Double getMonto() {
		return monto;
	}
	public void setMonto(Double monto) {
		this.monto = monto;
	}
	public Integer getEstadoCita() {
		return estadoCita;
	}
	public void setEstadoCita(Integer estadoCita) {
		this.estadoCita = estadoCita;
	}
	
	
}
