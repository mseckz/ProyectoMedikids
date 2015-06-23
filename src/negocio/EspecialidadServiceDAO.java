package negocio;

import java.util.List;

import persistencia.mybatis.mapper.EspecialidadMapper;
import model.Especialidad;

public class EspecialidadServiceDAO extends MyBatisGenericDAO implements EspecialidadService {

	@Override
	public List<Especialidad> obtenerTodos() {

		EspecialidadMapper especialidadMapper = getSession().getMapper(EspecialidadMapper.class);
		
		return especialidadMapper.obtenerTodos();
	}

}
