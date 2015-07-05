package negocio;

import java.util.List;

import persistencia.mybatis.mapper.CitaMapper;
import model.Cita;

public class CitaServiceDAO extends MyBatisGenericDAO implements CitaService{

	@Override
	public List<Cita> obtenerCitas() {
		CitaMapper citaMapper = getSession().getMapper(CitaMapper.class);
		return citaMapper.obtenerCitas();
	}

	@Override
	public void registrarCita(Cita cita) {
		CitaMapper citaMapper = getSession().getMapper(CitaMapper.class);
		citaMapper.registrarCita(cita);
		
	}
	
	
}