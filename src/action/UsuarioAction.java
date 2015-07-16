package action;

import java.util.Map;

import model.CambioPassword;
import model.Usuario;
import negocio.LoginService;
import negocio.LoginServiceDAO;
import negocio.UsuarioService;
import negocio.UsuarioServiceDAO;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import util.Constantes;

import com.opensymphony.xwork2.ActionSupport;



public class UsuarioAction extends ActionSupport implements SessionAware {
	
	private static final long serialVersionUID = 1L;
	
	private Usuario usuario;
	private SessionMap<String, Object> session;
	private CambioPassword cambioP;
	
	private UsuarioService usuarioService = new UsuarioServiceDAO();

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
	public CambioPassword getCambioP() {
		return cambioP;
	}

	public void setCambioP(CambioPassword cambioP) {
		this.cambioP = cambioP;
	}

	public String login() throws Exception{

		String vista="";
		LoginService loginService= new LoginServiceDAO();

		Usuario usu = loginService.isCredencialesValidas(usuario);
		
		if (usu!=null &&usu.isEstado()==true) {
			String temp_nombre_comp=usu.getPersonal().getNombreCompleto();
			String temp_telefono=usu.getPersonal().getTelefono();
			String temp_celular=usu.getPersonal().getCelular();
			String temp_dni=usu.getPersonal().getDni();
			String temp_correo=usu.getPersonal().getCorreo();
			String temp_url_foto=usu.getPersonal().getUrlFoto();
			String temp_url_cv=usu.getPersonal().getUrlCV();
			String temp_nombre_user=usu.getNombreUsuario();
			String tipo_personal=usu.getPersonal().getTipoPersonal().getDescripcion();
			Integer temp_id_usuario=+usu.getId();
			
			System.out.println("Nombre completo : "+temp_nombre_comp);
			session.put("nombre_completo",temp_nombre_comp);
			session.put("telefono",temp_telefono);
			session.put("celular",temp_celular);
			session.put("dni",temp_dni);
			session.put("correo",temp_correo);
			session.put("url_foto",temp_url_foto);
			session.put("url_cv",temp_url_cv);
			session.put("nombre_usuario",temp_nombre_user);
			session.put("id_usuario",temp_id_usuario);
			session.put("tipo_personal", tipo_personal);
			session.put("id_personal", usu.getPersonal().getId());
			vista=SUCCESS;
		}if (usu!=null &&usu.isEstado()==false) {
			addActionError(getText(Constantes.MENSAJE_LOGIN_VALIDACION_INACTIVO));
			vista=LOGIN;
		}
		if(usu==null){
			addActionError(getText(Constantes.MENSAJE_LOGIN_VALIDACION));
			vista=LOGIN;
		}
		return vista;	
	}
	
	public String logout() throws Exception{
		
		session.invalidate();
		
		return LOGIN;
		
	}
	
	
	public String cambiarPassword() throws Exception{
		
		String cambio="";
		String id=""+cambioP.getId();
		String contra1=cambioP.getContrasena();
		String contra2=cambioP.getRepcontrasena();

		if (contra1.equals(contra2)) {
			usuarioService.cambiarPassword(cambioP);
			addActionMessage(getText(Constantes.MENSAJE_CAMBIO_PASSWORD_OK));
			cambio=SUCCESS;
		}
		else{
			
			addActionError(getText(Constantes.MENSAJE_CAMBIO_NO_PASSWORD_OK));
			cambio=ERROR;
		}
		return cambio;
		
	}

}
