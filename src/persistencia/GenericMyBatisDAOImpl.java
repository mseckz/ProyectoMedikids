package persistencia;

import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;

public class GenericMyBatisDAOImpl implements GenericDAO{
	
	private SqlSession session = null;
	
	@Override
	public void abrirConexion() throws Exception {
		session = MyBatisUtil.getSqlSessionFactory().openSession();
		
	}

	@Override
	public void commit() throws Exception {
		session.commit();
		
	}

	@Override
	public void rollback() throws Exception {
		session.rollback();
		
	}

	@Override
	public void cerrarConexion() throws Exception {
		session.close();
		
	}
	
	public SqlSession getSession() throws Exception{
		if(session == null){
			abrirConexion();
		}
			
		return session;
	}
}
