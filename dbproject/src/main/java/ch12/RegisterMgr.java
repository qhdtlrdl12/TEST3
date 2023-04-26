package ch12;

import java.sql.*;
import java.util.Vector;

import org.apache.tomcat.jni.Pool;

public class RegisterMgr {
	private DBConnectionMgr pool;
	/*
	 * private final String JDBC_DRIVER = "com.mysql.jdbc.Driver"; private final
	 * String JDBC_URL = "jdbc:mysql://localhost:3306/mydb"; private final String
	 * USER = "root"; private final String PASS = "1234";
	 */

	public RegisterMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
			// Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : 커넥션 연결 실패");
		}
	}

	

	public boolean loginRegister(String id, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean loginCon = false;

		try {
			conn = pool.getConnection();
			// conn=DriverManager.getConnection(JDBC_URL,USER,PASS);
			String strQuery = "select count(*) from tblRegister where id = ? and PWD = ?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getInt(1) > 0)
				loginCon = true;
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			pool.freeConnection(conn, pstmt, rs);
			/*
			 * if(rs!=null) try {rs.close();} catch(SQLException e) {} if(stmt!=null) try
			 * {stmt.close();} catch(SQLException e) {} if(conn!=null) try {conn.close();}
			 * catch(SQLException e) {}
			 */
		}
		return loginCon;
	}
}
