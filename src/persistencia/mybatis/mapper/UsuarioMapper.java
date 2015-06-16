package persistencia.mybatis.mapper;


import model.Usuario;

public interface UsuarioMapper {
	
	public String validar(Usuario usuario) throws Exception;

}
