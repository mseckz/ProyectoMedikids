package negocio;

import java.util.List;

import model.Consultorio;
import model.Horario;

public interface ConsultorioService {
	
	public Consultorio getConsultorio(Integer id);
	public void registrar(Consultorio consultorio);
	public List<Consultorio> obtenerConsultorios() throws Exception;
	
	public void registrarHorario(List<Horario> listaHorarios);
	public List<Horario> obtenerHorarios(Integer idConsultorio);
	public Horario validarHorario(Horario horario);
	
}
