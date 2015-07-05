package negocio;

import java.util.List;
import java.util.Map;

import model.Cita;

public interface CitaService {
	
	List<Cita> obtenerCitas();
	void registrarCita(Cita cita);
	List<String> horasDisponibles(Map<String, Object> datos); 
}
