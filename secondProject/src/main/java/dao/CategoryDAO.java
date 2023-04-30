package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;

import model.Category;

public class CategoryDAO {

	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
	
	//카테고리 리스트
		public ArrayList<Category> listAll(int startRow, int endRow) {
			d.getCon();
			
			ArrayList<Category> v = new ArrayList<Category>();
			
			try {
				
				String sql = "select * from category where(1) limit ?,?";
				pstmt=d.con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Category c = new Category();
					
					c.setCode(rs.getString("code"));
					c.setCa_name(rs.getString("ca_name"));
					c.setUseyn(rs.getString("useyn"));
					
					v.add(c);
				}
				rs.close();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return v;
		}
		//카테고리 카운트
		public int getAllCount() {
			d.getCon();
			int num = 0;
			try {
				String sql = "select count(*) from category where (1)";
				pstmt = d.con.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				while(rs.next()) {
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
		//카테고리 수정
		public void updateCategory(Category c) {
			d.getCon();
			
			try {
				String sql = "update category set ca_name=?,useyn=? where code=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, c.getCa_name());
				pstmt.setString(2, c.getUseyn());
				pstmt.setString(3, c.getCode());
				
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//카테고리 삭제
		public void deleteCategory(String code) {
			d.getCon();
			
			try {
				String sql = "delete from category where code=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, code);
				
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
