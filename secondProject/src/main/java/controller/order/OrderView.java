package controller.order;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dao.OrderDAO;
import model.Cart;
import model.Order;


@WebServlet("/order/view")
public class OrderView extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderView() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
	
		int uid = Integer.parseInt(request.getParameter("uid"));
		int totals = Integer.parseInt(request.getParameter("totals"));
		String option = request.getParameter("option");
		String checkUids = request.getParameter("checkUids");
		int ct_uid = Integer.parseInt(request.getParameter("ct_uid"));
		int point1 = Integer.parseInt(request.getParameter("point1"));
		int totals_before = Integer.parseInt(request.getParameter("totals_before"));
			
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");	
		String od_id = (String)session.getAttribute("cartRese");
		CartDAO dao = new CartDAO();
		OrderDAO dao2 = new OrderDAO();
		
		request.setAttribute("od_id", od_id);
		request.setAttribute("totals_before", totals_before);
		request.setAttribute("point1", point1);
		request.setAttribute("totals", totals);
		
		
//		장바구니통해서 온 책들 리스트 출력할떄
		if(option.equals("a")) {
			
			
//				선택하고주문했을떄
				if(!checkUids.equals("")) {
					String[] checkOrder = checkUids.split(",",-1);
					int[] newcheckOrder = new int[checkOrder.length];
					
					ArrayList<Cart> v = new ArrayList<Cart>();  
					for(int i=0; i<checkOrder.length;i++) {
						newcheckOrder[i] = Integer.parseInt(checkOrder[i]);
						
						if(newcheckOrder[i] != 0) {
						dao2.viewList(id,newcheckOrder[i],od_id);
						v.add(dao2.viewList(id,newcheckOrder[i],od_id));
						}
					}
					request.setAttribute("v", v);
					
					Order o = dao2.selectOrder(id,od_id);
					request.setAttribute("o", o);
					session.removeAttribute("cart");
					session.removeAttribute("cartRese");
					
					RequestDispatcher dis = request.getRequestDispatcher("/order/view.jsp");
					dis.forward(request, response);										
				}
			dao2.selectOrder(id,od_id);
				
		}
		
//		바로구매에서 온 책들 리스트 출력할때
		if(option.equals("b")) {
			request.setCharacterEncoding("utf-8");			
			request.setAttribute("uid", uid);
			ArrayList<Cart> v = dao2.viewList2(id,uid,ct_uid,od_id);
			
			request.setAttribute("v", v);
			request.setAttribute("option", option);
			

			Order o = dao2.selectOrder(id,od_id);
//			System.out.println(o);
			request.setAttribute("o", o);
			
			session.removeAttribute("cartRese");
			RequestDispatcher dis = request.getRequestDispatcher("/order/view.jsp");
			dis.forward(request, response);
			
		}
		
//		중고바로구매로 온 책들 출력할때
		
//		바로구매에서 온 책들 리스트 출력할때
		if(option.equals("c")) {
			request.setCharacterEncoding("utf-8");			
			request.setAttribute("uid", uid);
			ArrayList<Cart> v = dao2.viewList2(id,uid,ct_uid,od_id);
			
			request.setAttribute("v", v);
			request.setAttribute("option", option);
			

			Order o = dao2.selectOrder(id,od_id);
//			System.out.println(o);
			request.setAttribute("o", o);
			
			session.removeAttribute("cartRese");
			RequestDispatcher dis = request.getRequestDispatcher("/order/view2.jsp");
			dis.forward(request, response);

		}
		

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
