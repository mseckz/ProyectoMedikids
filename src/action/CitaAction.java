package action;

import java.util.ArrayList;
import java.util.List;

import model.Cita;
import model.Consultorio;
import model.Especialidad;
import negocio.CitaService;
import negocio.CitaServiceDAO;
import negocio.ConsultorioService;
import negocio.ConsultorioServiceDAO;
import negocio.EspecialidadService;
import negocio.EspecialidadServiceDAO;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class CitaAction extends ActionSupport implements Preparable{
	
	private static final long serialVersionUID = 1L;
	
	private Cita cita;
	private List<Cita> citas;
	private List<Consultorio> consultorios = new ArrayList<Consultorio>();
	private List<Especialidad> especialidades;
	private Especialidad especialidad;
	
	private CitaService servicio = new CitaServiceDAO();
	private EspecialidadService especialidadService = new EspecialidadServiceDAO();
	private ConsultorioService consultorioService = new ConsultorioServiceDAO();
	
	public Cita getCita() {
		return cita;
	}
	public void setCita(Cita cita) {
		this.cita = cita;
	}
	public List<Cita> getCitas() {
		return citas;
	}
	public void setCitas(List<Cita> citas) {
		this.citas = citas;
	}
	public List<Consultorio> getConsultorios() {
		return consultorios;
	}
	public void setConsultorios(List<Consultorio> consultorios) {
		this.consultorios = consultorios;
	}
	public List<Especialidad> getEspecialidades() {
		return especialidades;
	}
	public void setEspecialidades(List<Especialidad> especialidades) {
		this.especialidades = especialidades;
	}
	public Especialidad getEspecialidad() {
		return especialidad;
	}
	public void setEspecialidad(Especialidad especialidad) {
		this.especialidad = especialidad;
	}
	
	public String registrarCita(){
		servicio.registrarCita(cita);
		return SUCCESS; 
	}
	
	public String cargarConsultorios(){
		consultorios = consultorioService.obtenerConsultoriosxEsp(especialidad.getId());
		return SUCCESS;
	}
	
	
	@Override
	public void prepare() throws Exception {
		citas = servicio.obtenerCitas();
		especialidades = especialidadService.obtenerTodos();
	}
}