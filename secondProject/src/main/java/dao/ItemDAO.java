package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedList;


import model.Category;
import model.Item;

public class ItemDAO {
		
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	DAO d = new DAO();
	
	//카테고리 등록
	public int categoryInsert(Category c) {
		d.getCon();
		int num=0;		
		try {
			
			String sql = "insert into category values (?,?,?)";
			
			pstmt = d.con.prepareStatement(sql);
			
			pstmt.setString(1, c.getCode());
			pstmt.setString(2, c.getCa_name());
			pstmt.setString(3, c.getUseyn());
			
			num = pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//대분류
	public LinkedList<Category> categoryBig() {
		d.getCon();
		
		LinkedList<Category>  v = new LinkedList<Category>();
		
		try {
			String sql = "select * from category where length(code)=2 and useyn='y'";
			
			pstmt = d.con.prepareStatement(sql);
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
	//중분류
	public LinkedList<Category> categoryMiddle(String code) {
		d.getCon();
		
		LinkedList<Category> v = new LinkedList<Category>();
		
		try {
			String sql = "select * from category where left(code,2)=? and length(code)=4 and useyn='y'";
			
			pstmt=d.con.prepareStatement(sql);
			pstmt.setString(1, code);
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
	//소분류
	public LinkedList<Category> categorySmall(String code) {
		d.getCon();
		
		LinkedList<Category> v = new LinkedList<Category>();
		try {
			String sql = "select * from category where left(code,4)=? and length(code)=6 and useyn='y'";
			
			pstmt= d.con.prepareStatement(sql);
			pstmt.setString(1, code);
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
	//상품등록
	public void insertItem(Item it) {
		d.getCon();
		
		try {
			String sql = "insert into item (kind_big,kind_middle,kind_small,n_book,qty,comment,id,price1,price2,mileage,signdate,image,n_publisher,n_writer,pudate,image2,cmt_main,cmt_sub,cmt_writer,cmt_index) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = d.con.prepareStatement(sql);
			
			pstmt.setString(1, it.getKind_big());
			pstmt.setString(2, it.getKind_middle());
			pstmt.setString(3, it.getKind_small());
			pstmt.setString(4, it.getN_book());
			pstmt.setInt(5, it.getQty());
			pstmt.setString(6, it.getComment());
			pstmt.setString(7, it.getId());
			pstmt.setInt(8, it.getPrice1());
			pstmt.setInt(9, it.getPrice2());
			pstmt.setInt(10, it.getMileage());
			pstmt.setString(11, it.getSigndate());
			pstmt.setString(12, it.getImage());
			pstmt.setString(13, it.getN_publisher());
			pstmt.setString(14, it.getN_writer());
			pstmt.setString(15, it.getPudate());
			pstmt.setString(16,it.getImage2());
			pstmt.setString(17, it.getCmt_main());
			pstmt.setString(18, it.getCmt_sub());
			pstmt.setString(19, it.getCmt_writer());
			pstmt.setString(20, it.getCmt_index());
			
			
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int bestCount(String list_option,String code_middle,String code_small) {		
		d.getCon();		
		
		String middleCode="";
		if(!code_middle.equals("")) {
			middleCode= " and kind_middle='"+code_middle+"'";
		}
		
		String smallCode="";
		
		if(!code_small.equals("")) {
			smallCode= " and kind_small='"+code_small+"'";
		}
		
		String option ="";
					
		if(list_option.equals("3")) {
			option=" and kind_big='20'";
		}else {
			option=" and kind_big='10'";
		}
		
		int num = 0;
				
		try {
			
			String sql = "select count(*) from item where (1) "+option+""+middleCode+""+smallCode+" and useyn='y' order by uid desc";
			if(list_option.equals("1")) {
				sql = "select count(*) from item where (1) and kind_big='10' and useyn='y' order by sellqty desc";
			}
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
	
	public LinkedList<Item> bestList(int startRow,int endRow,String list_option,String code_middle,String code_small) {
		
		d.getCon();
		
		LinkedList<Item> list = new LinkedList<Item>();
		
		String middleCode="";
		if(!code_middle.equals("")) {
			middleCode= " and kind_middle='"+code_middle+"'";
		}
		
		String smallCode="";
		
		if(!code_small.equals("")) {
			smallCode= " and kind_small='"+code_small+"'";
		}
		
		String option ="";
					
		if(list_option.equals("3")) {
			option=" and kind_big='20'";
		}else {
			option=" and kind_big='10'";
		}
		
		java.util.Date today = new java.util.Date(); //현재 날짜

		java.util.Date day = new java.util.Date(today.getTime()); //현재 날짜 
		SimpleDateFormat bbb = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //년-월-일 변경
		String todays = bbb.format(day); //2일전 날짜를 문자열 변수에 대입
		
		try {
			String sql = "select * from item where (1) "+option+""+middleCode+""+smallCode+" and useyn='y' order by uid desc limit ?,?";
			if(list_option.equals("1")) {
				sql = "select * from item where (1) "+option+""+smallCode+" and useyn='y' order by sellqty desc limit ?,?";
			}else if(list_option.equals("3")) {
				sql = "select * from item where (1) "+option+""+middleCode+""+smallCode+" and useyn='y' and qty > 0 order by uid desc limit ?,?";
			}
			
			
			
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Item i = new Item();
				
				i.setKind_big(rs.getString("kind_big"));
				i.setKind_middle(rs.getString("kind_middle"));
				i.setKind_small(rs.getString("kind_small"));
				i.setN_book(rs.getString("n_book"));
				i.setQty(rs.getInt("qty"));
				i.setComment(rs.getString("comment"));
				i.setImage(rs.getString("image"));
				i.setId(rs.getString("id"));
				i.setPrice1(rs.getInt("price1"));
				i.setMileage(rs.getInt("mileage"));
				i.setSigndate(rs.getString("signdate"));
				
				java.util.Date today2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(todays); //현재날짜 산술 가능하게 변환
				
				java.util.Date signdate2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(i.getSigndate()); //작성일 산술 변환
				long diffTime = (long)(today2.getTime() - signdate2.getTime());
								
				if(diffTime < (60*1000)) {
					i.setTime_message("방금전");
				}else if(diffTime >=(60*1000) && diffTime < (60*60*1000)) {
					i.setTime_message((diffTime/(60*1000)) +"분 전");
				}else if(diffTime >=(60*60*1000) && diffTime < 60*60*1000*24) {
					i.setTime_message((diffTime/(60*1000*60)) +"시간 전");
				}else if(diffTime >=(60*60*1000*24) && diffTime < (60*60*1000*24*365)){
					i.setTime_message((diffTime/(60*60*1000*24)) +"일 전");
				}else {
					i.setTime_message((diffTime/(60*60*1000*24*365))+"년 전");
				}
				
				i.setN_publisher(rs.getString("n_publisher"));
				i.setN_writer(rs.getString("n_writer"));
				i.setPudate(rs.getString("pudate"));
				i.setUid(rs.getInt("uid"));
				i.setImage2(rs.getString("image2"));
				i.setCmt_main(rs.getString("cmt_main"));
				i.setCmt_sub(rs.getString("cmt_sub"));
				i.setCmt_writer(rs.getString("cmt_writer"));
				i.setCmt_index(rs.getString("cmt_index"));
				i.setSellqty(rs.getInt("sellqty"));
				i.setQty(rs.getInt("qty"));
				
				list.add(i);
			}
			
			rs.close();
			pstmt.close();
			d.con.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		

	}	
	
	public void listDelete(int uid) {
		d.getCon();
		
		try {
			String sql = "update item set useyn='n' where uid=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			pstmt.executeUpdate();
			
			
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//아이템하나출력한다.
	public Item oneList(int uid) {
		d.getCon();
		
		Item i = new Item();
		try {
			String sql = "select * from item where uid=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				i.setN_book(rs.getString("n_book"));
				i.setN_publisher(rs.getString("n_publisher"));
				i.setN_writer(rs.getString("n_writer"));
				i.setPudate(rs.getString("pudate"));
				i.setPrice1(rs.getInt("price1"));
				i.setComment(rs.getString("comment"));
				i.setImage(rs.getString("image"));
				i.setKind_big(rs.getString("kind_big"));
				i.setKind_middle(rs.getString("kind_middle"));
				i.setKind_small(rs.getString("kind_small"));
				i.setQty(rs.getInt("qty"));
				i.setUseyn(rs.getString("useyn"));
				i.setUid(rs.getInt("uid"));
				i.setSigndate(rs.getString("signdate"));
				i.setMileage(rs.getInt("mileage"));
				i.setImage2(rs.getString("image2"));
				i.setCmt_main(rs.getString("cmt_main"));
				i.setCmt_sub(rs.getString("cmt_sub"));
				i.setCmt_writer(rs.getString("cmt_writer"));
				i.setCmt_index(rs.getString("cmt_index"));
				i.setId(rs.getString("id"));
				i.setRef(rs.getInt("ref"));
				i.setImage3(rs.getString("image3"));
				i.setImage4(rs.getString("image4"));
				i.setImage5(rs.getString("image5"));
			}
			rs.close();
			pstmt.close();
			d.con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	public void updateList(Item i) {
		d.getCon();
		
			try {
//				System.out.println("===============out:"+i.getImage());
				String sql ="";
				if(i.getImage() == null) {
					sql = "update item set pudate=?, n_book=?, n_writer=?, n_publisher=?, price1=?, qty=?, useyn=?, kind_big=?, kind_middle=?, kind_small=?, comment=?, price2=?, mileage=?, cmt_main=?, cmt_sub=?, cmt_writer=?, cmt_index=? where uid=? ";
				}else {
					sql = "update item set pudate=?, n_book=?, n_writer=?, n_publisher=?, price1=?, qty=?, useyn=?, kind_big=?, kind_middle=?, kind_small=?, image='"+i.getImage()+"', image2='"+i.getImage2()+"', comment=?, price2=?, mileage=?, cmt_main=?, cmt_sub=?, cmt_writer=?, cmt_index=? where uid=? ";
				}
				pstmt = d.con.prepareStatement(sql);
				pstmt.setString(1, i.getPudate());
				pstmt.setString(2, i.getN_book());
				pstmt.setString(3, i.getN_writer());
				pstmt.setString(4, i.getN_publisher());
				pstmt.setInt(5, i.getPrice1());
				pstmt.setInt(6, i.getQty());
				pstmt.setString(7, i.getUseyn());
				pstmt.setString(8, i.getKind_big());
				pstmt.setString(9, i.getKind_middle());
				pstmt.setString(10, i.getKind_small());				
				pstmt.setString(11, i.getComment());
				pstmt.setInt(12, i.getPrice1());
				pstmt.setInt(13, i.getMileage());
				pstmt.setString(14, i.getCmt_main());
				pstmt.setString(15, i.getCmt_sub());
				pstmt.setString(16, i.getCmt_writer());
				pstmt.setString(17, i.getCmt_index());
				pstmt.setInt(18, i.getUid());
	
				pstmt.executeUpdate();
				
				pstmt.close();
				d.con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
	}
	
	//상품 조회수 증가처리
	public void updateRef(int uid) {
		d.getCon();
		
		try {
			String sql = "update item set ref=ref+1 where uid=?";
			pstmt = d.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			pstmt.executeUpdate();
			
			pstmt.close();
			d.con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//관리자 상품 선택삭제
			public void deleteItem(String ch_uid) {
				d.getCon();
				
				try {
					String sql = "update item set useyn='n' where uid=?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setString(1, ch_uid);
					pstmt.executeUpdate();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			//관리자 신간 상품목록 리스트
			public ArrayList<Item> adminNewItemAll(int startRow,int endRow) {
				d.getCon();
				ArrayList<Item> itt = new ArrayList<Item>();
							
				try {
					String sql = "select * from item where kind_big='10' order by useyn asc,uid desc limit ?,?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
					
					rs= pstmt.executeQuery();
					
					while(rs.next()) {
						Item ita = new Item();
						ita.setUid(rs.getInt("uid"));
						ita.setKind_big(rs.getString("kind_big"));
						ita.setKind_middle(rs.getString("kind_middle"));
						ita.setKind_small(rs.getString("kind_small"));
						ita.setN_book(rs.getString("n_book"));
						ita.setQty(rs.getInt("qty"));
						ita.setId(rs.getString("id"));
						ita.setComment(rs.getString("comment"));
						ita.setImage(rs.getString("image"));
						ita.setUseyn(rs.getString("useyn"));
						ita.setPrice1(rs.getInt("price1"));
						ita.setPrice2(rs.getInt("price2"));
						ita.setMileage(rs.getInt("mileage"));
						ita.setSigndate(rs.getString("signdate"));
						ita.setN_publisher(rs.getString("n_publisher"));
						ita.setN_writer(rs.getString("n_writer"));
						ita.setPudate(rs.getString("pudate"));
						
						itt.add(ita);
					}
					rs.close();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return itt;
			}
			//관리자 중고상품 리스트
			
			public ArrayList<Item> adminUsedItemAll(int startRow,int endRow) {
				d.getCon();
				ArrayList<Item> itt = new ArrayList<Item>();
							
				try {
					String sql = "select * from item where kind_big='20' order by useyn asc,uid desc limit ?,?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
					
					rs= pstmt.executeQuery();
					
					while(rs.next()) {
						Item ita = new Item();
						ita.setUid(rs.getInt("uid"));
						ita.setKind_big(rs.getString("kind_big"));
						ita.setKind_middle(rs.getString("kind_middle"));
						ita.setKind_small(rs.getString("kind_small"));
						ita.setN_book(rs.getString("n_book"));
						ita.setQty(rs.getInt("qty"));
						ita.setId(rs.getString("id"));
						ita.setComment(rs.getString("comment"));
						ita.setImage(rs.getString("image"));
						ita.setUseyn(rs.getString("useyn"));
						ita.setPrice1(rs.getInt("price1"));
						ita.setPrice2(rs.getInt("price2"));
						ita.setMileage(rs.getInt("mileage"));
						ita.setSigndate(rs.getString("signdate"));
						ita.setN_publisher(rs.getString("n_publisher"));
						ita.setN_writer(rs.getString("n_writer"));
						ita.setPudate(rs.getString("pudate"));
						
						itt.add(ita);
					}
					rs.close();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return itt;
			}
			//관리자 상품목록 count
			public int itemNewCount() {		
				d.getCon();		
				int num = 0;
				try {
					String sql = "select count(*) from item where kind_big='10'";
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
			//관리자 상품목록 count
			public int itemUsedCount() {		
				d.getCon();		
				int num = 0;
				try {
					String sql = "select count(*) from item where kind_big='20'";
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
			
			//마이페이지 상품목록
			public ArrayList<Item> listAll(String session_id) {
				d.getCon();
				
				ArrayList<Item> itt = new ArrayList<Item>();
				
				try {
					String sql = "select * from item where id=?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setString(1, session_id);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						Item ita = new Item();
						ita.setUid(rs.getInt("uid"));
						ita.setKind_big(rs.getString("kind_big"));
						ita.setKind_middle(rs.getString("kind_middle"));
						ita.setKind_small(rs.getString("kind_small"));
						ita.setN_book(rs.getString("n_book"));
						ita.setQty(rs.getInt("qty"));
						ita.setComment(rs.getString("comment"));
						ita.setImage(rs.getString("image"));
						ita.setUseyn(rs.getString("useyn"));
						ita.setPrice1(rs.getInt("price1"));
						ita.setPrice2(rs.getInt("price2"));
						ita.setMileage(rs.getInt("mileage"));
						ita.setSigndate(rs.getString("signdate"));
						ita.setN_publisher(rs.getString("n_publisher"));
						ita.setN_writer(rs.getString("n_writer"));
						ita.setPudate(rs.getString("pudate"));
						
						itt.add(ita);
					}
					rs.close();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return itt;
			}

			//마이페이지 신간 리스트
			public ArrayList<Item> listNew(String session_id,int startRow,int endRow){
				d.getCon();
				
				ArrayList<Item> v = new ArrayList<Item>();
				try {
					String sql ="select * from item where id=? and kind_big='10' order by uid desc limit ?,?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setString(1, session_id);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						Item ita = new Item();
						ita.setUid(rs.getInt("uid"));
						ita.setKind_big(rs.getString("kind_big"));
						ita.setKind_middle(rs.getString("kind_middle"));
						ita.setKind_small(rs.getString("kind_small"));
						ita.setN_book(rs.getString("n_book"));
						ita.setQty(rs.getInt("qty"));
						ita.setComment(rs.getString("comment"));
						ita.setImage(rs.getString("image"));
						ita.setUseyn(rs.getString("useyn"));
						ita.setPrice1(rs.getInt("price1"));
						ita.setPrice2(rs.getInt("price2"));
						ita.setMileage(rs.getInt("mileage"));
						ita.setSigndate(rs.getString("signdate"));
						ita.setN_publisher(rs.getString("n_publisher"));
						ita.setN_writer(rs.getString("n_writer"));
						ita.setPudate(rs.getString("pudate"));
						
						v.add(ita);
					}
					rs.close();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return v;
			}
			//중고 리스트
			public ArrayList<Item> listUsed(String session_id,int startRow,int endRow){
				d.getCon();
				
				ArrayList<Item> v = new ArrayList<Item>();
				
				try {
					String sql ="select * from item where id=? and kind_big='20' order by uid desc limit ?,?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setString(1, session_id);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						Item ita = new Item();
						ita.setUid(rs.getInt("uid"));
						ita.setKind_big(rs.getString("kind_big"));
						ita.setKind_middle(rs.getString("kind_middle"));
						ita.setKind_small(rs.getString("kind_small"));
						ita.setN_book(rs.getString("n_book"));
						ita.setQty(rs.getInt("qty"));
						ita.setComment(rs.getString("comment"));
						ita.setImage(rs.getString("image"));
						ita.setUseyn(rs.getString("useyn"));
						ita.setPrice1(rs.getInt("price1"));
						ita.setPrice2(rs.getInt("price2"));
						ita.setSigndate(rs.getString("signdate").substring(0,10));
						ita.setId(session_id);
											
						v.add(ita);
					}
					rs.close();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return v;
			}
			
			//마이페이지 상품정보 한개 가져오기
			public Item oneItem(int uid) {
				d.getCon();
				
				Item it = new Item();
				
				try {
					String sql = "select * from item where uid=?";
									
					pstmt =d.con.prepareStatement(sql);
					
					pstmt.setInt(1, uid);
					rs=pstmt.executeQuery();
								
					while(rs.next()) {
						it.setUid(rs.getInt("uid"));
						it.setKind_big(rs.getString("kind_big"));
						it.setKind_middle(rs.getString("kind_middle"));
						it.setKind_small(rs.getString("kind_small"));
						it.setN_book(rs.getString("n_book"));
						it.setQty(rs.getInt("qty"));
						it.setComment(rs.getString("comment"));
						it.setImage(rs.getString("image"));
						it.setUseyn(rs.getString("useyn"));
						it.setId(rs.getString("id"));
						it.setPrice1(rs.getInt("price1"));
						it.setN_publisher(rs.getString("n_publisher"));
						it.setN_writer(rs.getString("n_writer"));
						it.setPudate(rs.getString("pudate"));
						it.setImage2(rs.getString("image2"));
						it.setImage3(rs.getString("image3"));
						it.setImage4(rs.getString("image4"));
						it.setImage5(rs.getString("image5"));
						it.setCmt_index(rs.getString("cmt_index"));
						it.setCmt_main(rs.getString("cmt_main"));
						it.setCmt_sub(rs.getString("cmt_sub"));
						it.setCmt_writer(rs.getString("cmt_writer"));
						
					}
					rs.close();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return it;
			}
			//상품 수정시 카테고리 대분류 글변환
			public Category categoryKindBig(String kind_big) {
				d.getCon();
				
				Category cb = new Category();
				
				try {
					String sql = "select * from category where code=?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setString(1, kind_big);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						cb.setCa_name(rs.getString("ca_name"));
					}
					rs.close();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return cb;
			}
			//상품 수정시 카테고리 중분류 글변환
			public Category categoryKindMiddle(String kind_middle) {
				d.getCon();
				
				Category cm = new Category();
				
				try {
					String sql = "select * from category where code=?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setString(1, kind_middle);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						cm.setCa_name(rs.getString("ca_name"));
					}
					rs.close();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return cm;
			}
			 //상품 수정 시 카테고리 소분류 글변환
			public Category categoryKindSmall(String kind_small) {
				d.getCon();
				
				Category cs = new Category();
				
				try {
					String sql = "select * from category where code=?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setString(1, kind_small);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						cs.setCa_name(rs.getString("ca_name"));
					}
					rs.close();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return cs;
			}			
			 //주문페이지에서 아이템 조회 테스트용임 사용 XXXXXXXXXXXXX
			public Item selectWriter(int newWriter_list) {
				d.getCon();
				Item it = new Item();
				
				try {			
					String sql = "select * from item where uid=?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setInt(1, newWriter_list);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						it.setN_writer(rs.getString("n_writer"));
						it.setN_publisher(rs.getString("n_publisher"));
						it.setN_book(rs.getString("n_book"));
					}
					rs.close();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return it;
			}
			
			//재고수량 비교용 바로구매시 uid하나받아서
			public int selectQty(int uid) {
				d.getCon();
				int num = 0;
				
				try {			
					String sql = "select qty from item where uid=?";
					pstmt = d.con.prepareStatement(sql);
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
//				System.out.println(num);
				return num;
			}
			//재고수량 비교용 장바구니에서 구매시 배열로받아서
			public String selectQty2(int newUids_ch) {
				d.getCon();
				String qty = "";
				
				try {			
					String sql = "select qty from item where uid=?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setInt(1, newUids_ch);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						qty = rs.getString(1);
					}
					rs.close();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
//				System.out.println(qty);
				return qty;
			}	
					
			//마이페이지 상품 등록부분 삭제
			public void deleteProduct(int uid) {
				d.getCon();
				
				try {
					String sql = "delete from item where uid=?";
					pstmt=d.con.prepareStatement(sql);
					
					pstmt.setInt(1, uid);
					pstmt.executeUpdate();
					
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}		
			
			//관리자페이지에서 완료변경시 아이템의 sellqty, sellprice,업데이트
			public void insertQtyPrice(int newcp_qty_ch,int sumcp_price_ch,int newcp_uid_ch) {
				d.getCon();
				
				try {
					String sql = "update item set sellqty = sellqty + ?,sellprice = sellprice + ? where uid=?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setInt(1, newcp_qty_ch);
					pstmt.setInt(2, sumcp_price_ch);
					pstmt.setInt(3, newcp_uid_ch);
					pstmt.executeUpdate();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			//중고 등록
			public void insertUsed(Item it) {
				d.getCon();
				
				try {
					String sql = "insert into item (kind_big,kind_middle,kind_small,n_book,comment,id,price1,price2,signdate,image,image2,image3,image4,image5,qty) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					pstmt= d.con.prepareStatement(sql);
					pstmt.setString(1, it.getKind_big());
					pstmt.setString(2, it.getKind_middle());
					pstmt.setString(3, it.getKind_small());
					pstmt.setString(4, it.getN_book());
					pstmt.setString(5, it.getComment());
					pstmt.setString(6, it.getId());
					pstmt.setInt(7, it.getPrice1());
					pstmt.setInt(8, it.getPrice2());
					pstmt.setString(9, it.getSigndate());
					pstmt.setString(10, it.getImage());
					pstmt.setString(11,it.getImage2());
					pstmt.setString(12,it.getImage3());
					pstmt.setString(13,it.getImage4());
					pstmt.setString(14,it.getImage5());
					pstmt.setInt(15, 1);
					pstmt.executeUpdate();
					
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
				e.printStackTrace();
				}
			}
			
			//상품수정
			public void updateItem(Item it,int uid,String image_re,String image_re2) {
				d.getCon();
				
				try {
					
					String str = ",image='"+image_re+"'";
					if(image_re == null){
						str ="";
					}
					String str2 = ",image2='"+image_re2+"'";
					if(image_re2 == null){
						str2 ="";
					}
					
									
					String sql ="update item set kind_big=?,kind_middle=?,kind_small=?,n_book=?,qty=?,comment=?"+str+",price1=?,price2=?,mileage=?,n_publisher=?,n_writer=?,pudate=?"+str2+",cmt_main=?,cmt_sub=?,cmt_writer=?,cmt_index=?,useyn=? where uid=?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setString(1, it.getKind_big());
					pstmt.setString(2, it.getKind_middle());
					pstmt.setString(3, it.getKind_small());
					pstmt.setString(4, it.getN_book());
					pstmt.setInt(5, it.getQty());
					pstmt.setString(6, it.getComment());
					pstmt.setInt(7, it.getPrice1());
					pstmt.setInt(8, it.getPrice2());
					pstmt.setInt(9, it.getMileage());
					pstmt.setString(10, it.getN_publisher());
					pstmt.setString(11, it.getN_writer());
					pstmt.setString(12, it.getPudate());
					pstmt.setString(13, it.getCmt_main());
					pstmt.setString(14, it.getCmt_sub());
					pstmt.setString(15, it.getCmt_writer());
					pstmt.setString(16, it.getCmt_index());
					pstmt.setString(17, it.getUseyn());	
					pstmt.setInt(18, uid);
									
					pstmt.executeUpdate();
					
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			//중고 판매 상품 수정
			public void updateUsed(int uid,Item it,String image_re,String image_re2,String image_re3,String image_re4,String image_re5) {
				d.getCon();
				
				try {
					
					String str = ",image='"+image_re+"'";
					if(image_re == null){
						str ="";
					}
					String str2 = ",image2='"+image_re2+"'";
					if(image_re2 == null){
						str2 ="";
					}
					String str3 = ",image3='"+image_re3+"'";
					if(image_re3 == null){
						str3 ="";
					}
					String str4 = ",image4='"+image_re4+"'";
					if(image_re4 == null){
						str4 ="";
					}
					String str5 = ",image5='"+image_re5+"'";
					if(image_re5 == null){
						str5 ="";
					}
					
					String sql = "update item set kind_middle=?,kind_small=?"+str+""+str2+""+str3+""+str4+""+str5+",n_book=?,price1=?,price2=?,comment=?,useyn=? where uid=?";
					pstmt= d.con.prepareStatement(sql);
					pstmt.setString(1, it.getKind_middle());
					pstmt.setString(2, it.getKind_small());
					pstmt.setString(3, it.getN_book());
					pstmt.setInt(4, it.getPrice1());
					pstmt.setInt(5, it.getPrice2());
					pstmt.setString(6, it.getComment());
					pstmt.setString(7, it.getUseyn());
					pstmt.setInt(8, uid);
					
					pstmt.executeUpdate();
					
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}		
			//카트를통한 결제시 아이템 재고 - 처리 
			public void minusQtyItem(int newcp_qty_ch,int newcp_uid_ch) {
				d.getCon();
				
				try {
					String sql = "update item set qty = qty - ? where uid = ?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setInt(1, newcp_qty_ch);
					pstmt.setInt(2, newcp_uid_ch);
					pstmt.executeUpdate();				
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			public int compareQty(int newcp_uid_ch) {
				d.getCon();
				
				int qty = 0;
				
				try {
					String sql = "select qty from item where uid = ?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setInt(1, newcp_uid_ch);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						qty = rs.getInt("qty");
					}
					rs.close();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return qty;
			}
			
			public String selectKind_big(int uid) {
				d.getCon();
				String kb = "";
				try {
					String sql = "select kind_big from item where uid=?";
					pstmt= d.con.prepareStatement(sql);
					pstmt.setInt(1, uid);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						kb = rs.getString(1)	;
					}
					rs.close();
					pstmt.close();
					d.con.close();					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return kb;
			}
			
			//바로구매를통한
			public void minusQtyItemDirect(int qty,int uid) {
				d.getCon();
				
				try {
					String sql = "update item set qty = qty - ? where uid = ?";
					pstmt = d.con.prepareStatement(sql);
					pstmt.setInt(1, qty);
					pstmt.setInt(2, uid);
					pstmt.executeUpdate();				
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			//통합 검색 신간 상품 있는지 확인
			public int searchCountNewItem(String t_search) {
				d.getCon();
				int num = 0;
				
				try {
					String sql = "select count(*) from item where kind_big='10' and useyn='y' and (n_book like '%"+t_search+"%' or comment like '%"+t_search+"%' or n_publisher like '%"+t_search+"%' or n_writer like '%"+t_search+"%' or cmt_main like '%"+t_search+"%' or cmt_sub like '%"+t_search+"%' or cmt_writer like '%"+t_search+"%' or cmt_index like '%"+t_search+"%')";
					pstmt= d.con.prepareStatement(sql);
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
			//통합 검색 신간 상품 부분
			public ArrayList<Item> totalSearchNewItem(int startRowNew,int endRowNew,String t_search) {
				d.getCon();
				ArrayList<Item> v = new ArrayList<Item>();
				
				try {
					String sql = "select * from item where kind_big='10' and useyn='y' and (n_book like '%"+t_search+"%' or comment like '%"+t_search+"%' or n_publisher like '%"+t_search+"%' or n_writer like '%"+t_search+"%' or cmt_main like '%"+t_search+"%' or cmt_sub like '%"+t_search+"%' or cmt_writer like '%"+t_search+"%' or cmt_index like '%"+t_search+"%') order by uid desc limit ?,?";
					pstmt= d.con.prepareStatement(sql);
					pstmt.setInt(1, startRowNew);
					pstmt.setInt(2, endRowNew);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						Item i = new Item();
						i.setUid(rs.getInt("uid"));
						i.setImage(rs.getString("image"));
						i.setN_book(rs.getString("n_book"));
						i.setComment(rs.getString("comment"));
						i.setPrice1(rs.getInt("price1"));
						i.setMileage(rs.getInt("mileage"));
						i.setSigndate(rs.getString("signdate"));
						i.setN_publisher(rs.getString("n_publisher"));
						i.setN_writer(rs.getString("n_writer"));
						i.setPudate(rs.getString("pudate"));
						i.setCmt_main(rs.getString("cmt_main"));
						i.setCmt_sub(rs.getString("cmt_sub"));
						i.setCmt_writer(rs.getString("cmt_writer"));
						i.setCmt_index(rs.getString("cmt_index"));
						i.setUseyn(rs.getString("useyn"));
						i.setQty(rs.getInt("qty"));
						i.setSellqty(rs.getInt("sellqty"));
						
						v.add(i);
						
					}
					rs.close();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return v;
			}
			//통합검색 중고상품 있는지 확인
			public int searchCountUsedItem(String t_search) {
				d.getCon();
				int num = 0;
				
				try {
					String sql = "select count(*) from item where kind_big='20' and useyn='y' and (n_book like '%"+t_search+"%' or comment like '%"+t_search+"%' or n_publisher like '%"+t_search+"%' or n_writer like '%"+t_search+"%' or cmt_main like '%"+t_search+"%' or cmt_sub like '%"+t_search+"%' or cmt_writer like '%"+t_search+"%' or cmt_index like '%"+t_search+"%')";
					pstmt= d.con.prepareStatement(sql);
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
			//통합 검색 중고상품 부분
			public ArrayList<Item> totalSearchUsedItem(int startRowUsed,int endRowUsed,String t_search) {
				d.getCon();
				ArrayList<Item> v = new ArrayList<Item>();
				
				try {
					String sql = "select * from item where kind_big='20' and useyn='y' and qty>0 and (n_book like '%"+t_search+"%' or comment like '%"+t_search+"%' or n_publisher like '%"+t_search+"%' or n_writer like '%"+t_search+"%' or cmt_main like '%"+t_search+"%' or cmt_sub like '%"+t_search+"%' or cmt_writer like '%"+t_search+"%' or cmt_index like '%"+t_search+"%') order by uid desc limit ?,?";
					pstmt= d.con.prepareStatement(sql);
					pstmt.setInt(1, startRowUsed);
					pstmt.setInt(2, endRowUsed);
				
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						Item i = new Item();
						
						i.setUid(rs.getInt("uid"));
						i.setImage(rs.getString("image"));
						i.setN_book(rs.getString("n_book"));
						i.setComment(rs.getString("comment"));
						i.setPrice1(rs.getInt("price1"));
						i.setMileage(rs.getInt("mileage"));
						i.setSigndate(rs.getString("signdate"));
						i.setN_publisher(rs.getString("n_publisher"));
						i.setN_writer(rs.getString("n_writer"));
						i.setPudate(rs.getString("pudate"));
						i.setCmt_main(rs.getString("cmt_main"));
						i.setCmt_sub(rs.getString("cmt_sub"));
						i.setCmt_writer(rs.getString("cmt_writer"));
						i.setCmt_index(rs.getString("cmt_index"));
						i.setUseyn(rs.getString("useyn"));
						i.setQty(rs.getInt("qty"));
						i.setSellqty(rs.getInt("sellqty"));
						
						v.add(i);
						
					}
					rs.close();
					pstmt.close();
					d.con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return v;
			}
			//메인화면 베스트셀러 리스트 출력 1~6
			public ArrayList<Item> listLimitBestItemOne(){
				d.getCon();
				ArrayList<Item> v = new ArrayList<Item>();
				try {
					String sql = "select * from item where kind_big='10' and sellqty>=1 and useyn='y' order by sellqty desc limit 0,6";
					pstmt = d.con.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						Item i = new Item();
						i.setUid(rs.getInt("uid"));
						i.setImage(rs.getString("image"));
//						if(rs.getString("n_book").length() >16)
						i.setN_book(rs.getString("n_book"));
						i.setN_writer(rs.getString("n_writer"));
						i.setPrice1(rs.getInt("price1"));
						i.setQty(rs.getInt("qty"));
						
						v.add(i);
					}
					rs.close();
					pstmt.close();
					d.con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return v;
			}
			
			//메인화면 베스트셀러 리스트 출력 7부터 6개
			public ArrayList<Item> listLimitBestItemTwo(){
				d.getCon();
				ArrayList<Item> v = new ArrayList<Item>();
				try {
					String sql = "select * from item where kind_big='10' and sellqty>=1 and useyn='y' order by sellqty desc limit 7,6";
					pstmt = d.con.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						Item i = new Item();
						i.setUid(rs.getInt("uid"));
						i.setImage(rs.getString("image"));
						i.setN_book(rs.getString("n_book"));
						i.setN_writer(rs.getString("n_writer"));
						i.setPrice1(rs.getInt("price1"));
						
						v.add(i);
					}
					rs.close();
					pstmt.close();
					d.con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return v;
			}
			
			//메인화면 베스트셀러 리스트 출력 13부터 6개
			public ArrayList<Item> listLimitBestItemThree(){
				d.getCon();
				ArrayList<Item> v = new ArrayList<Item>();
				try {
					String sql = "select * from item where kind_big='10' and sellqty>=1 and useyn='y' order by sellqty desc limit 13,6";
					pstmt = d.con.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						Item i = new Item();
						i.setUid(rs.getInt("uid"));
						i.setImage(rs.getString("image"));
						i.setN_book(rs.getString("n_book"));
						i.setN_writer(rs.getString("n_writer"));
						i.setPrice1(rs.getInt("price1"));
						
						v.add(i);
					}
					rs.close();
					pstmt.close();
					d.con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return v;
			}
			//신간 상품 리스트 1~6
			public ArrayList<Item> listLimitNewItemOne(){
				d.getCon();
				ArrayList<Item> v = new ArrayList<Item>();
				try {
					String sql = "select * from item where kind_big='10' and useyn='y' order by uid desc limit 0,6";
					pstmt = d.con.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						Item i = new Item();
						i.setUid(rs.getInt("uid"));
						i.setImage(rs.getString("image"));
						i.setN_book(rs.getString("n_book"));
						i.setN_writer(rs.getString("n_writer"));
						i.setPrice1(rs.getInt("price1"));
						
						v.add(i);
					}
					rs.close();
					pstmt.close();
					d.con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return v;
			}
			//신간 상품 리스트 7~6개
			public ArrayList<Item> listLimitNewItemTwo(){
				d.getCon();
				ArrayList<Item> v = new ArrayList<Item>();
				try {
					String sql = "select * from item where kind_big='10' and useyn='y' order by uid desc limit 7,6";
					pstmt = d.con.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						Item i = new Item();
						i.setUid(rs.getInt("uid"));
						i.setImage(rs.getString("image"));
						i.setN_book(rs.getString("n_book"));
						i.setN_writer(rs.getString("n_writer"));
						i.setPrice1(rs.getInt("price1"));
						
						v.add(i);
					}
					rs.close();
					pstmt.close();
					d.con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return v;
			}
			//신간 상품 리스트 13~6
			public ArrayList<Item> listLimitNewItemThree(){
				d.getCon();
				ArrayList<Item> v = new ArrayList<Item>();
				try {
					String sql = "select * from item where kind_big='10' and useyn='y' order by uid desc limit 13,6";
					pstmt = d.con.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						Item i = new Item();
						i.setUid(rs.getInt("uid"));
						i.setImage(rs.getString("image"));
						i.setN_book(rs.getString("n_book"));
						i.setN_writer(rs.getString("n_writer"));
						i.setPrice1(rs.getInt("price1"));
						
						v.add(i);
					}
					rs.close();
					pstmt.close();
					d.con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return v;
			}
			//중고상품 1~6
			public ArrayList<Item> listLimitUsedItemOne(){
				d.getCon();
				ArrayList<Item> v = new ArrayList<Item>();
				try {
					String sql = "select * from item where kind_big='20' and useyn='y' order by uid desc limit 0,6";
					pstmt = d.con.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						Item i = new Item();
						i.setUid(rs.getInt("uid"));
						i.setImage(rs.getString("image"));
						i.setId(rs.getString("id"));
						i.setN_book(rs.getString("n_book"));
						i.setN_writer(rs.getString("n_writer"));
						i.setPrice1(rs.getInt("price1"));
						
						v.add(i);
					}
					rs.close();
					pstmt.close();
					d.con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return v;
			}
			//중고상품 7~6개
			public ArrayList<Item> listLimitUsedItemTwo(){
				d.getCon();
				ArrayList<Item> v = new ArrayList<Item>();
				try {
					String sql = "select * from item where kind_big='20' and useyn='y' order by uid desc limit 7,6";
					pstmt = d.con.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						Item i = new Item();
						i.setUid(rs.getInt("uid"));
						i.setImage(rs.getString("image"));
						i.setId(rs.getString("id"));
						i.setN_book(rs.getString("n_book"));
						i.setN_writer(rs.getString("n_writer"));
						i.setPrice1(rs.getInt("price1"));
						
						v.add(i);
					}
					rs.close();
					pstmt.close();
					d.con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return v;
			}
			//중고상품 13~6개
			public ArrayList<Item> listLimitUsedItemThree(){
				d.getCon();
				ArrayList<Item> v = new ArrayList<Item>();
				try {
					String sql = "select * from item where kind_big='20' and useyn='y' order by uid desc limit 13,6";
					pstmt = d.con.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						Item i = new Item();
						i.setUid(rs.getInt("uid"));
						i.setImage(rs.getString("image"));
						i.setId(rs.getString("id"));
						i.setN_book(rs.getString("n_book"));
						i.setN_writer(rs.getString("n_writer"));
						i.setPrice1(rs.getInt("price1"));
						
						v.add(i);
					}
					rs.close();
					pstmt.close();
					d.con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return v;
			}		
			
			//마이페이지 상품내역  신품 count
			public int productCount(String session_id) {		
				d.getCon();		
				
				int num = 0;
				try {
					String sql ="select count(*) from item where id=? and kind_big='10' order by uid desc";
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
			
			//마이페이지 상품내역 중고count
			public int productUsedCount(String session_id) {		
				d.getCon();		
				
				int num = 0;
				try {
					String sql ="select count(*) from item where id=? and kind_big='20' order by uid desc";
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
}
