package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Notice;

public class ReplyDAO {
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
	
	//문의 리스트 출력
		public ArrayList<Notice> replyList(int startRow,int endRow){
			d.getCon();
			
			ArrayList<Notice> v = new ArrayList<Notice>();
			
			try {
				String sql = "select * from notice where gongji=2 order by fid desc, thread asc limit ?,?";
				pstmt=d.con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					Notice n = new Notice();
					n.setUid(rs.getInt("uid"));
					n.setId(rs.getString("id"));
					n.setName(rs.getString("name"));
					n.setSubject(rs.getString("subject"));
					n.setComment(rs.getString("comment"));
					n.setSigndate(rs.getString("signdate"));
					n.setFile1(rs.getString("file"));
					n.setFid(rs.getInt("fid"));
					n.setThread(rs.getString("thread"));
					n.setOption(rs.getString("option1"));
					n.setRe_date(rs.getString("re_date"));
					n.setStatus(rs.getString("status"));
					
					v.add(n);
				}
				rs.close();
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return v;
		}
		//답변 조회
		public String threadCount(int fid) {
			d.getCon();
			String o_thread="";
			try {
				String sql = "select thread from notice where fid=?";
				pstmt=d.con.prepareStatement(sql);
				pstmt.setInt(1, fid);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					o_thread = rs.getString("thread");
				}
				rs.close();
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return o_thread;
		}
		//답변 데이터베이스 등록
		public void insertReply(Notice n) {
			d.getCon();
			
			try {
				String sql = "insert into notice (option1,id,name,gongji,subject,comment,fid,thread,re_date,status) values (?,?,?,?,?,?,?,?,?,?)";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, n.getOption());
				pstmt.setString(2, n.getId());
				pstmt.setString(3, n.getName());
				pstmt.setString(4, n.getGongji());
				pstmt.setString(5, n.getSubject());
				pstmt.setString(6, n.getComment());
				pstmt.setInt(7, n.getFid());
				pstmt.setString(8, n.getThread());
				pstmt.setString(9, n.getRe_date());
				pstmt.setString(10, n.getStatus());
				
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//답변 달렸을 때 처리일자와 상태 전환
		public void updateReply(String signdate,int fid) {
			d.getCon();
			
			try {
				String sql = "update notice set re_date=?,status='답변완료' where fid=? and thread='A'";
				pstmt=d.con.prepareStatement(sql);
				pstmt.setString(1, signdate);
				pstmt.setInt(2, fid);
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//1:1 문의 내역 답변 출력
		public Notice selectReply(int fid){
			d.getCon();
			
			Notice n = new Notice();
			
			try {
				String sql ="select * from notice where fid=? and thread='AA'";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setInt(1, fid);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					
					n.setSubject(rs.getString("subject"));
					n.setComment(rs.getString("comment"));
					
				}
				rs.close();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return n;
		}
		//관리자 답변 리스트 삭제(데이터베이스 삭제)
		public void deleteAdminReplyList(String uid) {
			d.getCon();
			
			try {
				String sql = "delete from notice where uid=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//관리자 답변 리스트 선택삭제(데이터베이스 삭제)
				public void deleteAdminReplyList2(String uidss) {
					d.getCon();
					
					try {
						String sql = "delete from notice where uid=?";
						pstmt = d.con.prepareStatement(sql);
						pstmt.setString(1, uidss);
						pstmt.executeUpdate();
						
						pstmt.close();
						d.con.close();
						
					} catch (Exception e) {
						e.printStackTrace();
					}
				}		
		//관리자 답변 수정 리스트 출력
		public Notice replyModify(int uid) {
			d.getCon();
			Notice n = new Notice();
			
			try {
				String sql ="select * from notice where uid=?";
				pstmt= d.con.prepareStatement(sql);
				pstmt.setInt(1, uid);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					n.setUid(rs.getInt("uid"));
					n.setId(rs.getString("id"));
					n.setName(rs.getString("name"));
					n.setSubject(rs.getString("subject"));
					n.setComment(rs.getString("comment"));
					n.setGongji(rs.getString("gongji"));
					n.setFid(rs.getInt("fid"));
					n.setThread(rs.getString("thread"));
					n.setOption(rs.getString("option1"));
					
				}
				rs.close();
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return n;
		}
		//관리자 답변 수정
		public void updateReplyModify(int uid,String subject,String comment) {
			d.getCon();
			
			try {
				String sql = "update notice set subject=?,comment=? where uid=?";
				pstmt=d.con.prepareStatement(sql);
				pstmt.setString(1, subject);
				pstmt.setString(2, comment);
				pstmt.setInt(3, uid);
				
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//관리자답변 카운트 
		public int replyCount() {		
			d.getCon();		
			int num = 0;
			try {
				String sql = "select count(*) from notice where gongji=2 order by fid desc, thread asc";
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
}
