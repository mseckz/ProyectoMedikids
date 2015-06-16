package negocio;

import model.Usuario;
import persistencia.UsuarioDAO;
import persistencia.UsuarioDAOMyBatis;

public class LoginServiceDAO implements LoginService{

	//UsuarioDAO usuarioDAO=new UsuarioDAOSQL();
	UsuarioDAO usuarioDAO = new UsuarioDAOMyBatis();
	
	public String isCredencialesValidas(Usuario usuario) throws Exception{

		usuarioDAO.abrirConexion();
		
		String fecha= usuarioDAO.getUltimaFechaAcceso(usuario);
		
		usuarioDAO.cerrarConexion();
	          
		return fecha;
	}

}
