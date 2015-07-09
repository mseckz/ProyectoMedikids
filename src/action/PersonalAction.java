package action;

import java.util.List;

import model.Asistente;
import model.Especialidad;
import model.Medico;
import model.Personal;
import model.TipoPersonal;
import negocio.EspecialidadService;
import negocio.EspecialidadServiceDAO;
import negocio.MedicoService;
import negocio.MedicoServiceDAO;
import negocio.PersonalService;
import negocio.PersonalServiceDAO;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

/**
 * @author Jo
 *
 */
public class PersonalAction extends ActionSupport implements Preparable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<TipoPersonal> tipopersonal;
	private List<Medico> medicos;
	private List<Especialidad> especialidad;
	private PersonalService personalservice=new PersonalServiceDAO();
	private MedicoService medicoservice=new MedicoServiceDAO();
	private EspecialidadService especialidadservice=new EspecialidadServiceDAO();
	private Personal personal;
	private Medico medico;
	private Asistente asistente;

	
	public Medico getMedico() {
		return medico;
	}
	public void setMedico(Medico medico) {
		this.medico = medico;
	}
	public Asistente getAsistente() {
		return asistente;
	}
	public void setAsistente(Asistente asistente) {
		this.asistente = asistente;
	}
	public List<Especialidad> getEspecialidad() {
		return especialidad;
	}
	public void setEspecialidad(List<Especialidad> especialidad) {
		this.especialidad = especialidad;
	}
	public List<Medico> getMedicos() {
		return medicos;
	}
	public void setMedicos(List<Medico> medicos) {
		this.medicos = medicos;
	}
	public Personal getPersonal() {
		return personal;
	}
	public void setPersonal(Personal personal) {
		this.personal = personal;
	}
	public List<TipoPersonal> getTipopersonal() {
		return tipopersonal;
	}
	public void setTipopersonal(List<TipoPersonal> tipopersonal) {
		this.tipopersonal = tipopersonal;
	}
	
	public String agregarPersonal()
	{
		String apellidos=personal.getApellidos();
		String nombres=personal.getNombres();
		
		personal.setNombreCompleto(nombres + ' '+ apellidos);
		personalservice.registrar(personal);
		
		if(personal.getTipoPersonal().getId()==1)
		{
			medico.setId(personal.getId());
			personalservice.registrarMedico(medico);
		}
		else if(personal.getTipoPersonal().getId()==3)
		{
			asistente.setId(personal.getId());
			personalservice.registrarAsistente(asistente);
		}
		return SUCCESS;
	}
	
	public String buscarPersonal()
	{		
		personalservice.getPersonal(personal.getId());
		return SUCCESS;
	}
	
	public String deshabilitarPersonal()
	{		
		personalservice.deshabilitarPersonal(personal);
		return SUCCESS;
	}
	
	public String cargarPersonal(){
		System.out.println("gooooo");
		personal=personalservice.obtenerPersonalId(personal.getId());
		
		if(personal instanceof Medico)
		{
			medico=(Medico) personal;
			System.out.println(medico.getCmp());
			System.out.println(medico.getId());
		}
		else if (personal instanceof Asistente) {
			asistente=(Asistente) personal;
		}
		
		return SUCCESS;
	}
	
	
	@Override
	public void prepare() throws Exception {
		tipopersonal=personalservice.getTipoPersonal();
		medicos=medicoservice.getMedicos();
		especialidad=especialidadservice.obtenerTodos();
	}

}
