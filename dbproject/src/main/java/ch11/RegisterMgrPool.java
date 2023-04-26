package ch11;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import org.apache.tomcat.jni.Pool;

public class RegisterMgrPool {
       private DBConnectionMgr pool = null;
	/*
	 * private final String JDBC_DRIVER = "com.mysql.jdbc.Driver"; private final
	 * String JDBC_URL = "jdbc:mysql://localhost:3306/mydb"; private final String
	 * USER = "root"; private final String PASS = "1234";
	 */
	
	public RegisterMgrPool() {
		try {
			pool = DBConnectionMgr.getInstance();
			//Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
		    System.out.println("Error : JDBC드라이버 로딩 실패");
		}
	    }
	  
	   public Vector<RegisterBean> getRegisterList() {
		   Connection conn = null;
		   Statement stmt = null;
		   ResultSet rs = null;
		   
		   Vector<RegisterBean> vlist = new Vector<RegisterBean>();
		   try {
			conn= pool.getConnection();
			//conn=DriverManager.getConnection(JDBC_URL,USER,PASS);
			String strQuery = "select * from tblRegister";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			while (rs.next()) {
				RegisterBean regBean = new RegisterBean();
				regBean.setId (rs.getString("id"));
				regBean.setPWD (rs.getString("PWD"));
				regBean.setNAME (rs.getString("NAME"));
				regBean.setNum1 (rs.getString("num1"));
				regBean.setNum2 (rs.getString("num2"));
				regBean.setEmail (rs.getString("email"));
				regBean.setPhone (rs.getString("phone"));
				regBean.setZipcode (rs.getString("zipcode"));
				regBean.setAddress (rs.getString("address"));
				regBean.setJob (rs.getString("job"));
				vlist.add(regBean);
			}
		} catch (Exception ex) {
			  System.out.println("Exception"+ ex);
		} finally {
			pool.freeConnection(conn);
			/*
			 * if(rs!=null) try {rs.close();} catch(SQLException e) {} if(stmt!=null) try
			 * {stmt.close();} catch(SQLException e) {} if(conn!=null) try {conn.close();}
			 * catch(SQLException e) {}
			 */
		}
		   return vlist;
	   }
}
