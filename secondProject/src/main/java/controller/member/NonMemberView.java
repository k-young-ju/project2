package controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import dao.ItemDAO;
import dao.OrderDAO;
import model.Cart;
import model.Item;
import model.Order;


@WebServlet("/member/view")
public class NonMemberView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public NonMemberView() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String non_id = request.getParameter("non_id");
		
		System.out.println(non_id);
		OrderDAO dao = new OrderDAO();
		CartDAO daoc = new CartDAO();
		 
		
		Order o = dao.listNonOrder(non_id);
		ArrayList<Cart> v = daoc.listNonCart(non_id);
		System.out.println(v);
		if(o.getOd_status().equals("취소")) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('취소된 주문입니다.');");
			out.print("history.back();");
			out.print("</script>");
		}else {
			request.setAttribute("o", o);
			request.setAttribute("v", v);
			request.setAttribute("non_id", non_id);
			RequestDispatcher dis = request.getRequestDispatcher("non_member_view.jsp");
			dis.forward(request, response);
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
