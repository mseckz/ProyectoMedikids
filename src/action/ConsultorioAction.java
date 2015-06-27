package action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import model.Consultorio;
import model.Dia;
import model.Especialidad;
import model.Horario;
import model.Medico;
import model.Turno;
import negocio.ConsultorioService;
import negocio.ConsultorioServiceDAO;
import negocio.DiaService;
import negocio.DiaServiceDAO;
import negocio.EspecialidadService;
import negocio.EspecialidadServiceDAO;
import negocio.MedicoService;
import negocio.MedicoServiceDAO;
import negocio.TurnoService;
import negocio.TurnoServiceDAO;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class ConsultorioAction extends ActionSupport implements Preparable{
	
	private static final long serialVersionUID = 1L;
	
	private Consultorio consultorio;
	private Horario horario;
	private List<Consultorio> consultorios;
	private List<Especialidad> especialidades;
	private static List<Horario> horarios = new ArrayList<Horario>();
	private List<Medico> medicos;
	private List<Dia> dias;
	private List<Turno> turnos;
	
	private String[] medicosSelected;

	
	private ConsultorioService consultorioService = new ConsultorioServiceDAO();
	private EspecialidadService especialidadService = new EspecialidadServiceDAO();
	private MedicoService medicoService = new MedicoServiceDAO();
	private DiaService diaService = new DiaServiceDAO();
	private TurnoService turnoService = new TurnoServiceDAO();
	
	public Consultorio getConsultorio() {
		return consultorio;
	}
	public void setConsultorio(Consultorio consultorio) {
		this.consultorio = consultorio;
	}
	public Horario getHorario() {
		return horario;
	}
	public void setHorario(Horario horario) {
		this.horario = horario;
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
	public List<Medico> getMedicos() {
		return medicos;
	}
	public void setMedicos(List<Medico> medicos) {
		this.medicos = medicos;
	}	
	public List<Dia> getDias() {
		return dias;
	}
	public void setDias(List<Dia> dias) {
		this.dias = dias;
	}
	public List<Turno> getTurnos() {
		return turnos;
	}
	public void setTurnos(List<Turno> turnos) {
		this.turnos = turnos;
	}
	public List<Horario> getHorarios() {
		return horarios;
	}
	public void setHorarios(List<Horario> horarios) {
		ConsultorioAction.horarios = horarios;
	}
	public String[] getMedicosSelected() {
		return medicosSelected;
	}
	public void setMedicosSelected(String[] medicosSelected) {
		this.medicosSelected = medicosSelected;
	}
	
	
	public String iniciar(){
		horarios = new ArrayList<Horario>();
		return SUCCESS;
	}

	public String editar(){
		consultorioService.registrar(consultorio);
		consultorio = null;
		return SUCCESS;
	}
	
	public String agregarHorario(){
		
		Horario horarioValido = consultorioService.validarHorario(horario);

		if(horarioValido == null){
			horarios.add(horario);
		}
		else{
			addActionMessage("Horario ya esta agregado");
		}
		consultorio = consultorioService.getConsultorio(horario.getConsultorio().getId());
		return SUCCESS;
	}
	
	public String editarHorario(){	
		consultorioService.registrarHorario(horarios);
		horarios = new ArrayList<Horario>();
		return SUCCESS;
	}
	
	public String buscarConsultorioHorario(){
		
		consultorio = consultorioService.getConsultorio(consultorio.getId());
		horarios = consultorioService.obtenerHorarios(consultorio.getId());
		return SUCCESS;
	}
	
	public String removerMedicosHorario(){
		
		horario = horarios.get(0);
		Arrays.sort(medicosSelected, Collections.reverseOrder());
		
		for(String i : medicosSelected){
			horarios.remove(Integer.parseInt(i));
		}

		consultorio = consultorioService.getConsultorio(horario.getConsultorio().getId());
		
		return SUCCESS;
	}
	
	
	@Override
	public void prepare() throws Exception {
		especialidades = especialidadService.obtenerTodos();
		medicos = medicoService.obtenerMedicos();
		dias = diaService.obtenerDias();
		turnos = turnoService.obtenerTurnos();
		consultorios = consultorioService.obtenerConsultorios();
	}

	
}
