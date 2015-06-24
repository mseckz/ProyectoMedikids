package negocio;

import java.util.List;

import model.Consultorio;
import model.Horario;

public interface ConsultorioService {
	
	public void registrar(Consultorio consultorio);
	public void registrarHorario(List<Horario> listaHorarios);
}
