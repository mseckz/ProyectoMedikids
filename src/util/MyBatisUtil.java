package util;


import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 *
 * @author Administrador
 */
public class MyBatisUtil {
    
	 //protected static final SqlSessionFactory FACTORY;
	private static SqlSessionFactory FACTORY;
	    
	    static{
	        try{
	            Reader reader= Resources.getResourceAsReader("persistencia/mybatis/config/mybatis-config.xml");
	            
	            FACTORY = new SqlSessionFactoryBuilder().build(reader);
	            
//	            if (FACTORY == null) {
//	            	FACTORY = new SqlSessionFactoryBuilder().build(reader);
//
//	            	}
//	            FACTORY= new SqlSessionFactoryBuilder().build(reader,"proyFinalPIT");
	            System.out.println("Conexion establecida Con MyBatis!!");
	            
	            
	        }catch(Throwable e){
	        	e.printStackTrace();
	            throw new RuntimeException("Error: " + e);
	        }
	    }
	 
	    
	    public static SqlSessionFactory getSqlSessionFactory(){
	        return FACTORY;
	    }
}
