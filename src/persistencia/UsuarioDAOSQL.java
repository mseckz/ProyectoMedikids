package persistencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Usuario;


public class UsuarioDAOSQL extends GenericDAOImpl implements UsuarioDAO{
	

	public String getUltimaFechaAcceso(Usuario usuario) throws Exception {
		
        String fecha=null;
        
		String sql= "SELECT usuario  " +
				"	FROM tb_usuario" +
				"	WHERE usuario=?" +
				"	AND contrasena=?";
		
		PreparedStatement ps=getConnection().prepareStatement(sql);
		ps.setString(1, usuario.getCuenta());
		ps.setString(2, usuario.getContrasena());
		ResultSet rs= ps.executeQuery();
		
		if(rs.next())
			fecha=rs.getString(1);
				
		return fecha;
		
		
	}
}
