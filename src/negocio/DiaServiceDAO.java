package negocio;

import java.util.List;

import persistencia.mybatis.mapper.DiaMapper;
import model.Dia;

public class DiaServiceDAO extends MyBatisGenericDAO implements DiaService {

	@Override
	public List<Dia> obtenerDias() {
		
		DiaMapper diaMapper = getSession().getMapper(DiaMapper.class);
		
		return diaMapper.obtenerDias();
	}

}
