package negocio;

import java.util.List;



import persistencia.mybatis.mapper.UsuarioRolMapper;
import model.BuscarUsuarioFiltro;
import model.Usuario;

public class UsuarioRolServiceDAO extends MyBatisGenericDAO implements UsuarioRolService{

	@Override
	public void registrar(Usuario usuarioRol) {
		// TODO Auto-generated method stub
		UsuarioRolMapper usuRolMapper = getSession().getMapper(UsuarioRolMapper.class);
		usuRolMapper.registrar(usuarioRol);
	}

	@Override
	public List<Usuario> buscarUsuario(BuscarUsuarioFiltro usuarioFiltro) {
		// TODO Auto-generated method stub
		BuscarUsuarioFiltro usufiltro1 = new BuscarUsuarioFiltro();
		
		String valor1=null;
		String valor2=null;
		String valor3=null;
		String valor4=null;
/*		Integer valor5=null;
		Rol roltemp;*/
		
		
		if (!usuarioFiltro.getNombreUsuario().isEmpty()) {
			valor1=usuarioFiltro.getNombreUsuario()+"%";
		}
		if (!usuarioFiltro.getNombres().isEmpty()) {
			valor2=usuarioFiltro.getNombres()+"%";
		}
		if (!usuarioFiltro.getApellidos().isEmpty()) {
			valor3=usuarioFiltro.getApellidos()+"%";
		}
		if (!usuarioFiltro.getDni().isEmpty()) {
			valor4=usuarioFiltro.getDni();
		}
		System.out.println("pre "+usuarioFiltro.getRol().getIdRol());
		
		usufiltro1.setNombreUsuario(valor1);
		usufiltro1.setNombres(valor2);
		usufiltro1.setApellidos(valor3);
		usufiltro1.setDni(valor4);
		usufiltro1.setRol(usuarioFiltro.getRol());
		
				
		System.out.println("ID Buscar DAO"+usufiltro1.getRol().getIdRol());
		UsuarioRolMapper mapper = getSession().getMapper(UsuarioRolMapper.class);
		List<Usuario> result =mapper.buscar(usufiltro1);
		System.out.println("result"+result.size());
		return result;
	}

	@Override
	public void desactivar(int id) {
		// TODO Auto-generated method stub
		UsuarioRolMapper mapper = getSession().getMapper(UsuarioRolMapper.class);
		mapper.desactivar(id);
	}

	@Override
	public Usuario buscarUsuarioNombre(String nombreusu) {
		// TODO Auto-generated method stub
		UsuarioRolMapper mapper = getSession().getMapper(UsuarioRolMapper.class);
		Usuario result =mapper.buscarUsuarioNombre(nombreusu);
		return result;
	}


}
