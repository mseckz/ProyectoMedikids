package negocio;

import java.util.List;

import persistencia.mybatis.mapper.TurnoMapper;
import model.Turno;

public class TurnoServiceDAO extends MyBatisGenericDAO implements TurnoService {

	@Override
	public List<Turno> obtenerTurnos() {
		
		TurnoMapper turnoMapper = getSession().getMapper(TurnoMapper.class);
		
		return turnoMapper.obtenerTurnos();
	}

}
