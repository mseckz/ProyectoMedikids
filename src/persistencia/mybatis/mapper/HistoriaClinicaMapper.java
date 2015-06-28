package persistencia.mybatis.mapper;

import java.util.List;

import model.BuscarHCFiltro;
import model.HistoriaClinica;

public interface HistoriaClinicaMapper {

	void registrar(HistoriaClinica historia);

	void actualizar(HistoriaClinica historia);

	List<HistoriaClinica> buscar(BuscarHCFiltro hcfiltro1);

	void desactivar(Integer id);

	HistoriaClinica obtener(Integer id);

}
