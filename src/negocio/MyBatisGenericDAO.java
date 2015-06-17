package negocio;

import org.apache.ibatis.session.SqlSession;

import com.opensymphony.xwork2.ActionContext;

public class MyBatisGenericDAO {
	
	private SqlSession session;

	public SqlSession getSession() {
		
		if(session == null){
			session = (SqlSession) ActionContext.getContext().get("sql.session");
		}
		
		return session;
	}
}
