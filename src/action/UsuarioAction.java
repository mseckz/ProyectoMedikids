package action;

import java.util.Map;

import model.Usuario;
import negocio.LoginService;
import negocio.LoginServiceDAO;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import util.Constantes;

import com.opensymphony.xwork2.ActionSupport;



public class UsuarioAction extends ActionSupport implements SessionAware {
	
	private static final long serialVersionUID = -8703703762705180401L;

	
	private Usuario usuario;
	private SessionMap<String, Object> session;

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public SessionMap<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = (SessionMap<String, Object>)session;
	}
	
	

	public String login() throws Exception{
		
		String vista="";
		LoginService loginService= new LoginServiceDAO();
		String fecha=loginService.isCredencialesValidas(usuario);
		
		if (fecha!=null) {
			session.put("cuenta", getUsuario().getCuenta());
			
//			String[] params =new String[]{fecha};
			vista=SUCCESS;
		}
		else {
			addActionError(getText(Constantes.MENSAJE_LOGIN_VALIDACION));
			vista=LOGIN;
		}
		
		return vista;
		
	}
	
	public String logout() throws Exception{
		
		session.invalidate();
		
		return LOGIN;
		
	}






	
	

}
