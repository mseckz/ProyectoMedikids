package negocio;

import java.util.List;

import model.Personal;

public interface PersonalService {
	
	public List<Personal> obtenerPersonalxTipo(Integer idTipo);

}
