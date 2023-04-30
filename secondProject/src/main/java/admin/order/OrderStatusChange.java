package admin.order;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import dao.ItemDAO;
import dao.MemberDAO;
import dao.OrderDAO;
import model.Cart;
import model.Order;


@WebServlet("/admin/order/statusChange")
public class OrderStatusChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public OrderStatusChange() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Date today = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String signdate = sd.format(today);
		
		
		String ids =  request.getParameter("orderUids");
		String oids = request.getParameter("orderOids");
		
//		System.out.println(ids);
//		System.out.println(oids);
//		
		//카트고유uid
		String[] id_ch = ids.split(",");
		
		//주문번호
		String[] oid_ch = oids.split(",");
		System.out.println(ids);
		System.out.println(oids);
			
		OrderDAO dao = new OrderDAO();
		CartDAO dao2 = new CartDAO();
		MemberDAO dao3 = new MemberDAO();
		ItemDAO dao4 = new ItemDAO();
		
//		for(int i=0; i<oid_ch.length;i++) {
//			dao2.changeCart(oid_ch[i]); //완료로변경
//		} //밑에 changeCart안되면다시 이걸로 변경
		
		//o_id를 넣어서 status를 반환하는 sql문을 만들고 완료가아닐때만 업데이트되도록 설정하자 
		//o_id를 넣어서 status를 반환하는 sql문을 만들고 완료가아닐때만 업데이트되도록 설정하자 
		//o_id를 넣어서 status를 반환하는 sql문을 만들고 완료가아닐때만 업데이트되도록 설정하자 
		//o_id를 넣어서 status를 반환하는 sql문을 만들고 완료가아닐때만 업데이트되도록 설정하자 
		//o_id를 넣어서 status를 반환하는 sql문을 만들고 완료가아닐때만 업데이트되도록 설정하자 
		
	
		String[] cp_id = new String[100]; //파내자 아이디
		int[] cp_price = new int[100]; //판매가격*0.9정산
		int[] cp_qty = new int[100]; //판매수량
		int[] cp_uid = new int[100]; //판매수량에대한 아이템uid
		
		for(int i=0; i<id_ch.length;i++) {
			cp_id[i] = dao2.selectCartCompleteID(oid_ch[i]);
			cp_price[i] = dao2.selectCartCompletePrice(oid_ch[i]);
			cp_qty[i] = dao2.selectCartCompleteQty(oid_ch[i]);
			cp_uid[i] = dao2.selectCartCompleteUid(oid_ch[i]);
		}
		
		int[] sumcp_price_ch = new int[cp_id.length];
		int[] pandasumcp_price_ch = new int[cp_id.length]; //판다의 총수입
		
		for(int i=0; i<id_ch.length;i++) {
			
			sumcp_price_ch[i] = (cp_price[i] * cp_qty[i] * 10 / 9) / 10 * 9 ;	
			
//			System.out.println(s+"======================\\n");
			String s = dao.selectOrderStatus(id_ch[i]);
			if(!s.equals("완료")) {
			dao.UpdateIdPoint(id_ch[i]); //포인트는 그대로 적립가야돼  책판다의 10프로 수입에서 1프로 빼야하는거임
			dao3.insertIncome(cp_id[i],sumcp_price_ch[i]); //완료변경후 수입넣어줌
//			System.out.print(newcp_qty_ch[i]+"<br>");
//			System.out.print(newcp_uid_ch[i]+"<br>");
//			System.out.print(sumcp_price_ch[i]+"<br>");
			dao4.insertQtyPrice(cp_qty[i],sumcp_price_ch[i],cp_uid[i]);
			dao2.changeCart(oid_ch[i],signdate);
			dao.changeOrder(id_ch[i],signdate);
			}
		}
		response.sendRedirect("list");
	}


}
