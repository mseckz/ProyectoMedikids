package persistencia;


import persistencia.mybatis.mapper.UsuarioMapper;
import model.Usuario;

public class UsuarioDAOMyBatis extends GenericMyBatisDAOImpl implements UsuarioDAO {

	@Override
	public String getUltimaFechaAcceso(Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		UsuarioMapper mapper = getSession().getMapper(UsuarioMapper.class);
		String result =mapper.validar(usuario);
		
		return result;
	}



}
