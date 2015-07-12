package action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Consultorio;
import model.ConsultorioFiltro;
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
	private static Consultorio consultorioTemp = new Consultorio();
	private boolean error = false;
	private ConsultorioFiltro conFiltro;
	
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
	public ConsultorioFiltro getConFiltro() {
		return conFiltro;
	}
	public void setConFiltro(ConsultorioFiltro conFiltro) {
		this.conFiltro = conFiltro;
	}
	public boolean isError() {
		return error;
	}
	public void setError(boolean error) {
		this.error = error;
	}
	
	
	public String iniciar(){
		horarios = new ArrayList<Horario>();
		return SUCCESS;
	}
	
	public String reset(){
		horarios = new ArrayList<Horario>();
		consultorio = null;
		return SUCCESS;
	}

	public String editar() throws Exception{
		if(consultorio.getId() == null){
			consultorioService.registrar(consultorio);
			consultorio = null;
			addActionMessage("Consultorio Agregado");
		}
		else{
			consultorioService.actualizar(consultorio);
			consultorio = null;
			addActionMessage("Consultorio Actualizado");
		}
		consultorios = consultorioService.obtenerConsultorios();
		
		return SUCCESS;
	}
	
	public String agregarHorario(){	
		if(horario.getConsultorio().getId() == null){
			addActionMessage("Seleccione un Consultorio");
			error = true;
			return SUCCESS;
		}
		consultorio = consultorioService.getConsultorio(horario.getConsultorio().getId());
		consultorioTemp.setId(consultorio.getId());
		
		for(Horario h : horarios){
			if(h.getTurno().getId() == horario.getTurno().getId() && 
			   h.getDia().getId() == horario.getDia().getId()){
				
				addActionMessage("Horario ya esta agregado");
				return SUCCESS;
			}
			// TODO Validad que horario no se repita en otro consultorio
		}

		horarios.add(horario);
		
		return SUCCESS;
	}
	
	public String editarHorario(){	
		if(horarios.isEmpty()){
			addActionMessage("No hay horarios agregados");
			return SUCCESS;
		}
		
		List<Horario> horarioActual= consultorioService.obtenerHorarios(consultorioTemp.getId());
		
		if(horarioActual.isEmpty()){	
			consultorioService.registrarHorario(horarios);
		}
		else{
			Map<String, List<Horario>> mapHorarios = validarHorariosIngresar(horarioActual, horarios);
			
			List<Horario> deshabilitar = mapHorarios.get("Deshabilitar");
			List<Horario> registrar = mapHorarios.get("Registrar");
			
			if(!registrar.isEmpty()){
				consultorioService.registrarHorario(registrar);	
			}
			if(!deshabilitar.isEmpty()){
				consultorioService.deshabilitarHorarios(deshabilitar);
			}
			
		}

		horarios = new ArrayList<Horario>();
		return SUCCESS;
	}
	
	public String buscarConsultorioHorario(){		

		consultorio = consultorioService.getConsultorio(consultorio.getId());
		horarios = consultorioService.obtenerHorarios(consultorio.getId());
		consultorioTemp.setId(consultorio.getId());
		return SUCCESS;
	}
	
	public String removerMedicosHorario(){
		
		if(horarios.size() == 0){
			return SUCCESS;
		}
		
		horario = horarios.get(0);
		Arrays.sort(medicosSelected, Collections.reverseOrder());
		
		for(String i : medicosSelected){
			horarios.remove(Integer.parseInt(i));
		}

		consultorio = consultorioService.getConsultorio(horario.getConsultorio().getId());
		return SUCCESS;
	}
	
	public String buscarConsultorio(){
		consultorios = consultorioService.buscarConsultorio(conFiltro);
		return SUCCESS;
	}
	
	
	@Override
	public void prepare() throws Exception {
		especialidades = especialidadService.obtenerTodos();
		medicos = medicoService.obtenerMedicos();
		dias = diaService.obtenerDias();
		turnos = turnoService.obtenerTurnos();
//		consultorios = consultorioService.obtenerConsultorios();
	}

	
	/**
	 * Valida que si el horario a ingresar tiene registros iguales en en Horario actual
	 * 
	 * @param horarioActual 
	 * @param horarioMemoria
	 * @return
	 * 1 Mapa con dos listas, una de horario para deshabilitar y otra para registrar
	 */
	public Map<String, List<Horario>> validarHorariosIngresar(List<Horario> horarioActual, List<Horario> horarioMemoria){
	
		List<Horario> horarioDeshabilitar = new ArrayList<Horario>();

		for(Horario h : horarioActual){
			if(horarioMemoria.size() == 0){
				horarioDeshabilitar.add(h);
			}
			
			for(int i = horarioMemoria.size()- 1; i >= 0; i--){
				Horario temp = horarioMemoria.get(i);

				if(h.getTurno().getId() == temp.getTurno().getId() && 
				   h.getDia().getId() == temp.getDia().getId() &&
				   h.getMedico().getId() == temp.getMedico().getId()){
					horarioMemoria.remove(i);
					break;
				}
				else{
					if(i == 0){
						horarioDeshabilitar.add(h);
					}
				}
			}
		}
		
		Map<String, List<Horario>> lista = new HashMap<String, List<Horario>>();
		lista.put("Deshabilitar", horarioDeshabilitar);
		lista.put("Registrar", horarioMemoria);
		
		return lista;
	}
}
