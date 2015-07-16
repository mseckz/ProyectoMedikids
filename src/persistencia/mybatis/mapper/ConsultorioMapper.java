package persistencia.mybatis.mapper;

import java.util.List;

import model.Consultorio;
import model.ConsultorioFiltro;
import model.Horario;

public interface ConsultorioMapper {
	
	Consultorio getConsultorio(Integer id);
	void registrar(Consultorio consultorio);
	List<Consultorio> obtenerConsultorios();
	void actualizar(Consultorio consultorio);
	List<Consultorio> buscarConsultorio(ConsultorioFiltro filtro);
	List<Consultorio> obtenerConsultoriosxEsp(Integer idesp);
	List<Consultorio> obtenerConsultoriosMedico(Integer idPersonal);
	String obtenerCodigo();
	
	void registrarHorario(List<Horario> listaHorarios);
	List<Horario> obtenerHorarios(Integer idConsultorio);
	Horario validarHorario(Horario horario);
	void deshabilitarHorarios(List<Horario> listaHorarios);
}
