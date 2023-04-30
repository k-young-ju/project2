package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import model.Cart;
import model.Item;
import model.Jjim;
import model.Order;

public class CartDAO {
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();

	//장바구니 수량체크
	public int cartCheck(int uid,String id,String o_id) {
		d.getCon();
		int num = 0;
		
		String str = " and m_id='"+id+"'";
		if(id==null) {
			str = " and o_id='"+o_id+"'";
		}
		
		try {
			String sql = "select count(*) from cart where uid=?"+str+" and ct_status='준비'";
			pstmt=d.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
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
	
	//장바구니 추가
	public void insertCart(Cart c) {
		d.getCon();
		try {
			
			String sql = "insert into cart (o_id,m_id,id,uid,price1,mileage,subject,ct_date,image,qty,ct_status,ct_order_status) values (?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, c.getO_id());
			pstmt.setString(2, c.getM_id());
			pstmt.setString(3, c.getId());
			pstmt.setInt(4, c.getUid());
			pstmt.setInt(5, c.getPrice1());
			pstmt.setInt(6, c.getMileage());
			pstmt.setString(7, c.getSubject());
			pstmt.setString(8, c.getCt_date());
			pstmt.setString(9, c.getImage());
			pstmt.setInt(10, c.getQty());
			pstmt.setString(11, c.getCt_status());
			pstmt.setString(12, c.getCt_order_status());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//중고물품 장바구니 등록
		public void insertCartUsed(Cart c) {
			d.getCon();
			
			try {
				String sql = "insert into cart (o_id,m_id,id,uid,price1,subject,ct_date,image,qty,ct_status,ct_order_status) values (?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, c.getO_id());
				pstmt.setString(2, c.getM_id());
				pstmt.setString(3, c.getId());
				pstmt.setInt(4, c.getUid());
				pstmt.setInt(5, c.getPrice1());
				pstmt.setString(6, c.getSubject());
				pstmt.setString(7, c.getCt_date());
				pstmt.setString(8, c.getImage());
				pstmt.setInt(9, c.getQty());
				pstmt.setString(10,c.getCt_status());
				pstmt.setString(11,c.getCt_order_status());
				
				pstmt.executeUpdate();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	//수량 변경
	public void updateCart(Cart c) {
		d.getCon();
		
		try {
			String sql ="update cart set qty=qty+? where uid=? and ct_status='준비'";
			pstmt=d.con.prepareStatement(sql);
			
			pstmt.setInt(1, c.getQty());
			pstmt.setInt(2, c.getUid());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//장바구니 목록
	public ArrayList<Cart> listALL(String id) {
		d.getCon();
		
		
		ArrayList<Cart> v =  new ArrayList<Cart>();
		
		
		try {
			String sql  = "select *,(select n_writer from item where uid=cart.uid ) as n_writer,(select qty from item where uid=cart.uid) as qtys from cart where m_id=? and ct_status='준비'";
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
				c.setQtys(rs.getInt("qtys"));			
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
	
	//장바구니 아이템재고수량조회
	public Item itemQty(String id) {
		d.getCon();
		
		Item it = new Item();
		try {
			String sql  = "select qty from item where uid=?";
			pstmt=d.con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
			}
			rs.close();
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return it;
	}	
	
	//바뀐 수량
	public void qtyZero(int ct_uid,String id) {
		d.getCon();
		try {
			
			String sql = "update cart set qty=1 where ct_uid=? and m_id=? and qty<=0";
			
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, ct_uid);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			
		}
	}		

	public int qtyNew(int ct_uid,String id) {
		d.getCon();
		int num = 0;
		try {
			
			String sql = "select qty from cart where ct_uid=? and m_id=?";
			
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, ct_uid);
			pstmt.setString(2, id);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				num = rs.getInt("qty");
			}
			rs.close();
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			
		}
		return num;
	}

	//버튼 클릭시 수량증가
	public void qtyPlus(int ct_uid, String id) {
		d.getCon();
		
		try {
			String sql ="update cart set qty=qty+1 where ct_uid=? and m_id=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, ct_uid);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//장바구니 삭제
	public void cartDelete(String ct_uid) {
		d.getCon();
		
		try {
			String sql  ="delete from cart where ct_uid=?";
			
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, ct_uid);
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//장바구니에서 선택구매시 목록출력
	public Cart listALLLL(String id,int newcheckOrder,String o_id) {
		d.getCon();
			
		Cart c =  new Cart();
		String str = " and m_id='"+id+"'";
		if(id == null) {
			str = " and o_id='"+o_id+"'";
		}
		
		try {
				String sql  = "select *,(select n_writer from item where uid=cart.uid ) as n_writer from cart where ct_uid=?"+str+" and ct_status='준비'";
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
	
	//장바구니에서 checkuid수량과 카트에담긴 수량 동일체크용도
	
	public int cartCount(String id,String o_id) {
		d.getCon();
		String str = " and m_id='"+id+"'";
		if(id==null) {
			str = " and o_id='"+o_id+"'";
		}
		
		int num = 0;
		try {
			String sql = "select count(*) from cart where (1)"+str+" and ct_status='준비'";
			pstmt=d.con.prepareStatement(sql);
			
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
	
	
	
	//바로구매시작
	
	//뷰에서 이미있을시 업데이트처리로 중복으로뜨지않게
	//수량 변경
	public void updateCartt(Cart c) {
		d.getCon();
		
		try {
			String sql ="update cart set qty=? where uid=? and ct_status='바로'";
			pstmt=d.con.prepareStatement(sql);
			
			pstmt.setInt(1, c.getQty());
			pstmt.setInt(2, c.getUid());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//뷰에서 바로구매시 이미 바로구매한게 있는지
	public int cartCheckk(int uid,String id,String o_id) {
		d.getCon();
		int num = 0;
		
		String str = " and m_id='"+id+"'";
		if(id ==null) {
			str = " and o_id='"+o_id+"'";
		}
		
		try {
			String sql = "select count(*) from cart where uid=?"+str+" and ct_status='바로'";
			pstmt=d.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
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
	
	//뷰에서 바로구매시 목록
		public ArrayList<Cart> listALLL(String id,int uid,String o_id) {
			d.getCon();
			
			String str = " and m_id='"+id+"'";
			if(id ==null) {
				str = " and o_id='"+o_id+"'";
			}
			
			ArrayList<Cart> v =  new ArrayList<Cart>();
		
			try {
				String sql  = "select *,(select n_writer from item where uid=cart.uid ) as n_writer from cart where uid=?"+str+" and ct_status='바로'";
				pstmt=d.con.prepareStatement(sql);
				
				pstmt.setInt(1, uid);
				
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
	
	
	//바로구매 목록만 띄우기
		public Cart cartDirectBuySearch(int uid) {
			d.getCon();
			Cart c =  new Cart();
			try {
				String sql = "select *,(select n_writer from item where uid=? ) as n_writer from cart where uid=? and ct_status='준비'";
				pstmt=d.con.prepareStatement(sql);
				pstmt.setInt(1, uid);
				pstmt.setInt(2, uid);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					c.setImage(rs.getString("image"));
					c.setMileage(rs.getInt("mileage"));
					c.setPrice1(rs.getInt("price1"));
					c.setSubject(rs.getString("subject"));
					c.setQty(rs.getInt("qty"));
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
		
		//장바구니에서 결제버튼누를시 직접 input 수정시 qty업데이트
		public Cart qtyModify(int qty,int ct_uid,String id) {
			d.getCon();
			Cart f = new Cart();
			try {
				String sql ="update cart set qty=? where ct_uid=? and m_id=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setInt(1, qty);
				pstmt.setInt(2, ct_uid);
				pstmt.setString(3, id);
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
		
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return f;
		}		
		

		//선택삭제
		public void deleteCart(String list_ch) {
			d.getCon();
			
			try {
				String sql = "delete from cart where ct_uid=?";
				
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, list_ch);
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
			
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
		//주문페이지 갈 시 qty수량 업데이트
		public void updateQty(int newUids_ch,int newQty_ch,String id,String o_id) {
			d.getCon();
			
			String str = " and m_id='"+id+"'";
			if(id==null) {
				str = " and o_id='"+o_id+"'";
			}
			try {
				String sql = "update cart set qty=? where uid=?"+str+"";	
				pstmt = d.con.prepareStatement(sql);
				pstmt.setInt(1, newQty_ch);
				pstmt.setInt(2, newUids_ch);
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
			
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}				
		
		// 주문한 물품 내역 상세보기 카트부분
		public Vector<Cart> selectCartDetail(String od_id) {
			d.getCon();
			Vector<Cart> scd = new Vector<Cart>();
		
			try {
					String sql  = "select *,(select n_writer from item where uid=cart.uid ) as n_writer from cart where (o_id=? and ct_status='주문') or (o_id=? and ct_status='완료')";
					pstmt=d.con.prepareStatement(sql);
					pstmt.setString(1, od_id);
					pstmt.setString(2, od_id);
					rs = pstmt.executeQuery();
				
					while(rs.next()) {
						Cart c =  new Cart();
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
						scd.add(c);
					}
				rs.close();
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return scd;
		}
		
		//관리자 주문내역에서 완료상태로변경시 카트상태도 완료로 변경 
				public void changeCart(String oid_ch,String signdate) {
					d.getCon();
					
					try {
						String sql = "update cart set ct_status='완료',ct_date=? where o_id = ?";
						pstmt= d.con.prepareStatement(sql);
						pstmt.setString(1, signdate);
						pstmt.setString(2, oid_ch);
						pstmt.executeUpdate();	
						pstmt.close();
						d.con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
		
		
		//관리자페이지에서 완료상태로변경시 판매(등록자 아이디search)
		public String selectCartCompleteID(String oid_ch) {
			d.getCon();
			
			String cp_id ="";
			try {
				String sql = "select id from cart where o_id=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, oid_ch);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					cp_id = rs.getString("id");
				}
				
				rs.close();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return cp_id;
		}
		
		//관리자 페이지에서 완료상태로변경시 판매 가격 search		
		public int selectCartCompletePrice(String oid_ch) {
			d.getCon();
			
			int cp_price = 0;
			try {
				String sql = "select price1 from cart where o_id=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, oid_ch);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					cp_price = (int)(rs.getInt("price1")*0.9);
				}
				
				rs.close();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return cp_price;
		}		
		
		//관리자 페이지에서 완료상태로변경시 아이템에넣을 qty 검색
		public int selectCartCompleteQty(String oid_ch) {
			d.getCon();
			
			int cp_qty=0;
			try {
				String sql = "select qty from cart where o_id=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, oid_ch);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					cp_qty = (int)(rs.getInt("qty"));
				}
				rs.close();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return cp_qty;
		}
		
		//사용자가 결제시  아이템에넣을 qty 검색
		public String selectCartCompleteQty2(String ct_uids) {
			d.getCon();
			
			String cp_qty="";
			try {
				String sql = "select qty from cart where ct_uid=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, ct_uids);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					cp_qty += (int)(rs.getInt("qty"))+",";
				}
				rs.close();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return cp_qty;
		}		
		
		//관리자 페이지에서 완료상태로변경시 아이템에 매칭할 uid 서치
		public int selectCartCompleteUid(String oid_ch) {
			d.getCon();
			
			int cp_uid=0;
			try {
				String sql = "select uid from cart where o_id=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, oid_ch);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					cp_uid = (int)(rs.getInt("uid"));
				}
				rs.close();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return cp_uid;
		}		
		//관리자 페이지에서 완료상태로변경시 아이템에 매칭할 uid 서치
		public String selectCartCompleteUid2(String ct_uids) {
			d.getCon();
			
			String cp_uid="";
			try {
				String sql = "select uid from cart where ct_uid=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, ct_uids);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					cp_uid += (int)(rs.getInt("uid"))+",";
				}
				rs.close();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return cp_uid;
		}				
		
		//중고물품 카트 정보 확인
		public int countCart(String id,int uid,String o_id) {
			d.getCon();
			
			int num = 0;
			
			String str = " and m_id='"+id+"'";
			if(id==null) {
				str = " and o_id='"+o_id+"'";
			}
			
			try {
				String sql = "select count(*) from cart where uid=?"+str+" and ct_status='바로' and ct_order_status='중고'";
				pstmt=d.con.prepareStatement(sql);
				pstmt.setInt(1, uid);
				rs =  pstmt.executeQuery();
				
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
		//찜 목록 개수
		public int jjimListCount(String id) {
			d.getCon();
			int num = 0;
			
			try {
				String sql ="select count(*) from jjim where id=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, id);
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
		//신간 찜 목록 불러오기
		public ArrayList<Jjim> listJjimNew(String id){
			d.getCon();
			
			ArrayList<Jjim> v = new ArrayList<Jjim>();
			
			try {
				String sql="select * from jjim where kind_big='10' and m_id=?";
				pstmt= d.con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Jjim j = new Jjim();
					j.setCt_uid(rs.getInt("ct_uid"));
					j.setImage(rs.getString("image"));
					j.setM_id(rs.getString("m_id"));
					j.setId(rs.getString("id"));
					j.setUid(rs.getInt("uid"));
					j.setPrice1(rs.getInt("price1"));
					j.setMileage(rs.getInt("mileage"));
					j.setCt_date(rs.getString("ct_date"));
					j.setRef(rs.getInt("ref"));
					j.setSubject(rs.getString("subject"));
					j.setN_writer(rs.getString("n_writer"));
					j.setKind_big(rs.getString("kind_big"));
					
					v.add(j);
				}
				rs.close();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return v;
		}
		
		//중고 찜 목록 불러오기
		public ArrayList<Jjim> listJjimUsed(String id){
			d.getCon();
			
			ArrayList<Jjim> v = new ArrayList<Jjim>();
			
			try {
				String sql="select * from jjim where kind_big='20' and m_id=?";
				pstmt= d.con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Jjim j = new Jjim();
					j.setCt_uid(rs.getInt("ct_uid"));
					j.setImage(rs.getString("image"));
					j.setM_id(rs.getString("m_id"));
					j.setId(rs.getString("id"));
					j.setUid(rs.getInt("uid"));
					j.setPrice1(rs.getInt("price1"));
					j.setMileage(rs.getInt("mileage"));
					j.setCt_date(rs.getString("ct_date"));
					j.setRef(rs.getInt("ref"));
					j.setSubject(rs.getString("subject"));
					j.setN_writer(rs.getString("n_writer"));
					j.setKind_big(rs.getString("kind_big"));
					
					v.add(j);
				}
				rs.close();
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return v;
		}
		//찜 데이터베이스에 해당 찜이 있는지 확인
		public int jjimCount(int uid, String id) {
			d.getCon();
			
			int num=0;
			try {
				String sql = "select * from jjim where uid=? and m_id=?";
				pstmt=d.con.prepareStatement(sql);
				pstmt.setInt(1, uid);
				pstmt.setString(2, id);
				
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
		
		//찜 추가
		public void insertJjim(Item i,String id) {
			d.getCon();
			//System.out.println("===i==:"+i);
			//System.out.println("==id==:"+id);
			try {
				String sql ="insert into jjim values (null,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt= d.con.prepareStatement(sql);
				
				pstmt.setString(1, i.getImage());
				pstmt.setString(2, id);
				pstmt.setString(3, i.getId());
				pstmt.setInt(4, i.getUid());
				pstmt.setInt(5, i.getPrice1());
				pstmt.setInt(6, i.getMileage());
				pstmt.setString(7, i.getSigndate());
				pstmt.setInt(8, i.getRef());
				pstmt.setString(9, i.getN_book());
				pstmt.setString(10, i.getN_writer());
				pstmt.setString(11, i.getKind_big());
				
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//찜 삭제
		public void deleteJjim(int uid,String id){
			d.getCon();
			
			try {
				String sql = "delete from jjim where uid=? and m_id=?";
				pstmt = d.con.prepareStatement(sql);
				
				pstmt.setInt(1, uid);
				pstmt.setString(2, id);
				
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//상품의 찜개수 확인
		public int countjjim(int uid) {
			d.getCon();
			int num = 0;
			try {
				String sql = "select count(*) from jjim where uid=?";
				pstmt=d.con.prepareStatement(sql);
				pstmt.setInt(1, uid);
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
		//찜 선택삭제
		public void deleteJjimSelect(String uid_ch, String id) {
			d.getCon();
			
			try {
				String sql ="delete from jjim where uid=? and m_id=?";
				pstmt= d.con.prepareStatement(sql);
				pstmt.setString(1, uid_ch);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	//마이페이지 판매내역 신품
	public ArrayList<Cart> listSell(String session_id,int startRow,int endRow){
		d.getCon();
		
		ArrayList<Cart> v3 = new ArrayList<Cart>();
		try {
			String sql = "select * from cart c left join item i on c.uid=i.uid where c.id=? and ct_status='완료' and i.kind_big='10' limit ?,?";  
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, session_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
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
		
				v3.add(c);
			}
			rs.close();
			pstmt.close();
			d.con.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v3;
	}
	
	//마이페이지 판매내역 중고
	public ArrayList<Cart> listSellUsed(String session_id,int startRow,int endRow){
		d.getCon();
		
		ArrayList<Cart> v3 = new ArrayList<Cart>();
		try {
			String sql = "select * from cart c left join item i on c.uid=i.uid where c.id=? and ct_status='완료' and i.kind_big='20' limit ?,?";  
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, session_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
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
		
				v3.add(c);
			}
			rs.close();
			pstmt.close();
			d.con.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v3;
	}	
	
	//마이페이지 구매내역중고
	public ArrayList<Cart> listBuyUsed(String session_id,int startRow,int endRow){
		d.getCon();
		
		ArrayList<Cart> v5 = new ArrayList<Cart>();
		try {
//			String sql = "select *,(select n_writer from item where uid=cart.uid ) as n_writer from cart where m_id=? and ct_status='완료'";
			String sql = "select * from cart c left join item i on c.uid=i.uid where m_id=? and ct_status='완료' and i.kind_big='20' limit ?,?";  
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, session_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
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
	
		
				v5.add(c);
			}
			rs.close();
			pstmt.close();
			d.con.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v5;
	}	
	//마이페이지 구매내역중고
	public ArrayList<Cart> listBuy(String session_id,int startRow,int endRow){
		d.getCon();
		
		ArrayList<Cart> v4 = new ArrayList<Cart>();
		try {
//			String sql = "select *,(select n_writer from item where uid=cart.uid ) as n_writer from cart where m_id=? and ct_status='완료'";
			String sql = "select * from cart c left join item i on c.uid=i.uid where m_id=? and i.kind_big='10' and ct_status='완료' limit ?,?";  
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, session_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
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
				v4.add(c);
			}
			rs.close();
			pstmt.close();
			d.con.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v4;
	}		
	
	//중고 주문내역 판매자명 조회
	public String selectSaleId(String session_id) {
		d.getCon();
		
		String saleId = "";
		try {
			String sql = "select id from cart ct INNER JOIN order1 od where od.od_id=ct.o_id and od.mb_id=? and od.od_status='완료' and ct.ct_order_status='중고'";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, session_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				saleId = rs.getString("id");
			}
			
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return saleId;
	}
	
	//중고 주문내역 상품명 조회
	public String selectSubject(String session_id) {
		d.getCon();
		
		String subject = "";
		try {
			String sql = "select subject from cart ct INNER JOIN order1 od where od.od_id=ct.o_id and od.mb_id=? and od.od_status='완료' and ct.ct_order_status='중고'";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, session_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				subject = rs.getString("subject");
			}
			
			rs.close();
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return subject;
	}	
	
	//카트 상태 취소로
	public void cancelCart(String a) {
		d.getCon();
		try {
			String sql = "update cart set ct_status='취소' where o_id=? and ct_status='주문'";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setString(1, a);
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//마이페이지 구매내역 신품 count
	public int buyCount(String session_id) {		
		d.getCon();		
		
		int num = 0;
		try {
			String sql = "select count(*) from cart c left join item i on c.uid=i.uid where m_id=? and i.kind_big='10' and ct_status='완료'";
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
	
	//마이페이지 구매내역 중고 count
	public int buyUsedCount(String session_id) {		
		d.getCon();		
		
		int num = 0;
		try {
			String sql = "select count(*) from cart c left join item i on c.uid=i.uid where m_id=? and ct_status='완료' and i.kind_big='20'";
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
	
	//마이페이지 판매내역 신품  count
	public int sellCount(String session_id) {		
		d.getCon();		
		
		int num = 0;
		try {
			String sql = "select count(*) from cart c left join item i on c.uid=i.uid where c.id=? and ct_status='완료' and i.kind_big='10'";
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
	
	//마이페이지 판매내역 중고 count
	public int sellUsedCount(String session_id) {		
		d.getCon();		
		
		int num = 0;
		try {
			String sql = "select count(*) from cart c left join item i on c.uid=i.uid where c.id=? and ct_status='완료' and i.kind_big='20'";
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
	
	//비회원 장바구니 목록
	public ArrayList<Cart> listNonMember(String o_id) {
		d.getCon();
		
		ArrayList<Cart> v =  new ArrayList<Cart>();
		
		
		try {
			String sql  = "select *,(select n_writer from item where uid=cart.uid ) as n_writer,(select qty from item where uid=cart.uid) as qtys from cart where o_id=? and ct_status='준비'";
			pstmt=d.con.prepareStatement(sql);
			
			pstmt.setString(1, o_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Cart c = new Cart();
				c.setCt_uid(rs.getInt("ct_uid"));
				c.setO_id(rs.getString("o_id"));
				c.setM_id(rs.getString("id"));
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
				c.setQtys(rs.getInt("qtys"));		
				
				
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
	//비회원 주문완료 카트정보
	public ArrayList<Cart> listNonCart(String non_id) {
		d.getCon();
		ArrayList<Cart> v = new ArrayList<Cart>();
		try {
			String sql ="select * from cart where o_id=?";
			pstmt=d.con.prepareStatement(sql);
			pstmt.setString(1, non_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Cart c = new Cart();
				c.setCt_uid(rs.getInt("ct_uid"));
				c.setO_id(rs.getString("o_id"));
				c.setSubject(rs.getString("subject"));
				c.setId(rs.getString("id"));
				c.setUid(rs.getInt("uid"));
				c.setPrice1(rs.getInt("price1"));
				c.setQty(rs.getInt("qty"));
				c.setCt_status(rs.getString("ct_status"));
				c.setImage(rs.getString("image"));
				c.setCt_order_status(rs.getString("ct_order_status"));
				
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
	//비회원 주문완료 카트정보
		public int cartNum(String id,String o_id) {
			d.getCon();
			int s =0;
			
			String str = " and o_id='"+o_id+"'";
			if(!id.equals("")) {
				str=" and m_id='"+id+"'";
			}
//			System.out.println("str="+str);
			try {
				String sql = "select count(*) from cart where (1)"+str+" and ct_status='준비'";
				pstmt=d.con.prepareStatement(sql);
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
		
	//주문내역상세보기시 총물품의 합
		public int cartSum(String o_id) {
			d.getCon();
			int cartSum = 0;
			
			try {
				String sql = "select sum(price1 * qty) from cart where o_id=?";
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, o_id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					cartSum = rs.getInt(1);
				}
				rs.close();
				pstmt.close();
				d.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return cartSum;
		}
}
