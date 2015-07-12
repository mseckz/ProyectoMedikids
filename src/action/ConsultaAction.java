package action;

import java.util.List;
import java.util.Map;

import model.Cita;
import model.Consulta;
import model.Consultorio;
import model.HistoriaClinica;
import negocio.ConsultorioService;
import negocio.ConsultorioServiceDAO;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class ConsultaAction extends ActionSupport implements Preparable, SessionAware{

	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	
	private List<Consultorio> consultorios;
	private Integer idConsultorio;
	private List<Cita> citasPorConsultorio;
	private Consulta consulta;
	private HistoriaClinica historia;
	private List<Consulta> consultasRealizadas;
	
	private ConsultorioService consultorioService = new ConsultorioServiceDAO();
	
	public List<Consultorio> getConsultorios() {
		return consultorios;
	}
	public void setConsultorios(List<Consultorio> consultorios) {
		this.consultorios = consultorios;
	}
	public Integer getIdConsultorio() {
		return idConsultorio;
	}
	public void setIdConsultorio(Integer idConsultorio) {
		this.idConsultorio = idConsultorio;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public List<Cita> getCitasPorConsultorio() {
		return citasPorConsultorio;
	}
	public void setCitasPorConsultorio(List<Cita> citasPorConsultorio) {
		this.citasPorConsultorio = citasPorConsultorio;
	}
	public Consulta getConsulta() {
		return consulta;
	}
	public void setConsulta(Consulta consulta) {
		this.consulta = consulta;
	}
	public HistoriaClinica getHistoria() {
		return historia;
	}
	public void setHistoria(HistoriaClinica historia) {
		this.historia = historia;
	}
	public List<Consulta> getConsultasRealizadas() {
		return consultasRealizadas;
	}
	public void setConsultasRealizadas(List<Consulta> consultasRealizadas) {
		this.consultasRealizadas = consultasRealizadas;
	}
	
	
	public String registrarConsulta(){
		return SUCCESS;
	}
	
	public String listarCitasEnColaXConsultorio(){
		return SUCCESS;
	}
	
	// obtiene HC y consultas realizadas
	public String obtenerDetalleConsulta(){
		return SUCCESS;
	}
	
	public String verDetalleConsulta(){
		return SUCCESS;
	}
	
	
	
	@Override
	public void prepare() throws Exception {
		Integer idMedico = (Integer) session.get("id_personal");
		consultorios = consultorioService.obtenerConsultoriosMedico(idMedico);
		
	}
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = (SessionMap<String, Object>)arg0;
	}

}
