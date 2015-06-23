package negocio;

import persistencia.mybatis.mapper.ConsultorioMapper;
import model.Consultorio;

public class ConsultorioServiceDAO extends MyBatisGenericDAO implements ConsultorioService {

	@Override
	public void registrar(Consultorio consultorio) {
		
		ConsultorioMapper consultorioMapper = getSession().getMapper(ConsultorioMapper.class);
		consultorioMapper.registrar(consultorio);
	}
	
}
