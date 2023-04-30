package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

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


@WebServlet("/member/non_member")
public class NonMemeber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public NonMemeber() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dis = request.getRequestDispatcher("non_member.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String non_id = request.getParameter("non_id");
		OrderDAO dao = new OrderDAO();
		
		int count = dao.countOrder(non_id);
				
		response.setContentType("text/html; charset=utf-8");
		if(count ==0) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('해당 주문번호에 대한 주문내역은 존재하지않습니다.');");
			out.print("history.back();");
			out.print("</script>");
		}else {
			response.sendRedirect("view?non_id="+non_id);
		}
	}

}
