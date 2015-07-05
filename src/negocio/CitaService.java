package negocio;

import java.util.List;

import model.Cita;

public interface CitaService {
	
	List<Cita> obtenerCitas();
	void registrarCita(Cita cita);
}
