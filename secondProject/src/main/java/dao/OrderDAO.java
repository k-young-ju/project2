package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;

import model.Cart;
import model.Member;
import model.Order;

public class OrderDAO {
	
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	DAO d = new DAO();
	
	//주문 시 DB적재
	public void insertOrder(Order o, int point1) {
		d.getCon();
		
		try {
			String sql = "insert into order1 (od_id,mb_id,od_price,od_point,od_status,od_name,od_phone,od_zip,od_addr1,od_addr2,od_addr3,od_addr4,od_b_name,od_b_phone,od_b_zip,od_b_addr1,od_b_addr2,od_b_addr3,od_b_addr4,require1,signdate,use_point) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, o.getOd_id());
			pstmt.setString(2, o.getMb_id());
			pstmt.setInt(3, o.getOd_price());
			pstmt.setInt(4, o.getOd_point());
			pstmt.setString(5, o.getOd_status());
			pstmt.setString(6, o.getOd_name());
			pstmt.setString(7, o.getOd_phone());
			pstmt.setString(8, o.getOd_zip());
			pstmt.setString(9, o.getOd_addr1());
			pstmt.setString(10, o.getOd_addr2());
			pstmt.setString(11, o.getOd_addr3());
			pstmt.setString(12, o.getOd_addr4());
			pstmt.setString(13, o.getOd_b_name());
			pstmt.setString(14, o.getOd_b_phone());
			pstmt.setString(15, o.getOd_b_zip());
			pstmt.setString(16, o.getOd_b_addr1());
			pstmt.setString(17, o.getOd_b_addr2());
			pstmt.setString(18, o.getOd_b_addr3());
			pstmt.setString(19, o.getOd_b_addr4());
			pstmt.setString(20, o.getRequire1());
			pstmt.setString(21, o.getSigndate());
			pstmt.setInt(22, point1);
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// 주문한 물품 내역
		public Order selectOrder(String id,String od_id) {
			d.getCon();
			
			String str = "and mb_id='"+id+"'";
			if(id==null) {
				str = " and od_id='"+od_id+"'";
			}
			;
			Order o = new Order();
			try {
				String sql = "select * from order1 where (1) "+str+" order by od_uid desc limit 1";
				pstmt = d.con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					o.setOd_name(rs.getString("od_name"));
					o.setOd_phone(rs.getString("od_phone"));
					o.setOd_zip(rs.getString("od_zip"));
					o.setOd_addr1(rs.getString("od_addr1"));
					o.setOd_addr2(rs.getString("od_addr2"));
					o.setOd_addr3(rs.getString("od_addr3"));
					o.setOd_addr4(rs.getString("od_addr4"));
					o.setOd_b_name(rs.getString("od_b_name"));
					o.setOd_b_phone(rs.getString("od_b_phone"));
					o.setOd_b_zip(rs.getString("od_b_zip"));
					o.setOd_b_addr1(rs.getString("od_b_addr1"));
					o.setOd_b_addr2(rs.getString("od_b_addr2"));
					o.setOd_b_addr3(rs.getString("od_b_addr3"));
					o.setOd_b_addr4(rs.getString("od_b_addr4"));
					o.setRequire1(rs.getString("require1"));
					o.setOd_price(rs.getInt("od_price"));
					o.setOd_point(rs.getInt("od_point"));
				}
				rs.close();
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return o;
		}	
	
	//바로구매를 통해 주문 시 cart status 주문상태로변경
	public void viewCartUpdate(int uid,String od_id) {
		
		d.getCon();
				
		try {
			String sql = "update cart set ct_status='주문',o_id=? where uid=? and ct_status='바로'";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setNString(1, od_id);
			pstmt.setInt(2, uid);
			
			
			pstmt.executeUpdate();
			
			
			pstmt.close();
			d.con.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	
	//장바구니를 통해 선택주문시 주문상태로 변경
	public void statusChange(int newoid_ch,String od_id) {
		d.getCon();	
		
		
		try {
				String sql  = "update cart set ct_status='주문',o_id=? where ct_uid=?";
				pstmt=d.con.prepareStatement(sql);
				pstmt.setString(1, od_id);		
				pstmt.setInt(2, newoid_ch);
							
				pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//장바구니통해서 선택안하고 전체주문시 주문상태로 변경
	public void statusChange1(String id) {
		d.getCon();
		
		try {
			String sql  = "update cart set ct_status='주문' where m_id=? and ct_status='준비'";
			pstmt=d.con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();

			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	
	//장바구니를 통한 선택주문 후 결제시 주문내역에서 목록출력
	public Cart viewList(String id,int newcheckOrder,String od_id) {
		d.getCon();
			
		Cart c =  new Cart();
	
		String str = " and m_id='"+id+"'";
		if(id== null) {
			str = " and o_id='"+od_id+"'";
		}
		try {
				String sql  = "select *,(select n_writer from item where uid=cart.uid ) as n_writer from cart where ct_uid=?"+str+" and ct_status='주문'";
				pstmt=d.con.prepareStatement(sql);
				pstmt.setInt(1, newcheckOrder);
				
				rs = pstmt.executeQuery();
			
				while(rs.next()) {
					c.setCt_uid(rs.getInt("ct_uid"));
					c.setO_id(rs.getString("o_id"));
					c.setM_id(rs.getString("m_id"));
					c.setId(rs.getString("id"));
					c.setUid(rs.getInt("uid"));
					c.setPrice1(rs.getInt("price1"));
					c.setMileage(rs.getInt("mileage"));	
					c.setQty(rs.getInt("qty"));
					c.setCt_date(rs.getString("ct_date"));
					c.setCt_status(rs.getString("ct_status"));
					c.setSubject(rs.getString("subject"));
					c.setImage(rs.getString("image"));
					c.setN_writer(rs.getString("n_writer"));
				}
			rs.close();
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	
	//장바구니를 통한 선택x 전체바로주문시 목록출력
	//장바구니 목록
	public ArrayList<Cart> viewList1(String id) {
		d.getCon();
		
		
		ArrayList<Cart> v =  new ArrayList<Cart>();
		
		
		try {
			String sql  = "select *,(select n_writer from item where uid=cart.uid ) as n_writer from cart where m_id=? and ct_status='주문'";
			pstmt=d.con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Cart c = new Cart();
				c.setCt_uid(rs.getInt("ct_uid"));
				c.setO_id(rs.getString("o_id"));
				c.setM_id(id);
				c.setId(rs.getString("id"));
				c.setUid(rs.getInt("uid"));
				c.setPrice1(rs.getInt("price1"));
				c.setMileage(rs.getInt("mileage"));
				c.setQty(rs.getInt("qty"));
				c.setCt_date(rs.getString("ct_date"));
				c.setCt_status(rs.getString("ct_status"));
				c.setSubject(rs.getString("subject"));
				c.setImage(rs.getString("image"));
				c.setN_writer(rs.getString("n_writer"));
				
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
	
	//뷰 ->바로구매 ->장바구니결제시 목록
		public ArrayList<Cart> viewList2(String id,int uid,int ct_uid,String od_id) {
			d.getCon();
			String str = " and m_id='"+id+"'";
			if(id==null) {
				str = " and o_id='"+od_id+"'";
			}
				
			ArrayList<Cart> v =  new ArrayList<Cart>();
		
			try {
				String sql  = "select *,(select n_writer from item where uid=cart.uid ) as n_writer from cart where uid=?"+str+" and ct_uid=? and ct_status='주문'";
				pstmt=d.con.prepareStatement(sql);
				
				pstmt.setInt(1, uid);
				pstmt.setInt(2, ct_uid);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Cart c = new Cart();
					c.setCt_uid(rs.getInt("ct_uid"));
					c.setO_id(rs.getString("o_id"));
					c.setM_id(rs.getString("m_id"));
					c.setId(rs.getString("id"));
					c.setUid(rs.getInt("uid"));
					c.setPrice1(rs.getInt("price1"));
					c.setMileage(rs.getInt("mileage"));
					c.setQty(rs.getInt("qty"));
					c.setCt_date(rs.getString("ct_date"));
					c.setCt_status(rs.getString("ct_status"));
					c.setSubject(rs.getString("subject"));
					c.setImage(rs.getString("image"));
					c.setN_writer(rs.getString("n_writer"));
					
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
	
	//관리자주문내역 총출력
	public ArrayList<Order> listOrder(int startRow,int endRow){
		
		d.getCon();
		ArrayList<Order> od = new ArrayList<Order>();
		try {
			String sql = "select * from order1 where (1) and od_status IN('주문','완료') order by od_status asc,od_uid desc limit ?,?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Order o = new Order();
				o.setOd_uid(rs.getInt("od_uid"));
				o.setMb_id(rs.getString("mb_id"));
				o.setOd_price(rs.getInt("od_price"));
				o.setOd_point(rs.getInt("od_point"));
				o.setOd_name(rs.getString("od_name"));
				o.setOd_status(rs.getString("od_status"));
				o.setRequire1(rs.getString("require1"));
				o.setOd_id(rs.getNString("od_id"));
				od.add(o);
				
			}
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return od;
	}
	
	//관리자주문내역 카운트 
	public int orderCount() {		
		d.getCon();		
		int num = 0;
		try {
			String sql = "select count(*) from order1 where (1) and od_status IN('주문','완료') order by od_status asc,od_uid desc;";
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
	
	//관리자 주문내역에서 완료상태로변경 
	public void changeOrder(String id_ch,String signdate) {
		d.getCon();
		
		try {
			String sql = "update order1 set od_status='완료',signdate=? where od_uid=?";
			pstmt= d.con.prepareStatement(sql);
			pstmt.setString(1, signdate);
			pstmt.setString(2, id_ch);
			pstmt.executeUpdate();	
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//관리자페이지에서 완료변경시 구매자 아이디 포인트업데이트	
	public void UpdateIdPoint(String id_ch) {
		d.getCon();
		
		try {
			String sql = "UPDATE member mb INNER JOIN order1 od ON mb.id=od.mb_id SET mileage = mileage + od_point where od.od_uid=? and od.od_status='주문'";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, id_ch);
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}	
	

	// 주문한 물품 내역 상세보기
	public Order selectOrderDetail(String od_id) {
		d.getCon();
		Order o = new Order();
		try {
			String sql = "select * from order1 where od_id=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, od_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				o.setOd_name(rs.getString("od_name"));
				o.setOd_phone(rs.getString("od_phone"));
				o.setOd_zip(rs.getString("od_zip"));
				o.setOd_addr1(rs.getString("od_addr1"));
				o.setOd_addr2(rs.getString("od_addr2"));
				o.setOd_addr3(rs.getString("od_addr3"));
				o.setOd_addr4(rs.getString("od_addr4"));
				o.setOd_b_name(rs.getString("od_b_name"));
				o.setOd_b_phone(rs.getString("od_b_phone"));
				o.setOd_b_zip(rs.getString("od_b_zip"));
				o.setOd_b_addr1(rs.getString("od_b_addr1"));
				o.setOd_b_addr2(rs.getString("od_b_addr2"));
				o.setOd_b_addr3(rs.getString("od_b_addr3"));
				o.setOd_b_addr4(rs.getString("od_b_addr4"));
				o.setRequire1(rs.getString("require1"));
				o.setOd_price(rs.getInt("od_price"));
				o.setOd_point(rs.getInt("od_point"));
				o.setOd_status(rs.getString("od_status"));
				o.setOd_id(rs.getString("od_id"));
				o.setUse_point(rs.getInt("use_point"));
				
	
			}
			rs.close();
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return o;
	}	
	
	//완료가 아닐때만 각종처리할수있도록
	public String selectOrderStatus(String cp_id_ch) {
		d.getCon();
		
		String s = "";
		try {
			String sql = "select od_status from order1 where od_uid=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, cp_id_ch);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				s = rs.getString("od_status");
			}
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	//완료가 아닐때만 각종처리할수있도록
		public String selectOrderStatus2(String ids) {
			d.getCon();
			
			String s = "";
			try {
				String sql = "select od_status from order1 where od_id=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, ids);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					s = rs.getString("od_status");
				}
				rs.close();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return s;
		}	
	
//	마이페이지 주문내역 리스트 출력  신품만
	public LinkedList<Order> listMyOrder(String session_id,int startRow,int endRow){
		d.getCon();
		
		LinkedList<Order> v7 = new LinkedList<Order>();
		try {
//			String sql = "select * from order1 od INNER JOIN cart ct on od.od_id=ct.o_id where od.od_id=ct.o_id and od.mb_id=? and od.od_status IN('완료','주문') and ct.ct_order_status='신품' limit ?,?";
			String sql = "SELECT * FROM order1 WHERE mb_id=? AND od_id IN (SELECT o_id FROM cart WHERE ct_order_status='신품' AND m_id=?) and od_status IN('완료','주문') limit ?,?";
			
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, session_id);
			pstmt.setString(2, session_id);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order o = new Order();
				o.setOd_name(rs.getString("od_name"));
				o.setOd_phone(rs.getString("od_phone"));
				o.setOd_zip(rs.getString("od_zip"));
				o.setOd_addr1(rs.getString("od_addr1"));
				o.setOd_addr2(rs.getString("od_addr2"));
				o.setOd_addr3(rs.getString("od_addr3"));
				o.setOd_addr4(rs.getString("od_addr4"));
				o.setOd_b_name(rs.getString("od_b_name"));
				o.setOd_b_phone(rs.getString("od_b_phone"));
				o.setOd_b_zip(rs.getString("od_b_zip"));
				o.setOd_b_addr1(rs.getString("od_b_addr1"));
				o.setOd_b_addr2(rs.getString("od_b_addr2"));
				o.setOd_b_addr3(rs.getString("od_b_addr3"));
				o.setOd_price(rs.getInt("od_price"));
				o.setOd_point(rs.getInt("od_point"));
				o.setOd_id(rs.getString("od_id"));
				o.setMb_id(rs.getString("mb_id"));
				o.setRequire1(rs.getString("require1"));
				o.setOd_status(rs.getString("od_status"));
				v7.add(o);
			}
			rs.close();
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v7;
	}
	
//	마이페이지 주문내역 리스트 출력  중고만
	public LinkedList<Order> listMyOrderUsed(String session_id,int startRow,int endRow){
		d.getCon();
		
		LinkedList<Order> v8 = new LinkedList<Order>();
		try {
			String sql = "select * from order1 od INNER JOIN cart ct on od.od_id=ct.o_id where od.mb_id=? and od.od_status IN('완료','주문') and ct.ct_order_status='중고' limit ?,?";
//			String sql = "UPDATE member mb INNER JOIN order1 od ON mb.id=od.mb_id SET mileage = mileage + od_point where od.od_uid=? and od.od_status='주문'";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, session_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order o = new Order();
				o.setOd_name(rs.getString("od_name"));
				o.setOd_phone(rs.getString("od_phone"));
				o.setOd_zip(rs.getString("od_zip"));
				o.setOd_addr1(rs.getString("od_addr1"));
				o.setOd_addr2(rs.getString("od_addr2"));
				o.setOd_addr3(rs.getString("od_addr3"));
				o.setOd_addr4(rs.getString("od_addr4"));
				o.setOd_b_name(rs.getString("od_b_name"));
				o.setOd_b_phone(rs.getString("od_b_phone"));
				o.setOd_b_zip(rs.getString("od_b_zip"));
				o.setOd_b_addr1(rs.getString("od_b_addr1"));
				o.setOd_b_addr2(rs.getString("od_b_addr2"));
				o.setOd_b_addr3(rs.getString("od_b_addr3"));
				o.setOd_price(rs.getInt("od_price"));
				o.setOd_point(rs.getInt("od_point"));
				o.setOd_id(rs.getString("od_id"));
				o.setMb_id(rs.getString("mb_id"));
				o.setRequire1(rs.getString("require1"));
				o.setOd_status(rs.getString("od_status"));
				o.setId(rs.getString("id"));
				o.setSubject(rs.getString("subject"));				
				v8.add(o);
			}
			rs.close();
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v8;
	}
	
	//주문상태 취소로
	public void cancelOrder(String a) {
		d.getCon();
		try {
			String sql = "update order1 set od_status='취소' where od_id=? and od_status='주문'";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, a);
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//주문내역 신품 개수
	public int orderCount(String session_id) {		
		d.getCon();		
		
		int num = 0;
		try {
			String sql = "select count(*) from order1 od INNER JOIN cart ct where od.od_id=ct.o_id and od.mb_id=? and od.od_status IN('완료','주문') and ct.ct_order_status='신품'";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, session_id);
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
	
	//주문내역  중고 개수
	public int orderUsedCount(String session_id) {		
		d.getCon();		
		
		int num = 0;
		try {
			String sql = "select count(*) from order1 od INNER JOIN cart ct where od.od_id=ct.o_id and od.mb_id=? and od.od_status IN('완료','주문') and ct.ct_order_status='중고'";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, session_id);
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
	//비회원 주문 주문내용
		public Order listNonOrder(String non_id) {
			d.getCon();
			Order o = new Order();
			try {
				String sql = "select * from order1 where od_id=?";
				pstmt= d.con.prepareStatement(sql);
				pstmt.setString(1, non_id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					o.setOd_uid(rs.getInt("od_uid"));
					o.setOd_price(rs.getInt("od_price"));
					o.setOd_status(rs.getString("od_status"));
					o.setOd_name(rs.getString("od_name"));
					o.setOd_phone(rs.getString("od_phone"));
					o.setOd_zip(rs.getString("od_zip"));
					o.setOd_addr1(rs.getString("od_addr1"));
					o.setOd_addr2(rs.getString("od_addr2"));
					o.setOd_addr3(rs.getString("od_addr3"));
					o.setOd_addr4(rs.getString("od_addr4"));
					o.setOd_b_name(rs.getString("od_b_name"));
					o.setOd_b_phone(rs.getString("od_b_phone"));
					o.setOd_b_zip(rs.getString("od_b_zip"));
					o.setOd_b_addr1(rs.getString("od_b_addr1"));
					o.setOd_b_addr2(rs.getString("od_b_addr2"));
					o.setOd_b_addr3(rs.getString("od_b_addr3"));
					o.setOd_b_addr4(rs.getString("od_b_addr4"));
					o.setRequire1(rs.getString("require1"));
					o.setSigndate(rs.getString("signdate"));
				}
				rs.close();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return o;
		}
		
		//비회원 주문있는지 확인
		public int countOrder(String non_id) {
			d.getCon();
			int num= 0;
			try {
				String sql = "select count(*) from order1 where od_id=?";
				pstmt=d.con.prepareStatement(sql);
				pstmt.setString(1, non_id);
				rs =  pstmt.executeQuery();
				
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
		
		//총 매출 가져오기
		public int allSales(String year,String month) {
			d.getCon();
			int  num = 0;
			
			String month2= month;
			if(month.length() ==1) {
				month2 = "0"+month;
			}
			
			try {
				String sql = "select sum(od_price) from order1 where od_status='완료' and left(signdate,4)=? and mid(signdate,6,2)=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, year);
				pstmt.setString(2, month2);
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
		//지급된 마일리지의 총합
		public int odTotalPoint(String year,String month) {
			d.getCon();
			
			String month2= month;
			if(month.length() ==1) {
				month2 = "0"+month;
			}
			
			int num=0;
			try {
				String sql = "select sum(od_point) from order1 where od_status='완료' and left(signdate,4)=? and mid(signdate,6,2)=?";
				pstmt=d.con.prepareStatement(sql);
				pstmt.setString(1, year);
				pstmt.setString(2, month2);
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
		//사용 포인트 총합
		public int useTotalPoint(String year,String month) {
			d.getCon();
			int num = 0;
			String month2= month;
			if(month.length() ==1) {
				month2 = "0"+month;
			}
			
			try {
				String sql ="select sum(use_point) from order1 where od_status='완료' and left(signdate,4)=? and mid(signdate,6,2)=?";
				pstmt= d.con.prepareStatement(sql);
				pstmt.setString(1, year);
				pstmt.setString(2, month2);
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
		public int orderAccount(String year,String month) {
			d.getCon();
			int num = 0;
			String month2= month;
			if(month.length() ==1) {
				month2 = "0"+month;
			}
			
			try {
				String sql ="select count(*) from order1 where od_status='완료' and left(signdate,4)=? and mid(signdate,6,2)=?";
				pstmt= d.con.prepareStatement(sql);
				pstmt.setString(1, year);
				pstmt.setString(2, month2);
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
		
		//배송비를 제외한 주문 금액가져오기
		public int oneSales(String year,String month) {
			d.getCon();
			int num = 0;
			String month2= month;
			if(month.length() ==1) {
				month2 = "0"+month;
			}
			int sum = 0;
			try {
				String sql ="select od_price from order1 where od_status='완료' and left(signdate,4)=? and mid(signdate,6,2)=?";
				pstmt= d.con.prepareStatement(sql);
				pstmt.setString(1, year);
				pstmt.setString(2, month2);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					num = rs.getInt(1);
					if(num>30000) {
						sum += num;
					}else {
						sum+=num-3000;
					}
				}
				rs.close();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return sum;
		}
}
