package negocio;

import java.util.List;

import persistencia.mybatis.mapper.ConsultaMapper;
import model.Consulta;

public class ConsultaServiceDAO extends MyBatisGenericDAO implements ConsultaService {

	@Override
	public List<Consulta> obtenerConsultas(Integer idHistoria) {
		ConsultaMapper consultaMapper = getSession().getMapper(ConsultaMapper.class);
		return consultaMapper.obtenerConsultas(idHistoria);
	}
	
	
}
