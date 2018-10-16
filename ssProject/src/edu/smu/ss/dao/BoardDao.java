package edu.smu.ss.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import edu.smu.ss.vo.Board;

public class BoardDao {

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
	
	public void save(Board b) throws SQLException { 
		Connection con=getConnection();
		String sql="Insert into Board values(board_seq.nextval,sysdate,?,?,?,0)";
		PreparedStatement ps=con.prepareStatement(sql);//3
		ps.setString(1, b.getWrite());
		ps.setString(2, b.getTitle());
		ps.setString(3, b.getCont());
		ps.executeUpdate();
		ps.close();
		con.close();			
	}
	public ArrayList<Board> search() throws SQLException{
		ArrayList<Board> result=new ArrayList<Board>();
		Connection con=getConnection();
		String sql="Select * from Board";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {				
			Board b=new Board();
			b.setNum(rs.getInt(1));
			b.setWdate(rs.getDate(2));
			b.setWrite(rs.getString(3));
			b.setTitle(rs.getString(4));
			b.setCont(rs.getString(5));
			b.setRate(rs.getInt(6));
			result.add(b);
			
		}	
		ps.close();
		con.close();
		return result;
		
	}
	public Board search(int num) throws SQLException {
		Board b=null;
		Connection con=getConnection();
		String sql="Select * from Board where num=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, num);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {				
			b = new Board();
			b.setNum(rs.getInt(1));
			b.setWdate(rs.getDate(2));
			b.setWrite(rs.getString(3));
			b.setTitle(rs.getString(4));
			b.setCont(rs.getString(5));
			b.setRate(rs.getInt(6));
		}	
		ps.close();
		con.close();
		return b;
	}
	//번호가 같은걸 찾아서 제목, 내용을 수정
	public void update(Board b) throws SQLException {
		Connection con=getConnection();
		String sql="Update Board set title=?,cont=? where num=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, b.getTitle());
		ps.setString(2, b.getCont());
		ps.setInt(3, b.getNum());
		ps.executeUpdate();
		ps.close();
		con.close();	
	}
	public void delete (int num) throws SQLException {
		Connection con=getConnection();//2
		String sql="Delete from Board where num=?";
		PreparedStatement ps=con.prepareStatement(sql);//3
		ps.setInt(1, num);
		ps.executeUpdate();
		ps.close();
		con.close();
	}
	//번호에 해당하는 게시물의 조회수를 1증가
	public void updateRate(int num) throws SQLException {
		Connection con=getConnection();
		String sql="update Board set rate = rate+1 where num=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, num);
		ps.executeUpdate();
		ps.close();
		con.close();	
	}
	public ArrayList<Board> list() throws SQLException{
	      ArrayList<Board> result = new ArrayList<Board>();
	      Connection con = getConnection();
	      String sql = "select * from board ORDER by num desc";
	      PreparedStatement ps = con.prepareStatement(sql);
	      ResultSet rs = ps.executeQuery();
	      while(rs.next()) {
	         int num=rs.getInt("num");
	         String title=rs.getString("title");
	         String write=rs.getString("write");
	         String cont=rs.getString("cont");
	         Date wdate=rs.getDate("wdate");
	         int rate=rs.getInt("rate");
	         
	         Board b = new Board(num,wdate,write,title,cont,rate);
	         result.add(b);
	      }
	       ps.close();
	       con.close();
	       return result;
	   }
	
	public String searchWrite(String num) throws SQLException {
		Connection con = getConnection();
		String sql = "select write from board where num=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, num);
		ResultSet res = ps.executeQuery();
		String writer = "";
		if(res.next()) {
			writer = res.getString("write");
		}
		res.close();
		ps.close();
		con.close();
		return writer;
	}
}
