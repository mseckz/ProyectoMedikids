package persistencia.mybatis.mapper;

import java.util.List;
import java.util.Map;

import model.Cita;
import model.CitaFiltro;

public interface CitaMapper {
	
	List<Cita> obtenerCitas();
	void registrarCita(Cita cita);
	Cita cargarCita(Integer id);
	List<Cita> buscarCita(CitaFiltro citaFiltro);
	void actualizarCita(Cita cita);
	void cancelarCita(Integer id);
	void generarConsulta(Integer id);
	
	/**
	 * Parametros idConsultorio, fecha
	 * @return
	 */
	List<String> horasDisponibles(Map<String, Object> datos);
	
	List<Map<String, Object>> numeroHorasDisponiblesXFecha(Integer id); 
	
}