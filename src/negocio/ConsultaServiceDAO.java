package negocio;

import java.util.List;

import persistencia.mybatis.mapper.ConsultaMapper;
import model.Consulta;
import model.HistoriaClinica;

public class ConsultaServiceDAO extends MyBatisGenericDAO implements ConsultaService {

	@Override
	public List<Consulta> obtenerConsultas(Integer idHistoria) {
		ConsultaMapper consultaMapper = getSession().getMapper(ConsultaMapper.class);
		return consultaMapper.obtenerConsultas(idHistoria);
	}

	@Override
	public void registrarConsulta(Consulta consulta) {
		ConsultaMapper consultaMapper = getSession().getMapper(ConsultaMapper.class);
		consultaMapper.registrarConsulta(consulta);
	}

	@Override
	public HistoriaClinica verHistoria(Integer idHistoriaClinica) {
		ConsultaMapper consultaMapper = getSession().getMapper(ConsultaMapper.class);
		return consultaMapper.verHistoria(idHistoriaClinica);
	}

	@Override
	public Consulta detalleConsulta(Integer idConsulta) {
		ConsultaMapper consultaMapper = getSession().getMapper(ConsultaMapper.class);
		return consultaMapper.detalleConsulta(idConsulta);
	}
	
	
}
