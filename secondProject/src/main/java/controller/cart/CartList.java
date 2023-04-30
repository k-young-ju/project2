package controller.cart;

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
import model.Cart;
import model.Item;


@WebServlet("/cart/list")
public class CartList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CartList() {
        super();
      
    }

	//마이페이지에서 넘어올 때
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		String o_id = (String)session.getAttribute("cart");
		
		CartDAO dao = new CartDAO();
		
		ArrayList<Cart> v = dao.listALL(id);	
		
		ArrayList<Cart> v2 = dao.listNonMember(o_id);
		request.setAttribute("v",v);
		request.setAttribute("v2", v2);
		//System.out.println(v2);
		RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
		dis.forward(request, response);
				
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		String o_id = (String)session.getAttribute("cart");
		
		String uids = request.getParameter("uids");
		
//		상품재고
		String stock = request.getParameter("stock");
//		System.out.println(stock);
//		주문수량
		String qtys = request.getParameter("qtys");
		
		String checkUids = request.getParameter("checkUids");
//		System.out.println(checkUids);
		
		int totals = Integer.parseInt(request.getParameter("total"));
		
	
	
//	qty수동입력시 수량변경처리
		String[] uids_ch = uids.split(",");
		String[] qty_ch = qtys.split(",");
		
		int[] newQty_ch = new int[qty_ch.length];
		int[] newUids_ch = new int[uids_ch.length];
		
		for(int i=0;i<qty_ch.length;i++) {
			newQty_ch[i] = Integer.parseInt(qty_ch[i]);
			newUids_ch[i] = Integer.parseInt(uids_ch[i]);
			
//			System.out.println("=====qty===="+newQty_ch[i]);		
//			System.out.println("====uid==="+newUids_ch[i]);
			CartDAO dao = new CartDAO();
			dao.updateQty(newUids_ch[i],newQty_ch[i],id,o_id);
			
		}
		
//배열로 재고수량보내기후 비교

		
//		System.out.println(qtyS);
		
		
//      테스트용		
		String[] stock_ch = stock.split(",");
			
		int[] newStock_ch = new int[stock_ch.length];
	
		int x = 0;
		int y = 0;
		 
		for(int i=0; i<newUids_ch.length;i++) {
			newStock_ch[i] = Integer.parseInt(stock_ch[i]);
//			System.out.println(newStock_ch[i]);
//			System.out.println(newQty_ch[i]);
			newQty_ch[i] = Integer.parseInt(qty_ch[i]);
			
			if(newQty_ch[i] > newStock_ch[i]) {
				x= i+1;
				out.print("<script>");
				out.print("alert('"+(x)+"번째 상품 : 재고 부족\\n담은 수량 : "+newQty_ch[i]+"\\n현재 재고 : "+newStock_ch[i]+"');");
				out.print("</script>");
				y += 1;
			}	
		}	
		if(y == 0) {
			response.sendRedirect("/order/list?option=a&totals="+totals+"&uids="+uids+"&checkUids="+checkUids);
		}else {
			out.print("<script>");
			out.print("history.go(-1)");
			out.print("</script>");
		}
	}
}
