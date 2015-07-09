package negocio;

import java.util.List;

import persistencia.mybatis.mapper.MedicoMapper;
import model.Medico;

public class MedicoServiceDAO extends MyBatisGenericDAO implements MedicoService {

	@Override
	public List<Medico> obtenerMedicos() {
		MedicoMapper medicoMapper = getSession().getMapper(MedicoMapper.class);
		return medicoMapper.obtenerMedicos();
	}
	
	@Override
	public List<Medico> getMedicos() {
		MedicoMapper medicoMapper = getSession().getMapper(MedicoMapper.class);
		return medicoMapper.getMedicos();
	}
}
