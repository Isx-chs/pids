package util;

import java.sql.*;

public class MySqlDBConn {
	/**
	 *Permite Cargar en Memoria los Drivers 
	 */
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	static final String URL_BD_MYSQL=
		"jdbc:mysql://localhost:3306/bd_daw1?user=root&password=mysql";
	

	/**
	 * Obtiene una conexión a la Base de Datos.
	 */
	public static Connection getConnection() throws Exception{

		Connection connection = DriverManager.getConnection(URL_BD_MYSQL);
		
		return connection;
	}
}
