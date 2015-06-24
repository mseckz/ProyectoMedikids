package negocio;

import java.util.List;

import persistencia.mybatis.mapper.ConsultorioMapper;
import model.Consultorio;
import model.Horario;

public class ConsultorioServiceDAO extends MyBatisGenericDAO implements ConsultorioService {

	@Override
	public void registrar(Consultorio consultorio) {
		
		ConsultorioMapper consultorioMapper = getSession().getMapper(ConsultorioMapper.class);
		consultorioMapper.registrar(consultorio);
	}

	@Override
	public void registrarHorario(List<Horario> listaHorarios) {
		ConsultorioMapper consultorioMapper = getSession().getMapper(ConsultorioMapper.class);
		consultorioMapper.registrarHorario(listaHorarios);
	}
	
}
