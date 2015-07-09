package negocio;

import java.util.List;
import java.util.Map;

import model.Cita;
import model.CitaFiltro;

public interface CitaService {
	
	List<Cita> obtenerCitas();
	void registrarCita(Cita cita);
	List<String> horasDisponibles(Map<String, Object> datos);
	List<Cita> buscarCita(CitaFiltro citaFiltro); 
	Cita cargarCita(Integer id);
	void actualizarCita(Cita cita);
	void cancelarCita(Integer id);
	void generarConsulta(Integer id);
	
	List<Map<String, Object>> numeroHorasDisponiblesXFecha(Integer id); 
}
