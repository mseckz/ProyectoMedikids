package negocio;

import java.util.List;

import model.Consulta;

public interface ConsultaService {
	
	List<Consulta> obtenerConsultas(Integer idHistoria);
}
