package model;

import java.io.Serializable;

public class TipoSangre implements Serializable {

	private static final long serialVersionUID = 6107334007263891648L;
	
	private Integer id;
	private String nombreTipoSangre;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNombreTipoSangre() {
		return nombreTipoSangre;
	}
	public void setNombreTipoSangre(String nombreTipoSangre) {
		this.nombreTipoSangre = nombreTipoSangre;
	}
}
