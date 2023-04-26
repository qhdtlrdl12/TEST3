package ch11;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class CustomerMgr {
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/mydb";
	private final String USER = "root";
	private final String PASS = "1234";
	
	public CustomerMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
		    System.out.println("Error : JDBC드라이버 로딩 실패");
		}
    }
	  
	public Vector<CustomerBean> getCustomerList() {
		   Connection conn = null;
		   Statement stmt = null;
		   ResultSet rs = null;
		   
		   Vector<CustomerBean> vlist = new Vector<CustomerBean>();
		   try {
				conn=DriverManager.getConnection(JDBC_URL,USER,PASS);
				String strQuery = "select * from customer";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(strQuery);
				while (rs.next()) {
					CustomerBean cstBean = new CustomerBean();
					cstBean.setId (rs.getString("id"));
					cstBean.setPwd (rs.getString("pwd"));
					cstBean.setNAME (rs.getString("NAME"));
					vlist.add(cstBean);
				}
		   } catch (Exception ex) {
			  System.out.println("Exception"+ ex);
		   } finally {
				if(rs!=null)  try {rs.close();}  catch(SQLException e) {}
				if(stmt!=null)  try {stmt.close();}  catch(SQLException e) {}
				if(conn!=null)  try {conn.close();}  catch(SQLException e) {}
		   }
		   return vlist;
	}
}

