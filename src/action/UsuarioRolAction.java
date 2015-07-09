package action;

import java.util.List;

import util.Constantes;
import model.BuscarPersonalUsuarioFiltro;
import model.BuscarUsuarioFiltro;
import model.Personal;
import model.Rol;
import model.Usuario;
import negocio.PersonalService;
import negocio.PersonalServiceDAO;
import negocio.RolService;
import negocio.RolServiceDAO;
import negocio.UsuarioRolService;
import negocio.UsuarioRolServiceDAO;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class UsuarioRolAction extends ActionSupport implements Preparable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4320025160332813534L;

	private Usuario usuarioRol;
	private Personal personal;

	private List<Usuario> usuarios;
	private List<Rol> roles;
	private List<Personal> personalUsuarios;

	private BuscarUsuarioFiltro usuarioFiltro;
	
	private BuscarPersonalUsuarioFiltro persoUsuFiltro;

	private UsuarioRolService usuarioRolService = new UsuarioRolServiceDAO();
	private PersonalService personalService = new PersonalServiceDAO();

	public Personal getPersonal() {
		return personal;
	}

	public void setPersonal(Personal personal) {
		this.personal = personal;
	}
	
	public BuscarPersonalUsuarioFiltro getPersoUsuFiltro() {
		return persoUsuFiltro;
	}

	public void setPersoUsuFiltro(BuscarPersonalUsuarioFiltro persoUsuFiltro) {
		this.persoUsuFiltro = persoUsuFiltro;
	}
	
	public Usuario getUsuarioRol() {
		return usuarioRol;
	}

	public void setUsuarioRol(Usuario usuarioRol) {
		this.usuarioRol = usuarioRol;
	}

	public List<Usuario> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios;
	}

	public List<Rol> getRoles() {
		return roles;
	}

	public void setRoles(List<Rol> roles) {
		this.roles = roles;
	}

	public BuscarUsuarioFiltro getUsuarioFiltro() {
		return usuarioFiltro;
	}

	public void setUsuarioFiltro(BuscarUsuarioFiltro usuarioFiltro) {
		this.usuarioFiltro = usuarioFiltro;
	}

	public UsuarioRolService getUsuarioRolService() {
		return usuarioRolService;
	}

	public void setUsuarioRolService(UsuarioRolService usuarioRolService) {
		this.usuarioRolService = usuarioRolService;
	}
	
	public List<Personal> getPersonalUsuarios() {
		return personalUsuarios;
	}

	public void setPersonalUsuarios(List<Personal> personalUsuarios) {
		this.personalUsuarios = personalUsuarios;
	}

	public String editar() throws Exception {

		String nombreusu=usuarioRol.getNombreUsuario();
		Usuario usufind=usuarioRolService.buscarUsuarioNombre(nombreusu);
		String mensaje="";
		
		if (usufind==null) {
			usuarioRolService.registrar(usuarioRol);
			String[] params = new String[] { getText(Constantes.MODULO_USUARIOS_ROLES) };
			addActionMessage(getText(Constantes.MENSAJE_INSERT_USUARIO_OK, params));
			mensaje=SUCCESS;
		}else{
			addActionMessage(getText(Constantes.MENSAJE_NO_INSERT_USUARIO_OK));
			mensaje=SUCCESS;
		}
		return mensaje;
	}

	public String buscar() throws Exception {

		System.out.println("ID Buscar"+usuarioFiltro.getRol().getIdRol());
		usuarios = usuarioRolService.buscarUsuario(usuarioFiltro);
		System.out.println("cant usuarios"+usuarios.size());
		if (usuarios.size() > 0) {
			addActionMessage(getText(Constantes.MENSAJE_BUSCAR_USUARIOS_RESULTS)+ usuarios.size());
		} else {
			addActionMessage(getText(Constantes.MENSAJE_BUSCAR_NO_USUARIOS_RESULTS));
		}
		return SUCCESS;
	}
	
	public String cargarPersonal(){
		personal=personalService.getPersonal(personal.getId());
		return SUCCESS;
	}
	
	public String buscarPersonal(){
		personalUsuarios = personalService.buscarPersonalUsuarios(persoUsuFiltro);
		return SUCCESS;
	}

	public String desactivar() throws Exception {

		System.out.println("Usuario Rol ID : "+usuarioRol.getId());
		usuarioRolService.desactivar(usuarioRol.getId());

		Integer temp=usuarioRol.getId();
		String[] params = new String[] { getText(Constantes.MODULO_USUARIOS_ROLES),
				Integer.toString(temp) };

		addActionMessage(getText(Constantes.MENSAJE_USUARIO_DESACTIVADO_OK, params));

		return SUCCESS;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub

		RolService rolService = new RolServiceDAO();
		roles=rolService.getTodos();
	}











}
