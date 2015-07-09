package negocio;

import java.util.List;




import model.BuscarUsuarioFiltro;
import model.Usuario;

public interface UsuarioRolService {

	void registrar(Usuario usuarioRol);

	List<Usuario> buscarUsuario(BuscarUsuarioFiltro usuarioFiltro);

	void desactivar(int id);

	Usuario buscarUsuarioNombre(String nombreusu);

	

}
