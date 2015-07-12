package negocio;

import java.util.List;

import model.Consulta;
import model.HistoriaClinica;

public interface ConsultaService {
	
	List<Consulta> obtenerConsultas(Integer idHistoria);
	void registrarConsulta(Consulta consulta);
	HistoriaClinica verHistoria(Integer idHistoriaClinica);
	Consulta detalleConsulta(Integer idConsulta);
}
