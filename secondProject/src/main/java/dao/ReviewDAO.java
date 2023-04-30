package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Item;
import model.Review2;

public class ReviewDAO {
	
	
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
	
//	댓글 DB넣기
	public void insertReview(Review2 rv) {
		d.getCon();
		
		try {
			String sql = "insert into review (tb_uid,tb_id,tb_name,tb_review,tb_review_score,tb_date) values (?,?,?,?,?,?)";
			
			pstmt = d.con.prepareStatement(sql);
			
			
			pstmt.setInt(1, rv.getTb_uid());		
			pstmt.setString(2, rv.getTb_id());
			pstmt.setString(3, rv.getTb_name());
			pstmt.setString(4, rv.getTb_review());
			pstmt.setInt(5, rv.getTb_review_score());
			pstmt.setString(6, rv.getTb_date());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

// 총 댓글 수 시작
	
	public int reviewAllCount(int uid) {
		d.getCon();
		
		int num = 0;
	
		try {
			String sql = "select count(*) from review where tb_uid = "+uid+"";
			pstmt = d.con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}

//댓글 평점 총합
	
	public int reviewSum(int uid) {
		d.getCon();
		
		int sum = 0;
	
		try {
			String sql = "select sum(tb_review_score) from review where tb_uid = "+uid+"";
			pstmt = d.con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sum = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sum;
	}
		
//	댓글리스트 출력
	public ArrayList<Review2> listReview(int uid,int startRow,int endRow) {
		d.getCon();
		
		ArrayList<Review2> list = new ArrayList<Review2>();
		
				
		try {
			String sql = "select * from review where tb_uid=? order by uid desc limit ?,?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Review2 rv_view = new Review2();
				rv_view.setTb_uid(rs.getInt("tb_uid"));
				rv_view.setTb_id(rs.getString("tb_id"));
				rv_view.setTb_name(rs.getString("tb_name"));
				rv_view.setTb_review(rs.getString("tb_review"));
				rv_view.setTb_review_score(rs.getInt("tb_review_score"));
				rv_view.setTb_date(rs.getString("tb_date"));
				
				list.add(rv_view);
			}
			rs.close();
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}
