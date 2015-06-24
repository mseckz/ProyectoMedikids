package persistencia.mybatis.mapper;

import java.util.List;

import model.Consultorio;
import model.Horario;

public interface ConsultorioMapper {
	
	void registrar(Consultorio consultorio);
	List<Consultorio> obtenerTodos();
	
	void registrarHorario(List<Horario> listaHorarios);
}
