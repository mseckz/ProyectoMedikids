package negocio;

import java.util.List;
import java.util.Map;

import model.Cita;
import model.CitaFiltro;
import persistencia.mybatis.mapper.CitaMapper;

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

	@Override
	public List<String> horasDisponibles(Map<String, Object> datos) {
		CitaMapper citaMapper = getSession().getMapper(CitaMapper.class);
		return citaMapper.horasDisponibles(datos);
	}

	@Override
	public List<Cita> buscarCita(CitaFiltro citaFiltro) {
		CitaMapper citaMapper = getSession().getMapper(CitaMapper.class);
		return citaMapper.buscarCita(citaFiltro);
	}

	@Override
	public Cita cargarCita(Integer id) {
		CitaMapper citaMapper = getSession().getMapper(CitaMapper.class);
		return citaMapper.cargarCita(id);
	}

	@Override
	public void actualizarCita(Cita cita) {
		CitaMapper citaMapper = getSession().getMapper(CitaMapper.class);
		citaMapper.actualizarCita(cita);
		
	}

	@Override
	public void cancelarCita(Integer id) {
		CitaMapper citaMapper = getSession().getMapper(CitaMapper.class);
		citaMapper.cancelarCita(id);
	}

	@Override
	public void generarConsulta(Integer id) {
		CitaMapper citaMapper = getSession().getMapper(CitaMapper.class);
		citaMapper.generarConsulta(id);
	}

	@Override
	public List<Map<String, Object>> numeroHorasDisponiblesXFecha(Integer id) {
		CitaMapper citaMapper = getSession().getMapper(CitaMapper.class);
		return citaMapper.numeroHorasDisponiblesXFecha(id);
	}

	@Override
	public String obtenerUltimoCodigo() {
		CitaMapper citaMapper = getSession().getMapper(CitaMapper.class);
		return citaMapper.obtenerUltimoCodigo();
	}
	
	
}
