package model;

import java.io.Serializable;
import java.util.Date;

public class Cita implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String codigo;
	private HistoriaClinica historiaClinica;
	private Personal personalRegistro;
	private TipoReserva tipoReserva;
	private Consultorio consultorio;
	private Date fechaRegistro;
	private Date fechaAtencion;
	private String horaAtencion;
	private String text;
	private Double monto;
	private EstadoCitas estadoCita;
	
	
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
	public TipoReserva getTipoReserva() {
		return tipoReserva;
	}
	public void setTipoReserva(TipoReserva tipoReserva) {
		this.tipoReserva = tipoReserva;
	}
	public Consultorio getConsultorio() {
		return consultorio;
	}
	public void setConsultorio(Consultorio consultorio) {
		this.consultorio = consultorio;
	}
	public Date getFechaRegistro() {
		return fechaRegistro;
	}
	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}
	public Date getFechaAtencion() {
		return fechaAtencion;
	}
	public void setFechaAtencion(Date fechaAtencion) {
		this.fechaAtencion = fechaAtencion;
	}
	public String getHoraAtencion() {
		return horaAtencion;
	}
	public void setHoraAtencion(String horaAtencion) {
		this.horaAtencion = horaAtencion;
	}
	public Double getMonto() {
		return monto;
	}
	public void setMonto(Double monto) {
		this.monto = monto;
	}
	public EstadoCitas getEstadoCita() {
		return estadoCita;
	}
	public void setEstadoCita(EstadoCitas estadoCita) {
		this.estadoCita = estadoCita;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public String getNombreEstadoCita(){
		if(getEstadoCita() == EstadoCitas.RESERVA){
			return "RESERVA";
		}
		if(getEstadoCita() == EstadoCitas.PAGADA){
			return "PAGADA";
		}
		return null;
	}
}
