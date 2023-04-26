package ch12;

import java.sql.*;
import java.util.Vector;

import org.apache.tomcat.jni.Pool;

import ch11.RegisterBean;

public class RegisterMgr2 {
	private DBConnectionMgr pool;
	
	
	  private final String JDBC_DRIVER = "com.mysql.jdbc.Driver"; 
	  private final String JDBC_URL = "jdbc:mysql://localhost:3306/mydb"; 
	  private final String USER = "root"; 
	  private final String PASS = "1234";
	 

	public RegisterMgr2() {
		try {
			pool = DBConnectionMgr.getInstance();
			// Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : 커넥션 연결 실패");
		}
	}

	public String getRegister(String id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String name = null; 
		
		try {
			conn = pool.getConnection();
			String strQuery = "select NAME from tblRegister where id = ?";
			stmt = conn.prepareStatement(strQuery);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if (rs.next())
			name = rs.getString("NAME");
		} catch (Exception ex) {
			System.out.println("오류오류" + ex);
		}
		return name;
	}
	
	public Vector<RegisterBean> getRegisterList() {
		   Connection conn = null;
		   Statement stmt = null;
		   ResultSet rs = null;
		   
		   Vector<RegisterBean> vlist = new Vector<RegisterBean>();
		   try {
			conn=DriverManager.getConnection(JDBC_URL,USER,PASS);
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
			if(rs!=null)  try {rs.close();}  catch(SQLException e) {}
			if(stmt!=null)  try {stmt.close();}  catch(SQLException e) {}
			if(conn!=null)  try {conn.close();}  catch(SQLException e) {}
		}
		   return vlist;
	   }
	public Vector<RegisterBean> getRegisterList(String id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Vector<RegisterBean> vlist = new Vector<RegisterBean>();
		try {
			conn = pool.getConnection();
			String strQuery = "select * from tblRegister where id = ?";
			stmt = conn.prepareStatement(strQuery);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
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
			if(rs!=null)  try {rs.close();}  catch(SQLException e) {}
			if(stmt!=null)  try {stmt.close();}  catch(SQLException e) {}
			if(conn!=null)  try {conn.close();}  catch(SQLException e) {}
		}
		return vlist;
	
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

