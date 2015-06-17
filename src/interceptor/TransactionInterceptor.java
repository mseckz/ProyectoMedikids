package interceptor;

import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class TransactionInterceptor implements Interceptor {

	private static final long serialVersionUID = 1L;

	@Override
	public void destroy() {
		
	}

	@Override
	public void init() {
		
	}

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		
		String result = null;
		
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSessionFactory().openSession();
			
			ActionContext.getContext().put("sql.session", session);
			
			result = arg0.invoke();

			session.commit();
			
		} catch (Exception e) {
			session.rollback();
		} finally {
			if(session != null){
				session.close();
			}
		}
		
		return result;
	}

}
