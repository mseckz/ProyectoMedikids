package negocio;


import model.Usuario;

public interface LoginService {

	public Usuario isCredencialesValidas(Usuario usuario) throws Exception;

}
