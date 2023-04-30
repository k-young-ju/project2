package controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

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


@WebServlet("/order/orderViewDetail")
public class OrderViewDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public OrderViewDetail() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String od_id = request.getParameter("od_id");
//		System.out.println(od_id);
//		HttpSession session = request.getSession();
		CartDAO dao = new CartDAO();
		OrderDAO dao2 = new OrderDAO();
		Order ord = new Order();		
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		
			
		//카트부분출력	
		Vector<Cart> ca = dao.selectCartDetail(od_id);
		request.setAttribute("ca", ca);
		
		//카트 상품의 합
		int cartSum = dao.cartSum(od_id);
		
		
		//오더부분출력
		ord = dao2.selectOrderDetail(od_id);
		request.setAttribute("o", ord);
		
		
		String od_point = request.getParameter("od_point");
		String mb_id = request.getParameter("mb_id");
		request.setAttribute("mb_id", mb_id);
		request.setAttribute("od_point", od_point);
		request.setAttribute("cartSum", cartSum);
		request.setAttribute("where", request.getParameter("where"));
		request.setAttribute("pageNum", request.getParameter("pageNum"));
		request.setAttribute("pageName", request.getParameter("pageName"));
		request.setAttribute("option2", request.getParameter("option2"));
		
		
		
		if(mb_id != null && od_point.equals("0")) {
			RequestDispatcher dis = request.getRequestDispatcher("orderViewDetail2.jsp");
			dis.forward(request, response);	
		}else if(!od_point.equals("0")) {
			RequestDispatcher dis = request.getRequestDispatcher("orderViewDetail.jsp");
			dis.forward(request, response);
		}
		
	}


}
