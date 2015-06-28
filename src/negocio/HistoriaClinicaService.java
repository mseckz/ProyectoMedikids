package negocio;


import java.util.List;

import model.BuscarHCFiltro;
import model.HistoriaClinica;;

public interface HistoriaClinicaService {

	public void registrar(HistoriaClinica historia) throws Exception;

	public void actualizar(HistoriaClinica historia) throws Exception;

	public List<HistoriaClinica> buscarHC(BuscarHCFiltro hcFiltro);

	public void desactivar(Integer id);

	public HistoriaClinica obtener(Integer id);



	

}
