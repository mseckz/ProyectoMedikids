package negocio;

import java.util.List;

import model.TipoSangre;

public interface TipoSangreService {

	public List<TipoSangre> getTodos() throws Exception;
}
