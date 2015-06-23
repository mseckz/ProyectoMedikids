package persistencia.mybatis.mapper;

import java.util.List;

import model.Especialidad;

public interface EspecialidadMapper {
	
	List<Especialidad> obtenerTodos();
}
