package persistencia.mybatis.mapper;


import model.CambioPassword;
import model.Usuario;

public interface UsuarioMapper {
	
	public Usuario validar(Usuario usuario) throws Exception;
	public void cambiarPassword(CambioPassword cambioP);
}
