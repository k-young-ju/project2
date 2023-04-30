package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;

import model.Notice;

public class NoticeDAO {
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
	
	public int checkFid(int fid) {
		d.getCon();
		
		int num =0;
		try {
			String sql = "select max(fid) as fid_max from notice";
			pstmt=d.con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getInt("fid_max")>0) {
				num = rs.getInt("fid_max")+1;
				}else {
				num =1;
				}
			}	
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	//문의 데이터베이스에 등록
	public int insertNotice(Notice n) {
		d.getCon();
		int num = 0;
		
		try {
			String sql ="insert into notice (id,name,subject,comment,signdate,file,fid,thread,option1,gongji) values (?,?,?,?,?,?,?,?,?,?)";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, n.getId());
			pstmt.setString(2, n.getName());
			pstmt.setString(3, n.getSubject());
			pstmt.setString(4, n.getComment());
			pstmt.setString(5, n.getSigndate());
			pstmt.setString(6, n.getFile1());
			pstmt.setInt(7, n.getFid());
			pstmt.setString(8, n.getThread());
			pstmt.setString(9, n.getOption());
			pstmt.setString(10, n.getGongji());
			
			num = pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	//고객센터 공지사항 제한출력
	public LinkedList<Notice> listMain() {
		d.getCon();
		LinkedList<Notice> v = new LinkedList<Notice>();
		
		try {
			String sql = "select * from notice where gongji='1' order by uid desc limit 0,4";
			pstmt = d.con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice n = new Notice(); 
				n.setUid(rs.getInt("uid"));
				n.setSubject(rs.getString("subject"));
				n.setName(rs.getString("name"));
				n.setSigndate(rs.getString("signdate"));
				
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
	//작성글 수 확인
	public int noticeCount(String gongji,String id,String search) {
		d.getCon();
		String str = "";
		if(gongji.equals("2")) {
			str=" and id='"+id+"'";
		}
		
		String str2 = "";
		if(!search.equals("")) {
			str2 = " and (subject like '%"+search+"%' or comment like '%"+search+"%')";
		}
		int num=0;
		try {
			String sql ="select count(*) from notice where gongji=?"+str+""+str2+"";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, gongji);
			rs = pstmt.executeQuery();
			
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
	
	//공지사항=1, 1:1문의 내역=2, 자주묻는 질문=3
	public ArrayList<Notice> listNotice(String id, String gongji, String search,String option,int startRow,int endRow) {
		d.getCon();
		
		ArrayList<Notice> v = new ArrayList<Notice>();
		
		try {
			String option_info ="";
			if(!option.equals("")) {
				if(option.equals("member")) {
					option_info=" and option1='회원정보 서비스'";
				}else if(option.equals("order")) {
					option_info=" and option1='주문/결제'";
				}else if(option.equals("delivery")) {
					option_info=" and option1='배송/수령일 안내'";
				}else if(option.equals("item")) {
					option_info=" and option1='도서/상품정보'";
				}else {
					option_info=" and option1='중고 거래 관련'";
				}
			}
			
			String str01 = "";
			if(!search.equals("")) {
				str01 = " and (subject like '%"+search+"%' or comment like '%"+search+"%')";
			}
			
			String sql = "select * from notice where gongji=? and deleteyn='n' "+str01+""+option_info+" order by uid desc limit ?,?"; //공지사항 , 자주 묻는 질문
			if(gongji.equals("2")) {
				sql = "select * from notice where gongji=? and id='"+id+"' and thread='A' and deleteyn='n' order by fid desc limit ?,?"; //문의 게시판	
			}
			
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, gongji);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice n = new Notice();
				n.setUid(rs.getInt("uid"));
				n.setOption(rs.getString("option1"));
				n.setSubject(rs.getString("subject"));
				n.setGongji(rs.getString("gongji"));
				n.setComment(rs.getString("comment"));
				n.setName(rs.getString("name"));
				n.setFid(rs.getInt("fid"));
				n.setSigndate(rs.getString("signdate"));
				n.setRe_date(rs.getString("re_date"));
				n.setStatus(rs.getString("status"));
				n.setDeleteyn(rs.getString("deleteyn"));
				
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
	
	//관리자 공지사항 count
	public int noticeCount() {		
		d.getCon();		
		int num = 0;
		try {
			String sql = "select count(*) from notice where gongji='1' and deleteyn='n' order by uid desc";
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
	
	///공지사항, 문의내용 view
	public Notice viewNotice(int uid) {
		d.getCon();
		Notice n = new Notice();
		try {
			String sql = "select * from notice where uid=?";
			pstmt=d.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				n.setUid(uid);
				n.setSubject(rs.getString("subject"));
				n.setName(rs.getString("name"));
				n.setGongji(rs.getString("gongji"));
				n.setSigndate(rs.getString("signdate"));
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
	//이전글 내용
	public Notice frontWrite(int uid) {
		d.getCon();
		Notice n = new Notice();
		try {
			String sql = "select * from notice where uid<? and gongji='1' order by uid desc limit 1";
			pstmt=d.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				n.setUid(rs.getInt("uid"));
				n.setSubject(rs.getString("subject"));
				n.setName(rs.getString("name"));
				n.setSigndate(rs.getString("signdate"));
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
	//다음글 내용
	public Notice nextWrite(int uid) {
		d.getCon();
		Notice n = new Notice();
		try {
			String sql = "select * from notice where uid>? and gongji='1' order by uid asc limit 1";
			pstmt=d.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				n.setUid(rs.getInt("uid"));
				n.setSubject(rs.getString("subject"));
				n.setName(rs.getString("name"));
				n.setSigndate(rs.getString("signdate"));
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
	//공지사항 등록
	public int insertGongji(Notice n) {
		d.getCon();
		int num = 0;
		try {
			String sql ="insert into notice (id,name,subject,comment,signdate,file,fid,thread,gongji) values (?,?,?,?,?,?,?,?,?)";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, n.getId());
			pstmt.setString(2, n.getName());
			pstmt.setString(3, n.getSubject());
			pstmt.setString(4, n.getComment());
			pstmt.setString(5, n.getSigndate());
			pstmt.setString(6, n.getFile1());
			pstmt.setInt(7, n.getFid());
			pstmt.setString(8, n.getThread());
			pstmt.setString(9, n.getGongji());
			
			num = pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	// 하나의 글 정보 가져오기
	public Notice oneNotice(int uid) {
		d.getCon();
		
		Notice n = new Notice();
		
		try {
			String sql ="select * from notice where uid=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				n.setUid(rs.getInt("uid"));
				n.setId(rs.getString("id"));
				n.setOption(rs.getString("option1"));
				n.setName(rs.getString("name"));
				n.setFid(rs.getInt("fid"));
				n.setThread(rs.getString("thread"));
				n.setSigndate(rs.getString("signdate"));
				n.setGongji(rs.getString("gongji"));
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
	//공지 및 자주묻는 질문 글 수정
	public void updateNotice(int uid,String gongji,Notice n) {
		d.getCon();
		
		try {
			String sql = "update notice set gongji=?,subject=?,comment=? where uid=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1,gongji);
			pstmt.setString(2, n.getSubject());
			pstmt.setString(3, n.getComment());
			pstmt.setInt(4, uid);
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	//회원 글 삭제(보이지 않게 하기)
	public void deleteNotice(int uid) {
		d.getCon();
		
		try {
			String sql ="update notice set deleteyn='y' where uid=?";
			pstmt= d.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//관리자에서 글 선택삭제(보이지 않게 하기)
		public void deleteNotice2(String uids) {
			d.getCon();
			
			try {
				String sql ="update notice set deleteyn='y' where uid=?";
				pstmt= d.con.prepareStatement(sql);
				pstmt.setString(1, uids);
				pstmt.executeUpdate();
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	//자주묻는 질문 검색
	public ArrayList<Notice> searchNotice(String search, String gongji) {
		d.getCon();
		ArrayList<Notice> v = new ArrayList<Notice>();
		
		
		
		try {
			String sql = "select * from notice where gongji=? and subject like '%"+search+"%' or comment like '%"+search+"%' order by uid desc";
			pstmt=d.con.prepareStatement(sql);
			pstmt.setString(1, gongji);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice n = new Notice();
				n.setUid(rs.getInt("uid"));
				n.setGongji(rs.getString("gongji"));
				n.setSubject(rs.getString("subject"));
				n.setComment(rs.getString("comment"));
				n.setSigndate(rs.getString("signdate"));
				
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
	//답변 내용
	public ArrayList<Notice> replyNotice(String id,String gongji){
		d.getCon();
		ArrayList<Notice> v = new ArrayList<Notice>();
		
		try {
			String sql = "select comment from notice where gongji=? and thread='AA' order by fid desc";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, gongji);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Notice n = new Notice();
				n.setComment(rs.getString("comment"));
				
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
	//통합검색 공지 내용있는지 확인
	public int searchCountgongji1Notice(String t_search) {
		d.getCon();
		int num=0;
		try {
			String sql ="select count(*) from notice where gongji='1' and deleteyn='n' and (subject like '%"+t_search+"%' or comment like '%"+t_search+"%' or signdate like '%"+t_search+"%' or option1 like '%"+t_search+"%' or re_date like '%"+t_search+"%')";
			pstmt = d.con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				num = rs.getInt(1)	;	
			}
			
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
		
	}
	
	//통합검색 공지 부분
	public ArrayList<Notice> totalSearchgongji1Notice(int startRowNoticeg1,int endRowNoticeg1,String t_search){
		d.getCon();
		ArrayList<Notice> v = new ArrayList<Notice>();
		try {
			String sql ="select * from notice where gongji='1' and deleteyn='n' and (subject like '%"+t_search+"%' or comment like '%"+t_search+"%' or signdate like '%"+t_search+"%' or option1 like '%"+t_search+"%' or re_date like '%"+t_search+"%') limit ?,?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, startRowNoticeg1);
			pstmt.setInt(2, endRowNoticeg1);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice n = new Notice();
				n.setUid(rs.getInt("uid"));
				n.setSubject(rs.getString("subject"));
				n.setComment(rs.getString("comment"));
				n.setSigndate(rs.getString("signdate"));
				n.setOption(rs.getString("option1"));
				n.setRe_date(rs.getString("re_date"));
				
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
	//통합 검색 자주묻는 질문 있는지 확인
	public int searchCountgongji3Notice(String t_search) {
		d.getCon();
		int num=0;
		try {
			String sql ="select count(*) from notice where gongji='3' and deleteyn='n' and (subject like '%"+t_search+"%' or comment like '%"+t_search+"%' or signdate like '%"+t_search+"%' or option1 like '%"+t_search+"%' or re_date like '%"+t_search+"%')";
			pstmt = d.con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				num = rs.getInt(1)	;
			}
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
		
	}
	//통합 검색 자주묻는 질문 부분
	public ArrayList<Notice> totalSearchgongji3Notice(int startRowNoticeg3,int endRowNoticeg3,String t_search){
		d.getCon();
		ArrayList<Notice> v = new ArrayList<Notice>();
		try {
			String sql ="select * from notice where gongji='3' and deleteyn='n' and (subject like '%"+t_search+"%' or comment like '%"+t_search+"%' or signdate like '%"+t_search+"%' or option1 like '%"+t_search+"%' or re_date like '%"+t_search+"%') limit ?,?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, startRowNoticeg3);
			pstmt.setInt(2, endRowNoticeg3);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice n = new Notice();
				n.setUid(rs.getInt("uid"));
				n.setSubject(rs.getString("subject"));
				n.setComment(rs.getString("comment"));
				n.setSigndate(rs.getString("signdate"));
				n.setOption(rs.getString("option1"));
				n.setRe_date(rs.getString("re_date"));
				
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

}
