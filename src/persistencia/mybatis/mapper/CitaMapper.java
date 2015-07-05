package persistencia.mybatis.mapper;

import java.util.List;

import model.Cita;

public interface CitaMapper {
	
	List<Cita> obtenerCitas();
	void registrarCita(Cita cita);
	String[] horasDisponibles(Integer idConsultorio);
}
