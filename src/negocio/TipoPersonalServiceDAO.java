package negocio;

import java.util.List;

import persistencia.mybatis.mapper.TipoPersonalMapper;
import model.TipoPersonal;


public class TipoPersonalServiceDAO extends MyBatisGenericDAO implements TipoPersonalService{

	@Override
	public List<TipoPersonal> getTodos() {
		// TODO Auto-generated method stub
		TipoPersonalMapper tipoPersonalMapper=getSession().getMapper(TipoPersonalMapper.class);
		List<TipoPersonal> tipoPersonal=tipoPersonalMapper.getTipoPersonal();
		
		return tipoPersonal;
	}



}
