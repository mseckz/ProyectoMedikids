package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLServerConexion {

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://localhost;databaseName=proyFinalPIT";
			String usr = "usuario1";
			String psw = "sql";
			con = DriverManager.getConnection(url, usr, psw);
			System.out.println("Conexion establecida Con DAO!!");
		} catch (ClassNotFoundException ex) {
			System.out.println("No hay Driver!!");
		} catch (SQLException ex) {
			System.out.println("Error con la BD");
		}
		return con;
	}
}
