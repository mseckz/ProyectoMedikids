package persistencia.mybatis.mapper;

import java.util.List;

import model.Consulta;
import model.HistoriaClinica;

public interface ConsultaMapper {
	
	List<Consulta> obtenerConsultas();
	
	void registrarConsulta(Consulta consulta);
	
	HistoriaClinica verHistoria(Integer idHistoriaClinica);
}
