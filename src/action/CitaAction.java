package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.BuscarHCFiltro;
import model.Cita;
import model.CitaFiltro;
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
	private CitaFiltro citaFiltro;
	private Map<String, Object> datosModal = new HashMap<String, Object>();
	private List<String> fechasLlenas = new ArrayList<String>();
	
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
	public CitaFiltro getCitaFiltro() {
		return citaFiltro;
	}
	public void setCitaFiltro(CitaFiltro citaFiltro) {
		this.citaFiltro = citaFiltro;
	}
	public Map<String, Object> getDatosModal() {
		return datosModal;
	}
	public void setDatosModal(Map<String, Object> datosModal) {
		this.datosModal = datosModal;
	}
	public List<String> getFechasLlenas() {
		return fechasLlenas;
	}
	public void setFechasLlenas(List<String> fechasLlenas) {
		this.fechasLlenas = fechasLlenas;
	}
	
	public String registrarCita(){
		if(cita.getId() == null){	
			servicio.registrarCita(cita);
			cita = null;
			addActionMessage("Cita registrada");
		}
		else{
			servicio.actualizarCita(cita);
			addActionMessage("Cita Actualizada");
		}
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
		cita = new Cita();
		cita.setCodigo(this.obtenerCodigoCita());
		return SUCCESS;
	}
	
	public String buscarCita(){
		citas = servicio.buscarCita(citaFiltro);
		citaFiltro = null;
		
		if(citas.size() == 0){
			addActionMessage("No se encontraron registros");
		}
		
		return SUCCESS;
	}
	
	public String cargarDatosCita(){

		cita = servicio.cargarCita(cita.getId());
		historia = historiaService.obtener(cita.getHistoriaClinica().getId());
		
		// cargar consultorios
		consultorios = consultorioService.obtenerConsultoriosxEsp(cita.getConsultorio().getEspecialidad().getId());
		
		//cargar horas
		Map<String, Object> datos = new HashMap<String, Object>();
		datos.put("idConsultorio", cita.getConsultorio().getId());
		datos.put("fecha", cita.getFechaAtencion());
		horas = servicio.horasDisponibles(datos);
		
		return SUCCESS;
	}
	
	public String cargarDatosCitaModal(){

		cita = servicio.cargarCita(cita.getId());
		historia = historiaService.obtener(cita.getHistoriaClinica().getId());
		
		datosModal.put("cita", cita);
		datosModal.put("historia", historia);
		
		return SUCCESS;
	}
	
	public String cancelarCita(){
		servicio.cancelarCita(cita.getId());
		citas = servicio.obtenerCitas();
		addActionMessage("Cita ha sido cancelada");
		return SUCCESS;
	}
	
	public String generarConsulta(){
		servicio.generarConsulta(cita.getId());
		addActionMessage("Cita ha sido generada");
		citas = servicio.obtenerCitas();
		return SUCCESS;
	}
	
	public String deshabilitarFechasCitasLlenas(){
		List<Map<String, Object>> horasDisponiblesxFechaxConsultorio = new ArrayList<Map<String,Object>>();
		horasDisponiblesxFechaxConsultorio = servicio.numeroHorasDisponiblesXFecha(cita.getConsultorio().getId());
				
		for(Map<String, Object> fila : horasDisponiblesxFechaxConsultorio){
			if((int)fila.get("horasDispo") == 0){
				String fecha = fila.get("fecha_atencion").toString().substring(0,10);
				fechasLlenas.add(fecha);
			}
		}
		return SUCCESS;
	}
	
	public String obtenerCodigoCita(){
		String codigo = servicio.obtenerUltimoCodigo();
		if(codigo != null){
			int numero = Integer.parseInt(codigo.substring(3)) + 1;
			codigo = String.format("%04d",numero);
		}
		else{
			codigo = "0001";
		}
		
		return codigo;
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
