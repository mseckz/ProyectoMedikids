package persistencia.mybatis.mapper;


import model.Usuario;

public interface UsuarioMapper {
	
	public Usuario validar(Usuario usuario) throws Exception;

}
