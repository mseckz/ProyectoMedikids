package negocio;

import java.util.List;

import model.Asistente;
import model.BuscarPersonalUsuarioFiltro;
import model.Medico;
import model.Personal;
import model.TipoPersonal;
import persistencia.mybatis.mapper.PersonalMapper;

public class PersonalServiceDAO extends MyBatisGenericDAO implements PersonalService {

	@Override
	public List<Personal> obtenerPersonalxTipo(Integer idTipo) {
		
		PersonalMapper personalMapper = getSession().getMapper(PersonalMapper.class);
		return personalMapper.obtenerPersonalxTipo(idTipo);
	}
	
	@Override
	public List<Personal> buscarPersonalUsuarios(
			BuscarPersonalUsuarioFiltro persoUsuFiltro) {
		// TODO Auto-generated method stub
		
		BuscarPersonalUsuarioFiltro hcfiltro1 = new BuscarPersonalUsuarioFiltro();
		String valor1=null;
		String valor2=null;
		String valor3=null;
		if (!persoUsuFiltro.getNombres().isEmpty()) {
			valor1=persoUsuFiltro.getNombres()+"%";
		}
		if (!persoUsuFiltro.getApellidos().isEmpty()) {
			valor2=persoUsuFiltro.getApellidos()+"%";
		}
		if (!persoUsuFiltro.getDni().isEmpty()) {
			valor3=persoUsuFiltro.getDni();
		}
		
		hcfiltro1.setNombres(valor1);
		hcfiltro1.setApellidos(valor2);
		hcfiltro1.setDni(valor3);
		
		
		PersonalMapper personalMapper = getSession().getMapper(PersonalMapper.class);
		return personalMapper.buscarPersonalUsuarios(hcfiltro1);
	}

	@Override
	public Personal getPersonal(Integer id) {
		// TODO Auto-generated method stub
		PersonalMapper mapper = getSession().getMapper(PersonalMapper.class);
		return mapper.getPersonal(id);
	}
	
	@Override
	public Personal obtenerPersonalId(Integer id) {
		// TODO Auto-generated method stub
		PersonalMapper mapper = getSession().getMapper(PersonalMapper.class);
		return mapper.obtenerPersonalId(id);
	}
	
	@Override
	public void registrar(Personal personal) {
		// TODO Auto-generated method stub
		PersonalMapper personalMapper = getSession().getMapper(PersonalMapper.class);
		personalMapper.registrar(personal);
	}

	@Override
	public void editar(Personal personal) {
		// TODO Auto-generated method stub
		PersonalMapper personalMapper = getSession().getMapper(PersonalMapper.class);
		personalMapper.editar(personal);

	}

	@Override
	public void eliminar(Integer id) {
		// TODO Auto-generated method stub
		PersonalMapper personalMapper = getSession().getMapper(PersonalMapper.class);
		personalMapper.eliminar(id);
	}

	@Override
	public Personal obtenerDetalle(Integer id) {
		// TODO Auto-generated method stub
		PersonalMapper personalMapper = getSession().getMapper(PersonalMapper.class);
		personalMapper.getPersonal(id);
		return null;
	}

	@Override
	public List<Personal> buscarPersonal(Personal personal) {
		// TODO Auto-generated method stub
		PersonalMapper personalMapper = getSession().getMapper(PersonalMapper.class);
		List<Personal> personals= personalMapper.buscarPersonal(personal);
		return personals;
	}
	@Override
	public List<TipoPersonal> getTipoPersonal() {
		// TODO Auto-generated method stub
		PersonalMapper personalMapper = getSession().getMapper(PersonalMapper.class);
		List<TipoPersonal> tipopersonals= personalMapper.getTipoPersonal();
		return tipopersonals;
	}

	@Override
	public void deshabilitarPersonal(Personal personal) {
		// TODO Auto-generated method stub
		PersonalMapper personalMapper = getSession().getMapper(PersonalMapper.class);
		personalMapper.deshabilitarPersonal(personal);
	}

	@Override
	public void registrarMedico(Medico medico) {
		// TODO Auto-generated method stub
		PersonalMapper personalMapper = getSession().getMapper(PersonalMapper.class);
		personalMapper.registrarMedico(medico);
	}

	@Override
	public void registrarAsistente(Asistente asistente) {
		// TODO Auto-generated method stub
		PersonalMapper personalMapper = getSession().getMapper(PersonalMapper.class);
		personalMapper.registrarAsistente(asistente);
	}
}
