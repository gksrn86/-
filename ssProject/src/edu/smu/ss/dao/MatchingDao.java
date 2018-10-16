package edu.smu.ss.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MatchingDao {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} // 1
	}

	public Connection getConnection() throws SQLException {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		Connection conn = DriverManager.getConnection(url, "scott", "tiger");
		return conn;
	}

	// -------------------------------------------------------
	public ArrayList<String> result(int[] rfArr) throws SQLException {
		Connection con = getConnection();

		String sql = "SELECT fname FROM matching join food using(fnum) WHERE cnum=?";
		String sql1 = "";
		for (int i = 0; i < rfArr.length - 1; i++) {
			sql1 += sql + " intersect \n";
		}
		PreparedStatement ps = con.prepareStatement(sql1 + sql);
		for (int i = 0; i < rfArr.length; i++) {
			ps.setInt(i + 1, rfArr[i]);
		}
		ArrayList<String> foodList = new ArrayList<>();
		ResultSet res = ps.executeQuery();
		while (res.next()) {
			System.out.println("FNAME : "+res.getString("FNAME"));
			foodList.add(res.getString("FNAME"));
		}
		res.close();
		ps.close();
		con.close();
		return foodList;
	}

	public int searchFnum(String fname) throws SQLException {
		Connection con = getConnection();
		ResultSet res;
		String sql = "select FNUM from FOOD where fname=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, fname);
		res = ps.executeQuery();
		int i = -1;
		if(res.next()) {
			i = res.getInt(1);
		}
		res.close();
		ps.close();
		con.close();
		return i;
	}
	
	public void insertFoodName(String fname) throws SQLException {
		Connection con = getConnection();
		String sql = "insert into food values(FOOD_SQ.nextval, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, fname);
		ps.executeUpdate();
		ps.close();
		con.close();
	}
	
	public void insertCategory(String fname, int[] cArr) throws SQLException {
		Connection con = getConnection();
		String sql = "insert into matching values(?, ?)";
		PreparedStatement ps;
		for(int i = 0 ; i < cArr.length ; i++) {
			ps = con.prepareStatement(sql);
			ps.setInt(1, searchFnum(fname));
			ps.setInt(2, cArr[i]);
			ps.executeUpdate();
		}
		con.close();
	}
	
}