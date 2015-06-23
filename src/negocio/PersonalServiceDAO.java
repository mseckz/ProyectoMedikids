package negocio;

import java.util.List;

import persistencia.mybatis.mapper.PersonalMapper;
import model.Personal;

public class PersonalServiceDAO extends MyBatisGenericDAO implements PersonalService {

	@Override
	public List<Personal> obtenerPersonalxTipo(Integer idTipo) {
		
		PersonalMapper personalMapper = getSession().getMapper(PersonalMapper.class);
		return personalMapper.obtenerPersonalxTipo(idTipo);
	}
	
}
