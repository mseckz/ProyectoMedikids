package persistencia.mybatis.mapper;

import java.util.List;

import model.Asistente;
import model.BuscarPersonalUsuarioFiltro;
import model.Medico;
import model.Personal;
import model.TipoPersonal;

public interface PersonalMapper {
	
	List<Personal> obtenerTodos();
	
	Personal obtenerPersonalId(Integer id);
	
	List<Personal> obtenerPersonalxTipo(Integer idTipo);

	List<Personal> buscarPersonalUsuarios(
			BuscarPersonalUsuarioFiltro persoUsuFiltro);

	Personal getPersonal(Integer id);
	
	
	List<Personal> buscarPersonal(Personal personal);
	
	List<TipoPersonal> getTipoPersonal();
	
	void editar(Personal personal);
	
	void deshabilitarPersonal(Personal personal);

	void registrar(Personal personal);

	void eliminar(Integer id);
	
	void registrarMedico(Medico medico);
	
	void registrarAsistente(Asistente asistente);
}
