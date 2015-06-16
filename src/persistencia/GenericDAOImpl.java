package persistencia;

import java.sql.Connection;

import util.SQLServerConexion;

public class GenericDAOImpl implements GenericDAO{
	
	private Connection connection;

	public Connection getConnection() {
		return connection;
	}

	public void abrirConexion()  throws Exception{
		connection=SQLServerConexion.getConnection();
	}
	
	public void commit()  throws Exception{
		connection.commit();
	}
	
	public void rollback()  throws Exception{
		connection.rollback();
	}
	
	public void cerrarConexion()  throws Exception{
		connection.close();
	}
}
