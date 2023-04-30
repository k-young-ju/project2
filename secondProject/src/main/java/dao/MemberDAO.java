package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import model.Member;

public class MemberDAO {
	
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
	//아이디 체크
	public String idCheck(String id) {
		d.getCon();
		String delete ="";
		
		try {
			String sql = "select * from member where id=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				delete = rs.getString("delete_id");
			}
			rs.close();
			pstmt.close();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return delete;
	}
	//로그인 가능한지 체크
		public int loginCheck(String id,String pass) {
			d.getCon();
			int num= 0;
			
			try {
				String sql = "select count(*) from member where id=? and pass=?";
				
				pstmt= d.con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pass);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					num= rs.getInt(1);
				}
				rs.close();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return num;
		}	
	
		//회원가입
	public int insertMember(Member m) {
		d.getCon();
		int num = 0;
		try {
			String sql = "insert into member values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = d.con.prepareStatement(sql);
			
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPass());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getBirth1());
			pstmt.setString(5, m.getBirth2());
			pstmt.setString(6, m.getBirth3());
			pstmt.setString(7, m.getGender());
			pstmt.setString(8, m.getEmail1());
			pstmt.setString(9, m.getEmail2());
			pstmt.setString(10, m.getLevel());
			pstmt.setString(11, m.getZipcode());
			pstmt.setString(12, m.getZipcode1());
			pstmt.setString(13, m.getZipcode2());
			pstmt.setString(14, m.getZipcode3());
			pstmt.setString(15, m.getZipcode4());
			pstmt.setString(16, m.getPhone1());
			pstmt.setString(17, m.getPhone2());
			pstmt.setString(18, m.getPhone3());
			pstmt.setString(19,m.getSigndate());
			pstmt.setString(20, m.getDelete_id());
			pstmt.setInt(21, m.getMileage());
			pstmt.setInt(22, m.getIncome());
			
			num = pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//아이디 찾기
	public Member findId(Member m) {
		d.getCon();
		
		try {
			String sql = "select id from member where phone1=? and phone2=? and phone3=? and email1=? and email2=? and birth1=? and birth2=? and birth3=?";
			
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, m.getPhone1());
			pstmt.setString(2, m.getPhone2());
			pstmt.setString(3, m.getPhone3());
			pstmt.setString(4, m.getEmail1());
			pstmt.setString(5, m.getEmail2());
			pstmt.setString(6, m.getBirth1());
			pstmt.setString(7, m.getBirth2());
			pstmt.setString(8, m.getBirth3());
			
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				m.setId(rs.getString("id"));
			}
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	
	//비밀번호 찾기
	public Member findPass(Member m) {
		d.getCon();
		
		try {
			String sql  = "select pass from member where id=? and phone1=? and phone2=? and phone3=? and email1=? and email2=? and birth1=? and birth2=? and birth3=?";
			
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPhone1());
			pstmt.setString(3, m.getPhone2());
			pstmt.setString(4, m.getPhone3());
			pstmt.setString(5, m.getEmail1());
			pstmt.setString(6, m.getEmail2());
			pstmt.setString(7, m.getBirth1());
			pstmt.setString(8, m.getBirth2());
			pstmt.setString(9, m.getBirth3());
			
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				m.setPass(rs.getString("pass"));
			}
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	
//	아이디& 비밀번호 찾기
	public Member find(Member m) {
		d.getCon();
		
		try {
			if(m.getId() ==null) {//아이디 찾기
				String sql  = "select * from member where phone1=? and phone2=? and phone3=? and email1=? and email2=? and birth1=? and birth2=? and birth3=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, m.getPhone1());
				pstmt.setString(2, m.getPhone2());
				pstmt.setString(3, m.getPhone3());
				pstmt.setString(4, m.getEmail1());
				pstmt.setString(5, m.getEmail2());
				pstmt.setString(6, m.getBirth1());
				pstmt.setString(7, m.getBirth2());
				pstmt.setString(8, m.getBirth3());
				
				rs= pstmt.executeQuery();
				
				while(rs.next()) {
					m.setId(rs.getString("id"));
				}
				rs.close();
				pstmt.close();
				d.con.close();
			}else {
				String sql  = "select * from member where id=? and phone1=? and phone2=? and phone3=? and email1=? and email2=? and birth1=? and birth2=? and birth3=?";
				
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, m.getId());
				pstmt.setString(2, m.getPhone1());
				pstmt.setString(3, m.getPhone2());
				pstmt.setString(4, m.getPhone3());
				pstmt.setString(5, m.getEmail1());
				pstmt.setString(6, m.getEmail2());
				pstmt.setString(7, m.getBirth1());
				pstmt.setString(8, m.getBirth2());
				pstmt.setString(9, m.getBirth3());
				
				rs= pstmt.executeQuery();
				
				while(rs.next()) {
					m.setPass(rs.getString("pass"));
				}
				rs.close();
				pstmt.close();
				d.con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	
	//회원정보 가져오기
	public Member oneMember(String id) {
		d.getCon();
		Member m =  new Member();
		try {
			String sql = "select * from member where id=?";
			
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				m.setId(rs.getString("id"));
				m.setPass(rs.getString("pass"));
				m.setName(rs.getString("name"));
				m.setBirth1(rs.getString("birth1"));
				m.setBirth2(rs.getString("birth2"));
				m.setBirth3(rs.getString("birth3"));
				m.setGender(rs.getString("gender"));
				m.setEmail1(rs.getString("email1"));
				m.setEmail2(rs.getString("email2"));
				m.setLevel(rs.getString("level"));
				m.setZipcode(rs.getString("zipcode"));
				m.setZipcode1(rs.getString("zipcode1"));
				m.setZipcode2(rs.getString("zipcode2"));
				m.setZipcode3(rs.getString("zipcode3"));
				m.setZipcode4(rs.getString("zipcode4"));
				m.setPhone1(rs.getString("phone1"));
				m.setPhone2(rs.getString("phone2"));
				m.setPhone3(rs.getString("phone3"));
				m.setSigndate(rs.getString("signdate"));
				m.setDelete_id(rs.getString("delete_id"));
				m.setMileage(rs.getInt("mileage"));
				m.setIncome(rs.getInt("income"));
	
			}
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	//로그인
	public Member memberLogin(String id, String pass) {
		d.getCon();
		Member m = new Member();
		try {
			String sql = "select * from member where id=? and pass=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				m.setId(rs.getString("id"));
				m.setPass(rs.getString("pass"));
				m.setName(rs.getString("name"));
				m.setLevel(rs.getString("level"));
			}
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	//회원수정
	public int updateMember(Member m) {
		d.getCon();
		
		int num = 0;
		try {
			String sql ="update member set pass=?,name=?,birth1=?,birth2=?,birth3=?,gender=?,email1=?,email2=?,zipcode=?,zipcode1=?,zipcode2=?,zipcode3=?,zipcode4=?,phone1=?,phone2=?,phone3=?,level=? where id=?";
			pstmt=d.con.prepareStatement(sql);
			
			pstmt.setString(1, m.getPass());
			pstmt.setString(2, m.getName());
			pstmt.setString(3, m.getBirth1());
			pstmt.setString(4, m.getBirth2());
			pstmt.setString(5, m.getBirth3());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getEmail1());
			pstmt.setString(8, m.getEmail2());
			pstmt.setString(9, m.getZipcode());
			pstmt.setString(10, m.getZipcode1());
			pstmt.setString(11, m.getZipcode2());
			pstmt.setString(12, m.getZipcode3());
			pstmt.setString(13, m.getZipcode4());
			pstmt.setString(14, m.getPhone1());
			pstmt.setString(15, m.getPhone2());
			pstmt.setString(16, m.getPhone3());
			pstmt.setString(17, m.getLevel());
			pstmt.setString(18, m.getId());
			
			num = pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	//회원탈퇴
	public void deleteId(String id) {
		d.getCon();
		
		try {
			String sql = "update member set pass='',name='',birth1='',birth2='',birth3='',gender='M',email1='',email2='',level='1',zipcode='',zipcode1='',zipcode2='',zipcode3='',zipcode4='',phone1='',phone2='',phone3='',delete_id='y' where id=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	영주형꺼복사
	//회원 목록
	public ArrayList<Member> listAllMember(int startRow,int endRow) {
		d.getCon();
		
		ArrayList<Member> v = new ArrayList<Member>();
		
		try {
			
			String sql = "select * from member limit ?,?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Member m = new Member();
				
				m.setId(rs.getString("id"));
				m.setName(rs.getString("name"));
				m.setLevel(rs.getString("level"));
				m.setBirth1(rs.getString("birth1"));
				m.setBirth2(rs.getString("birth2"));
				m.setBirth3(rs.getString("birth3"));
				m.setGender(rs.getString("gender"));
				m.setPhone1(rs.getString("phone1"));
				m.setPhone2(rs.getString("phone2"));
				m.setPhone3(rs.getString("phone3"));
				
				v.add(m);
			}
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//관리자 회원목록 count 
	
	//관리자주문내역 카운트 
	public int memberCount() {		
		d.getCon();		
		int num = 0;
		try {
			String sql = "select count(*) from member";
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
	
	//회원 선택삭제
	public void deleteMember(String id_ch) {
		d.getCon();
		
		try {
			String sql = "update member set pass='',name='',birth1='',birth2='',birth3='',email1='',email2='',level='',zipcode='',zipcode1='',zipcode2='',zipcode3='',zipcode4='',phone1='',phone2='',phone3='',signdate='',delete_id='y' where id =?";
			
			pstmt= d.con.prepareStatement(sql);
			pstmt.setString(1, id_ch);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	orderllist이동시 구매자 정보출력
	public Member selectMember(String id) {
		d.getCon();
		
		Member m  = new Member();
		try {
			
			String sql = "select * from member where id=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				m.setName(rs.getString("name"));
				m.setPhone1(rs.getString("phone1"));
				m.setPhone2(rs.getString("phone2"));
				m.setPhone3(rs.getString("phone3"));
				m.setZipcode(rs.getString("zipcode"));
				m.setZipcode1(rs.getString("zipcode1"));
				m.setZipcode2(rs.getString("zipcode2"));
				m.setZipcode3(rs.getString("zipcode3"));
				m.setZipcode4(rs.getString("zipcode4"));
				
			}
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
		
	}
//	주문완료 처리시 총수출 넣기
	public void insertIncome(String cp_id_ch ,int sumcp_price_ch) {
		d.getCon();
		
		try {
			String sql = "UPDATE member SET income = income + ? WHERE id=?"; 
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, sumcp_price_ch);
			pstmt.setString(2, cp_id_ch);
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	//멤버의 마일리지 조회
	public int memberMileage(String id) {
		d.getCon();
		int mile = 0;
		try {
			String sql = "select mileage from member where id=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				mile = rs.getInt("mileage");
			}
			rs.close();
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mile;
	}
	//결제시 멤버 마일리지 차감
	public void memberMileageMinus(String id,int y) {
		d.getCon();
		try {
			String sql = "update member set mileage = mileage - "+y+" where id='"+id+"'";
			pstmt = d.con.prepareStatement(sql);
			pstmt.executeUpdate();		
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//회원등급 일괄변경
		public void levelChange(String level_ch,String id_ch) {
			d.getCon();
			
			try {
				String sql ="update member set level=? where id=?";
				pstmt=d.con.prepareStatement(sql);
				pstmt.setString(1, level_ch);
				pstmt.setString(2, id_ch);
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
