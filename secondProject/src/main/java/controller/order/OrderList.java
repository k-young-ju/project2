package controller.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dao.ItemDAO;
import dao.MemberDAO;
import dao.OrderDAO;
import model.Cart;
import model.Item;
import model.Member;
import model.Order;


@WebServlet("/order/list")
public class OrderList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public OrderList() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String totals = request.getParameter("totals");
		
		String option = request.getParameter("option");
		request.setAttribute("totals", totals);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		String o_id = (String)session.getAttribute("cart");
		MemberDAO dao2 = new MemberDAO(); 
		int mile = dao2.memberMileage(id);
//		System.out.println(mile);
	
		//마일리지 천원단위로 사용할수있게
		int num2 = (int)Math.floor(mile/1000) * 1000;
		
		request.setAttribute("num2", num2);
		
		
		//카트에서올떄
		if(option.equals("a")) {
			
		request.setCharacterEncoding("utf-8");
		String checkUids = request.getParameter("checkUids");
		request.setAttribute("checkUids", checkUids);
		
		String[] checkOrder = checkUids.split(",",-1);
		int[] newcheckOrder = new int[checkOrder.length];
		
		
		CartDAO dao = new CartDAO();
		int num = dao.cartCount(id,o_id);
				
//			선택하고주문했을떄
			if(!checkUids.equals("")) {

				ArrayList<Cart> v = new ArrayList<Cart>();  
				for(int i=0; i<checkOrder.length;i++) {
					newcheckOrder[i] = Integer.parseInt(checkOrder[i]);

					if(newcheckOrder[i] != 0) {
					dao.listALLLL(id,newcheckOrder[i],o_id);
					v.add(dao.listALLLL(id,newcheckOrder[i],o_id));
					}
				}
				request.setAttribute("v", v);
				request.setAttribute("option", option);
//				System.out.println(v);			
									
			}
		
			//구매자명 출력//
		
			Member m = new Member();
			m = dao2.selectMember(id);
			
			request.setAttribute("m", m);
			request.setAttribute("option", option);
			//		System.out.println(m);
			RequestDispatcher dis = request.getRequestDispatcher("/order/list.jsp");
			dis.forward(request, response);	
		
		}
		
		//바로구매에서올떄
		if(option.equals("b")) {
			
		request.setCharacterEncoding("utf-8");
		int uid = Integer.parseInt(request.getParameter("uid"));
//		System.out.println(uid);
//		System.out.println(id);
		request.setAttribute("uid", uid);
		
		//도서명출력
		CartDAO dao = new CartDAO();
		ArrayList<Cart> v = dao.listALLL(id,uid,o_id);
		
		request.setAttribute("v", v);
		request.setAttribute("option", option);
		
		//결제자명 출력//
//		System.out.println(id);
	
		
		Member m = new Member();
		m = dao2.selectMember(id);
		
		request.setAttribute("m", m);
		request.setAttribute("option", option);
//		System.out.println(m);

		RequestDispatcher dis = request.getRequestDispatcher("/order/list.jsp");
		dis.forward(request, response);			
		}		
		
		//중고바로구매에서올떄
		if(option.equals("c")) {
			
		request.setCharacterEncoding("utf-8");
		int uid = Integer.parseInt(request.getParameter("uid"));
//		System.out.println(uid);
//		System.out.println(id);
		request.setAttribute("uid", uid);
		
		//도서명출력
		CartDAO dao = new CartDAO();
		ArrayList<Cart> v = dao.listALLL(id,uid,o_id);
		
		request.setAttribute("v", v);
		request.setAttribute("option", option);
		
		//결제자명 출력//
//		System.out.println(id);
	
		
		Member m = new Member();
		m = dao2.selectMember(id);
		
		request.setAttribute("m", m);
		request.setAttribute("option", option);
//		System.out.println(m);

		RequestDispatcher dis = request.getRequestDispatcher("/order/list2.jsp");
		dis.forward(request, response);	
		}
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		

		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String signdate = sd.format(today);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
//		double od_price = Double.parseDouble(request.getParameter("od_price"));
		int od_price = Integer.parseInt(request.getParameter("od_price"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		String option = request.getParameter("option");
		String checkUids = request.getParameter("checkUids");
		int totals_before = Integer.parseInt(request.getParameter("totals"));
		int ct_uid = Integer.parseInt(request.getParameter("ct_uid"));
		request.setAttribute("ct_uid", ct_uid);
		int num2 = Integer.parseInt(request.getParameter("num2"));
		int delivery = Integer.parseInt(request.getParameter("delivery"));
		
		int point1c = 0;
		if(request.getParameter("point1") !=null) {
			point1c = Integer.parseInt(request.getParameter("point1"));
		}
		int point1= (int)Math.floor(point1c/1000) * 1000;
	
		int totals = totals_before - point1 + delivery;
//		System.out.println(totals);
		
//		point1 사용포인트 num2 보유마일리지 od_price 총주문금액
		
		if(point1 > num2 || point1 > od_price) {
		out.print("<script>");
		out.print("alert('총 주문금액 : "+od_price+"\\n보유하신 마일리지 : "+num2+"\\n사용 마일리지 : "+point1+"\\n총 주문금액 또는 보유하신 마일리지 이하의 마일리지를 사용하세요');");
		out.print("history.go(-1)");
		out.print("</script>");
		}else{
				
		//주문이 들어올때 카트갱신
		int num = (int)Math.ceil(Math.random() * 1000000000);
		String str4 = "o" + num ;

		String session_cartRese = (String)session.getAttribute("cartRese");
		if(session_cartRese == null){ //장바구니 세션 값이 없다면
			session.setAttribute("cartRese", str4);
		}
		String od_id = (String)session.getAttribute("cartRese");
		double od_point = totals_before * (double)0.01;
		OrderDAO dao = new OrderDAO();
		CartDAO dao3 = new CartDAO();
		ItemDAO dao4 = new ItemDAO();
		
		
		//카트에서 온 후 넘길때
		if(option.equals("a")) {
		
		request.setAttribute("checkUids", checkUids);
//		System.out.println(checkUids);
		
		String[] ct_uids = checkUids.split(",");
		int[] newct_uids = new int[ct_uids.length];
		
		String cp_qty = ""; //판매 수량
		String cp_uid = ""; //판매 수량에 대한 아이템 uid

//			선택하고주문했을떄 cart 주문상태로변경
			if(!checkUids.equals("")) {
			
				
				for(int j=0 ; j<ct_uids.length;j++) {				
					
					cp_qty += dao3.selectCartCompleteQty2(ct_uids[j]);
					cp_uid += dao3.selectCartCompleteUid2(ct_uids[j]);			//해당 아이템들에 대한 uid
				}
				
				String[] cp_qty_ch = cp_qty.split(",");
				String[] cp_uid_ch = cp_uid.split(",");
				int[] newcp_qty_ch = new int[cp_qty_ch.length];
				int[] newcp_uid_ch = new int[cp_uid_ch.length];
				
				for(int j=0; j<cp_qty_ch.length;j++) {
					
					newcp_qty_ch[j] = Integer.parseInt(cp_qty_ch[j]);
					newcp_uid_ch[j] = Integer.parseInt(cp_uid_ch[j]);  
								
					int qty = dao4.compareQty(newcp_uid_ch[j]);
					System.out.println(newcp_qty_ch[j]);//카트수
					System.out.println(qty);//재고
					
					if((int)newcp_qty_ch[j] > (int)qty) {
						System.out.println(qty);
						out.print("<script>");
						out.print("alert('재고 부족, 장바구니로 이동합니다.');");
						out.print("location.href='/cart/list'");
						out.print("</script>");
						
						return;
					}else{
					dao4.minusQtyItem(newcp_qty_ch[j],newcp_uid_ch[j]);
					}
					

				}
				
				for(int i=0; i<ct_uids.length;i++) {
					newct_uids[i] = Integer.parseInt(ct_uids[i]);
					
//					System.out.println(ct_uids[i]);
//					System.out.println(newct_uids[i]);
					
					if(newct_uids[i] != 0) {
					dao.statusChange(newct_uids[i],od_id);
					
//					System.out.println(i);
					//지금 판매가격이 판매수량 곱해서 수입으로 안넘어감  곱해줘야된다.

					}	

				}	
				
			}
		}		
		
		int qty = Integer.parseInt(request.getParameter("qty"));
		
		//바로구매에서 온 후 넘길때
		if(option.equals("b")) {
			dao.viewCartUpdate(uid,od_id);
			dao4.minusQtyItemDirect(qty,uid);
		}
		//중고품 바로구매에서 온 후 넘길때
		String kind_big = "";
		if(option.equals("c")) {
			
			int itemQty = dao4.selectQty(uid);
			out.print(itemQty);
			if(itemQty < 1) {
				out.print("<script>");
				out.print("alert('재고가 없습니다.');");
				out.print("history.go(-2)");
				out.print("</script>");
				return;
			}
			
			dao.viewCartUpdate(uid,od_id);
			kind_big = dao4.selectKind_big(uid);
			dao4.minusQtyItemDirect(qty,uid);
			
			
			
			
			Order o = new Order();
			
			o.setOd_id(od_id);
			o.setMb_id(id);
			o.setOd_price((int)totals);
			o.setOd_status("주문");
			o.setOd_point(0);		
			o.setOd_name(request.getParameter("od_name"));
			o.setOd_phone(request.getParameter("od_phone"));
			o.setOd_zip(request.getParameter("zipcode"));
			o.setOd_addr1(request.getParameter("zipcode1"));
			o.setOd_addr2(request.getParameter("zipcode2"));
			o.setOd_addr3(request.getParameter("zipcode3"));
			o.setOd_addr4(request.getParameter("zipcode4"));
			
			o.setOd_b_name(request.getParameter("od_b_name"));
			o.setOd_b_phone(request.getParameter("od_b_phone"));
			o.setOd_b_zip(request.getParameter("zipcode_b"));
			o.setOd_b_addr1(request.getParameter("zipcode1_b"));
			o.setOd_b_addr2(request.getParameter("zipcode2_b"));
			o.setOd_b_addr3(request.getParameter("zipcode3_b"));
			o.setOd_b_addr4(request.getParameter("zipcode4_b"));
			o.setRequire1(request.getParameter("require1"));			
			o.setSigndate(signdate);

		}
		
		
		MemberDAO dao2 = new MemberDAO();
		dao2.memberMileageMinus(id,point1);
		
		Order o = new Order();
		
		o.setOd_id(od_id);
		o.setMb_id(id);
		o.setOd_price((int)totals);
		if(kind_big.equals("20")){
			o.setOd_point(0);
		}else {
			o.setOd_point((int)od_point);	
		}
		if(id == null) {
	         o.setOd_point(0);
	    }
		o.setOd_status("주문");
		
		o.setOd_name(request.getParameter("od_name"));
		o.setOd_phone(request.getParameter("od_phone"));
		o.setOd_zip(request.getParameter("zipcode"));
		o.setOd_addr1(request.getParameter("zipcode1"));
		o.setOd_addr2(request.getParameter("zipcode2"));
		o.setOd_addr3(request.getParameter("zipcode3"));
		o.setOd_addr4(request.getParameter("zipcode4"));
		
		o.setOd_b_name(request.getParameter("od_b_name"));
		o.setOd_b_phone(request.getParameter("od_b_phone"));
		o.setOd_b_zip(request.getParameter("zipcode_b"));
		o.setOd_b_addr1(request.getParameter("zipcode1_b"));
		o.setOd_b_addr2(request.getParameter("zipcode2_b"));
		o.setOd_b_addr3(request.getParameter("zipcode3_b"));
		o.setOd_b_addr4(request.getParameter("zipcode4_b"));
		o.setRequire1(request.getParameter("require1"));
		
		o.setSigndate(signdate);

		dao.insertOrder(o,point1);
		//session.removeAttribute("cartRese");
		response.sendRedirect("view?uid="+uid+"&option="+option+"&checkUids="+checkUids+"&totals="+totals+"&ct_uid="+ct_uid+"&totals_before="+totals_before+"&point1="+point1);
		}	
	}
}
