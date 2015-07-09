package persistencia.mybatis.mapper;

import java.util.List;

import model.BuscarUsuarioFiltro;
import model.Usuario;

public interface UsuarioRolMapper {

	List<Usuario> buscar(BuscarUsuarioFiltro usufiltro1);

	void desactivar(int id);
	void registrar(Usuario usuarioRol);

	Usuario buscarUsuarioNombre(String nombreusu);


}
