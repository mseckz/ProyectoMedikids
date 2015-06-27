package persistencia.mybatis.mapper;

import java.util.List;

import model.Consultorio;
import model.Horario;

public interface ConsultorioMapper {
	
	Consultorio getConsultorio(Integer id);
	void registrar(Consultorio consultorio);
	List<Consultorio> obtenerConsultorios();
	
	void registrarHorario(List<Horario> listaHorarios);
	List<Horario> obtenerHorarios(Integer idConsultorio);
	Horario validarHorario(Horario horario);
}
