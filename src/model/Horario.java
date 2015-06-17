package model;

import java.io.Serializable;

public class Horario implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Consultorio consultorio;
	private Dias dia;
	private Horas hora;
	private boolean estado;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Consultorio getConsultorio() {
		return consultorio;
	}
	public void setConsultorio(Consultorio consultorio) {
		this.consultorio = consultorio;
	}
	public Dias getDia() {
		return dia;
	}
	public void setDia(Dias dia) {
		this.dia = dia;
	}
	public Horas getHora() {
		return hora;
	}
	public void setHora(Horas hora) {
		this.hora = hora;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	
	
}
