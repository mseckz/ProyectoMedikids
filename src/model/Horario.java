package model;

import java.io.Serializable;

public class Horario implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Consultorio consultorio;
	private Dia dia;
	private Turno hora;
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
	public Dia getDia() {
		return dia;
	}
	public void setDia(Dia dia) {
		this.dia = dia;
	}
	public Turno getHora() {
		return hora;
	}
	public void setHora(Turno hora) {
		this.hora = hora;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	
	
}
