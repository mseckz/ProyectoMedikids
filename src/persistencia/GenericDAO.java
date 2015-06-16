package persistencia;

public interface GenericDAO {
	
	public void abrirConexion()  throws Exception;
	
	public void commit()  throws Exception;
	
	public void rollback()  throws Exception;
	
	public void cerrarConexion()  throws Exception;
}
