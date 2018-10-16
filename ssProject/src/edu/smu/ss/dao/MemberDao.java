package edu.smu.ss.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.smu.ss.vo.Member;

public class MemberDao {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}//1
	}
	public Connection getConnection() throws SQLException {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		Connection conn=DriverManager.getConnection(url, "scott", "tiger");
		return conn;
	}
     public void add(Member m) throws SQLException {
    	 Connection con = getConnection();
    	 String sql = "Insert into MEMBER(id, pw, email) values(?,?,?)";
    	 PreparedStatement ps = con.prepareStatement(sql);
    	 ps.setString(1, m.getId());
    	 ps.setString(2, m.getPw());
    	 ps.setString(3, m.getEmail());
    	 ps.executeUpdate();
    	 ps.close();
    	 con.close();
     }

     public Member search(String id) throws SQLException {
    	 System.out.println("dao진입");
    	Member m=null;
 		Connection con=getConnection();
 		String sql="Select * from Member where id=?";
 		PreparedStatement ps=con.prepareStatement(sql);
 		ps.setString(1,id);
 		ResultSet rs=ps.executeQuery();

 		if(rs.next()) {
 			String pw=rs.getString(2);
 			String email=rs.getString(3);
 			
 			m=new Member(id,pw,email);
 		}		
 		rs.close();
 		ps.close();
 		con.close();	
 		return m;	
     }
     
     public String searchPassword(String id) throws SQLException {
 		String pw="";
 		Connection con=getConnection(); // 2. ��ü ����
 		String sql="Select PW from Member where id=?";
 		PreparedStatement ps=con.prepareStatement(sql); // PreparedStatement ��ü ����
 		ps.setString(1, id);
 		ResultSet rs = ps.executeQuery();
 		
 		if(rs.next()) {
 			pw=rs.getString("PW");
 		}
 		rs.close();
 		ps.close();
 		con.close();
 		return pw;
 	}
     
     public void delete(String id) throws SQLException {
 		Connection con=getConnection();
 		String sql="delete from Member where id=?";
 		PreparedStatement ps=con.prepareStatement(sql);
 		ps.setString(1, id);			
 		ps.executeUpdate();
 		ps.close();
 		con.close();	
 	}
 	public void update(Member m) throws SQLException {
 		Connection con=getConnection();
 		String sql="Update Member set pw=?, email=? where id=?";
 		PreparedStatement ps=con.prepareStatement(sql);
 		ps.setString(1, m.getPw());
 		ps.setString(2, m.getEmail());
 		ps.setString(3, m.getId());
 		ps.executeUpdate();
 		System.out.println("업데이트");
 		ps.close();
 		con.close();	
 	}	
}
//add, search, delete, update