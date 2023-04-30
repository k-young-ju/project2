package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class AccesorDAO {
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	DAO d = new DAO();
	
	public void insertAccesor(String id,String cip,String signdate) {
		d.getCon();
		try {
			String sql = "Insert into accesor values (null,'"+id+"','"+cip+"','"+signdate+"')";
			pstmt = d.con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	
	public int countTodayAccesor() {
		d.getCon();
		int s =0;
		try {
			String sql = "select count(date) from accesor where date=curdate()";
			pstmt = d.con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				s = rs.getInt(1);
			}		
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}	
	
	public int countYesterdayAccesor(){
		d.getCon();
		int s =0;
		try {
			String sql = "select count(date) from accesor where date=curdate() - INTERVAL 1 DAY";
			pstmt = d.con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				s = rs.getInt(1);
			}		
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	public int countAccesor() {
		d.getCon();
		int s =0;
		try {
			String sql = "select count(*) as count from accesor";
			pstmt = d.con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				s = rs.getInt(1);
			}		
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	
}
