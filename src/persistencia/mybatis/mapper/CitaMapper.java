package persistencia.mybatis.mapper;

import java.util.List;
import java.util.Map;

import model.Cita;

public interface CitaMapper {
	
	List<Cita> obtenerCitas();
	void registrarCita(Cita cita);
	
	/**
	 * Parametros idConsultorio, fecha
	 * @return
	 */
	List<String> horasDisponibles(Map<String, Object> datos);
	
}