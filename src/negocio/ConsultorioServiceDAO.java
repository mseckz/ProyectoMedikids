package negocio;

import java.util.List;

import persistencia.mybatis.mapper.ConsultorioMapper;
import model.Consultorio;
import model.ConsultorioFiltro;
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

	@Override
	public List<Consultorio> obtenerConsultorios() throws Exception{
		ConsultorioMapper consultorioMapper = getSession().getMapper(ConsultorioMapper.class);
		return consultorioMapper.obtenerConsultorios();
	}

	@Override
	public Consultorio getConsultorio(Integer id) {
		ConsultorioMapper consultorioMapper = getSession().getMapper(ConsultorioMapper.class);
		return consultorioMapper.getConsultorio(id);
	}

	@Override
	public List<Horario> obtenerHorarios(Integer idConsultorio) {
		ConsultorioMapper consultorioMapper = getSession().getMapper(ConsultorioMapper.class);
		return consultorioMapper.obtenerHorarios(idConsultorio);
	}

	@Override
	public Horario validarHorario(Horario horario) {
		ConsultorioMapper consultorioMapper = getSession().getMapper(ConsultorioMapper.class);
		return consultorioMapper.validarHorario(horario);
	}

	@Override
	public void actualizar(Consultorio consultorio) {
		ConsultorioMapper consultorioMapper = getSession().getMapper(ConsultorioMapper.class);
		consultorioMapper.actualizar(consultorio);
		
	}

	@Override
	public void deshabilitarHorarios(List<Horario> listaHorarios) {
		ConsultorioMapper consultorioMapper = getSession().getMapper(ConsultorioMapper.class);
		consultorioMapper.deshabilitarHorarios(listaHorarios);
	}

	@Override
	public List<Consultorio> buscarConsultorio(ConsultorioFiltro filtro) {
		ConsultorioMapper consultorioMapper = getSession().getMapper(ConsultorioMapper.class);
		return consultorioMapper.buscarConsultorio(filtro);
	}
	
}
