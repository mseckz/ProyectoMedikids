package persistencia;

import model.Usuario;

public interface UsuarioDAO extends GenericDAO{
	public void cerrarConexion() throws Exception;
	public String getUltimaFechaAcceso(Usuario usuario) throws Exception;

}
