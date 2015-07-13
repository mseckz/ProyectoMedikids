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
	void citaAtendida(Integer id);
	String obtenerUltimoCodigo();
	
	/**
	 * Parametros idConsultorio, fecha
	 * @return
	 */
	List<String> horasDisponibles(Map<String, Object> datos);
	
	List<Map<String, Object>> numeroHorasDisponiblesXFecha(Integer id); 
	
	/**
	 * Devuelve citas en cola de consultorio y turno
	 * @param datosCita Mapa con parametros "idConsultorio" y "idMedico"
	 * @return
	 */
	List<Cita> colaCitas(Map<String, Object> datosCita);
	
	String nombreMedico(Map<String, Object> datosBuscarMedico);
}