package negocio;

import model.Usuario;
import persistencia.mybatis.mapper.UsuarioMapper;

public class LoginServiceDAO extends MyBatisGenericDAO implements LoginService{
	
	public Usuario isCredencialesValidas(Usuario usuario) throws Exception{
		
		Usuario usu = null;
		UsuarioMapper usuarioMapper = getSession().getMapper(UsuarioMapper.class);
		usu = usuarioMapper.validar(usuario);
		
		return usu;
	}

}
