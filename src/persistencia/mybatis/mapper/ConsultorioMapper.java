package persistencia.mybatis.mapper;

import java.util.List;

import model.Consultorio;

public interface ConsultorioMapper {
	
	void registrar(Consultorio consultorio);
	List<Consultorio> obtenerTodos();
}
