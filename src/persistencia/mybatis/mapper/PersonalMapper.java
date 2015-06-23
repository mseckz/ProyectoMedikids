package persistencia.mybatis.mapper;

import java.util.List;

import model.Personal;

public interface PersonalMapper {
	
	List<Personal> obtenerTodos();
	
	List<Personal> obtenerPersonalxTipo(Integer idTipo);
}
