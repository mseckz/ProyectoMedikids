package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.BuscarHCFiltro;
import model.Cita;
import model.Consultorio;
import model.Especialidad;
import model.HistoriaClinica;
import model.Personal;
import negocio.CitaService;
import negocio.CitaServiceDAO;
import negocio.ConsultorioService;
import negocio.ConsultorioServiceDAO;
import negocio.EspecialidadService;
import negocio.EspecialidadServiceDAO;
import negocio.HistoriaClinicaService;
import negocio.HistoriaClinicaServiceDAO;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class CitaAction extends ActionSupport implements Preparable, SessionAware{
	
	private static final long serialVersionUID = 1L;
	
	private Map<String, Object> session;
	
	private Cita cita;
	private List<Cita> citas;
	private List<Consultorio> consultorios = new ArrayList<Consultorio>();
	private List<Especialidad> especialidades;
	private Especialidad especialidad;
	private List<String> horas = new ArrayList<String>();
	private HistoriaClinica historia;
	private List<HistoriaClinica> historias;
	private BuscarHCFiltro hcFiltro;
	
	private CitaService servicio = new CitaServiceDAO();
	private EspecialidadService especialidadService = new EspecialidadServiceDAO();
	private ConsultorioService consultorioService = new ConsultorioServiceDAO();
	private HistoriaClinicaService historiaService = new HistoriaClinicaServiceDAO();
	
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
	public List<String> getHoras() {
		return horas;
	}
	public void setHoras(List<String> horas) {
		this.horas = horas;
	}
	public HistoriaClinica getHistoria() {
		return historia;
	}
	public void setHistoria(HistoriaClinica historia) {
		this.historia = historia;
	}
	public List<HistoriaClinica> getHistorias() {
		return historias;
	}
	public void setHistorias(List<HistoriaClinica> historias) {
		this.historias = historias;
	}
	public BuscarHCFiltro getHcFiltro() {
		return hcFiltro;
	}
	public void setHcFiltro(BuscarHCFiltro hcFiltro) {
		this.hcFiltro = hcFiltro;
	}
	
	public String registrarCita(){
		Personal p = new Personal();
		p.setId(1);
		cita.setPersonalRegistro(p);
		servicio.registrarCita(cita);
		
		return SUCCESS; 
	}
	
	public String cargarConsultorios(){
		consultorios = consultorioService.obtenerConsultoriosxEsp(especialidad.getId());
		return SUCCESS;
	}
	
	public String obtenerHorasDisponibles(){
		Map<String, Object> datos = new HashMap<String, Object>();
		datos.put("idConsultorio", cita.getConsultorio().getId());
		datos.put("fecha", cita.getFechaAtencion());
		horas = servicio.horasDisponibles(datos);
		return SUCCESS;
	}
	
	public String buscarPaciente(){
		historias = historiaService.buscarHC(hcFiltro);
		return SUCCESS;
	}
	
	public String cargarPaciente(){
		historia = historiaService.obtener(historia.getId());
		return SUCCESS;
	}
	
	@Override
	public void prepare() throws Exception {
		citas = servicio.obtenerCitas();
		especialidades = especialidadService.obtenerTodos();
	}
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = (SessionMap<String, Object>)session;
		
	}
}
