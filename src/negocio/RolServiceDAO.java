package negocio;

import java.util.List;

import persistencia.mybatis.mapper.RolMapper;
import model.Rol;

public class RolServiceDAO extends MyBatisGenericDAO implements RolService {

	@Override
	public List<Rol> getTodos() {
		// TODO Auto-generated method stub
		RolMapper rolMapper = getSession().getMapper(RolMapper.class);
		List<Rol> rol=rolMapper.getRoles();
		
		return rol;
	}

}
