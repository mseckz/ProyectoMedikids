package negocio;

import java.util.List;
import persistencia.mybatis.mapper.TipoSangreMapper;

import model.TipoSangre;

public class TipoSangreServiceDAO extends MyBatisGenericDAO implements TipoSangreService{

	@Override
	public List<TipoSangre> getTodos() throws Exception {
		// TODO Auto-generated method stub
		
		TipoSangreMapper tipoSangreMapper=getSession().getMapper(TipoSangreMapper.class);
		List<TipoSangre> tipoSangre=tipoSangreMapper.getTipoSangres();
		
		return tipoSangre;
	}

}
