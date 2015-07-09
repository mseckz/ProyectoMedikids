package negocio;

import java.util.List;

import model.Asistente;
import model.BuscarPersonalUsuarioFiltro;
import model.Medico;
import model.Personal;
import model.TipoPersonal;

public interface PersonalService {
	
	public List<Personal> obtenerPersonalxTipo(Integer idTipo);
	public List<Personal> buscarPersonalUsuarios(
			BuscarPersonalUsuarioFiltro persoUsuFiltro);

	public Personal getPersonal(Integer id);
	
	public void registrar(Personal personal);
	public void editar(Personal personal);
	public void eliminar(Integer id);
	public void deshabilitarPersonal(Personal personal);
	public Personal obtenerDetalle(Integer id);
	public List<Personal> buscarPersonal(Personal personal);
	public List<TipoPersonal> getTipoPersonal();
	public void registrarMedico(Medico medico);
	public void registrarAsistente(Asistente asistente);

	public Personal obtenerPersonalId(Integer id);

}
