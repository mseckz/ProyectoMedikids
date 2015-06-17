package model;

import java.io.Serializable;

public class Horas implements Serializable {

	private static final long serialVersionUID = 1L;
		
	private Integer id;
	private String hora;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}
}
