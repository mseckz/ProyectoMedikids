package negocio;

import persistencia.mybatis.mapper.UsuarioMapper;
import model.CambioPassword;

public class UsuarioServiceDAO extends MyBatisGenericDAO implements UsuarioService {

	@Override
	public void cambiarPassword(CambioPassword cambioP) {
		// TODO Auto-generated method stub
		UsuarioMapper usuMapper = getSession().getMapper(UsuarioMapper.class);
		usuMapper.cambiarPassword(cambioP);
	}

}
